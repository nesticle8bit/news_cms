$(document).ready(function () {    
    $.ajax({
        url: '/Post/GetTags',
        type: "GET",
        success: function (result) {
            var data = result.data;
            var items = data.map(function (x) { return { item: x }; });

            $('#input-tags').selectize({
                //Json Object
                options: items,

                //Mapping
                labelField: "item",
                valueField: "item",
                sortField: 'item',
                searchField: 'item',

                //Options
                persist: false,
                hideSelected: true,
                maxItems: 6,

                //Plugins
                plugins: ['remove_button'],

                create: function (input) {
                    return {
                        value: input,
                        text: input
                    }
                },
            });
        },
        error: function (err) {
            swal("Error", "We cant get the Tags \n Details: /Post/GetTags" + err.data, "error");
        }
    });

    var wbbOpt = {
        buttons: "bold,italic,underline,strike,sup,sub,|,img,video,link,|,bullist,numlist,|,fontcolor,fontsize,|,justifyleft,justifycenter,justifyright,|,quote,code,table,removeFormat",
    }
    //$("#editor").wysibb(wbbOpt);
    
    //Delete from Database
    $('a#delete').click(function () {
        var id = $(this).data("id");
        console.log(id);

        if (id != undefined) {
            swal({
                title: "Are you sure?",
                text: "You will not be able to recover this post!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Delete",
                cancelButtonText: "Cancel",
                closeOnConfirm: false,
            }, function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        url: '/Post/RemovePost',
                        type: 'POST',
                        data: { id: id }
                    }).success(function (e) {
                        swal("Deleted!", "The Post has been deleted", "success");
                    }).error(function (e) {
                        console.log('Error: ' + e.statusText);
                    });
                }
            });
        }
    });

    //Return to Frontend
    $('a#return').click(function () {
        var id = $(this).data("id");

        if (id != undefined) {
            swal({
                title: "Are you sure?",
                text: "You will return this post to frontend",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Return Post",
                cancelButtonText: "Cancel",
                closeOnConfirm: false,
            }, function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        url: '/Post/ReturnPost',
                        type: 'POST',
                        data: { id: id }
                    }).success(function (e) {
                        swal("Returned!", "This Post has been returned", "success");
                    }).error(function (e) {
                        console.log('Error: ' + e.statusText);
                    });
                }
            });
        }
    });
    
    $('.checkbox').click(function (e) {
        var id     = $(this).find('input[data-id]').data('id');
        var state = $(this).attr('class');

        console.log("ID del Registro " + id + " State = " + state);

        if (id != undefined && state != undefined) {
            if (state.indexOf("checkbox checked") > -1) {
                state = false;
            } else {
                state = true;
            }

            $.ajax({
                url: '/Post/ChangeState',
                type: 'POST',
                data: {
                    id: id,
                    state: state,
                }
            }).success(function (e) {
                swal({
                    title: 'Nothing wrong',
                    text: 'The selected Post has been saved correctly',
                    type: 'success',
                    timer: 1800,
                });
            }).error(function (e) {
                console.log('Error: ' + e.statusText);
            });
        }
    });
});

function expandCommentArea(obj) {
    var parent = $(obj).closest('.post-comment');
    if (!parent.hasClass('active')) {
        $(obj).autosize();
        parent.addClass('active');
    }
    return;
}

function toggle_reply(obj, e) {
    var item = $(obj).closest('.item-is-parent');
    var holder = item.closest('.comments');

    if (holder.find('li[data-reply="true"]').length > 0)
        holder.find('li[data-reply="true"]').remove();
    
    var reply_html = $('.post-comment').clone(true);

    item.after('<li data-reply="true"></li>');
    reply_html.addClass('active');
    holder.find('li[data-reply="true"]').html(reply_html);
    reply_html.find('.submit-comment').attr({ 'onclick': 'post_comment(this, false)' });

    e = e || window.event;
    e.preventDefault();
}

function post_comment(obj, is_comment) {
    var container = $(obj).closest('.post-comment');

    var comment_obj = {
        Comment1: container.find('textarea[name="Comments.Comment1"]').val(),
        Name: container.find('input[name="Comments.Name"]').val(),
        Email: container.find('input[name="Comments.Email"]').val(),
        Website: container.find('input[name="Comments.Website"]').val(),
        Id_Post: $(document).find('input[name="Post.Id"]').val(),
    }

    if (!is_comment) {
        comment_obj.Id_Comment = container.closest('li').prev().attr('data-id');
    }

    $.ajax({
        type: "POST",
        url: "/Comments/Create/",
        data: {
            __RequestVerificationToken: get_token(),
            comment: comment_obj
        },
        dataType: "json"
    })
	.done(function (data) {
	    console.log('done');

	    data.data.is_comment = data.is_comment;
	    data.data.status_code = data.status_code;
	    data.data.role_code = data.role_code;
	    data.data.status = data.status;

	    data.data.Time = new Date(parseInt(data.data.Time.substr(6)));

	    pop_message(container, data.message, data.status, data.data);
	})
	.fail(function (data) {
	    console.log('data failed to load for some reason');
	    console.log(data);
	})
	.always(function (data) {
	    console.log('always');
	    console.log(data);
	});
}

function pop_message(obj, message, status, comment_data) {
    var time = ((status) ? 2000 : 4000);
    var error = ((status) ? "" : "error");
    var html = '<div class="message-wrapper ' + error + '"><span>' + message + '</span></div>';

    $(obj).append(html);
    $(obj).find('.message-wrapper').fadeIn(200);

    setTimeout(function () {
        $(obj).find('.message-wrapper').fadeOut(200, function () {
            $(this).remove();

            if (status == true) {
                clear_comment_box(obj);
                build_comment_html(obj, comment_data);

                console.log("pop_message");
                console.log(obj);
                console.log(comment_data);
                console.log("-------------------------");

                if (!comment_data.is_comment) {
                    $(obj).parent().remove();
                }
            }

        });
    }, time);

}

function clear_comment_box(obj) {
    obj.find('textarea[name="Comments.Comment1"]').val('');
    obj.find('textarea[name="Comments.Name"]').val('');
    obj.find('textarea[name="Comments.Email"]').val('');

    if (obj.hasClass('active')) {
        obj.removeClass('active');
    }
}

function build_comment_html(obj, data) {
    var _comment_attributes = 'class="item-is-parent" data-id="' + data.Id + '"';
    var _info_container = ((data.is_comment && data.status_code == "A") ? '<div class="info-container"><a href="#" class="reply-anchor" onclick="toggle_reply(this)">REPLY</a></div>' : '');
    var _author_structure = ((data.Website == null) ? data.Name : '<a href="' + data.Website + '" target="_blank">' + data.Name + '</a>');
    var _is_administrator = ((data.role_code == "A" || data.role_code == "U") ? '<span class="label blue border-radius-3">WEB DESIGNER</span>' : '');
    var _pending_message = ((data.status_code == "P") ? '<div class="pending-message">Your comment is awaiting moderation. Please be patient, comment moderation might take a bit longer than usual. Thank you!</div>' : '');
    var _is_pending_class = ((data.status_code == "P") ? 'pending' : '');

    var html = '<li ' + ((data.is_comment) ? _comment_attributes : '') + '>' +
					'<div class="comment-item ' + _is_pending_class + '">' +
						'<div class="avatar"><img src="https://pbs.twimg.com/profile_images/671005168356331520/YCp_08J8_400x400.jpg" /></div>' +
						'<div class="data-container">' +
							'<div class="name floatleft">' + _author_structure + _is_administrator + '</div>' +
							'<div class="date floatright">' + data.Time + '</div>' +
							'<div class="clear"></div>' +
							'<div class="message">' + data.Comment1 + '</div>' +
							_pending_message +
							_info_container +
						'</div>' +
						'<div class="clear"></div>' +
					'</div>' +
				'</li>';

    if (data.is_comment) {
        $('.comments').append(html);
    }
    else {
        var comment_container = $('.item-is-parent[data-id="' + data.Id_Comment + '"]');

        console.log("comment_container");
        console.log(comment_container);
        console.log(data.Id_Comment);

        console.log(comment_container);

        if (comment_container.length == 1) {
            if (!comment_container.find('ul').length) {
                comment_container.append('<ul></ul>');
            }
            comment_container.find('ul').append(html);
        }
        else {
            console.log('error please refresh page');
        }
    }
}

//function build_comment_html(obj, data) {
//    var _comment_attributes = 'class="item-is-parent" data-id="' + data.Id + '"';
//    var _info_container = ((data.is_comment && data.role == "Administrator") ? '<div class="info-container"><a href="#" class="reply-anchor" onclick="toggle_reply(this)">REPLY</a></div>' : '');
//    var _author_structure = ((data.Website == null) ? data.Name : '<a href="' + data.Website + '" target="_blank">' + data.Name + '</a>');
//    var _is_administrator = ((data.role == "Administrator" || data.role_code == "Moderator") ? '<span class="label blue border-radius-3">WEB DESIGNER</span>' : '');
//    var _pending_message = ((data.role == "User") ? '<div class="pending-message">Your comment is awaiting moderation. Please be patient, comment moderation might take a bit longer than usual. Thank you!</div>' : '');
//    var _is_pending_class = ((data.role == "User") ? 'pending' : '');

//    var html = '<li ' + ((data.is_comment) ? _comment_attributes : '') + '>' +
//                    '<div class="comment-item ' + _is_pending_class + '">' +
//                        '<div class="avatar"><img src="https://pbs.twimg.com/profile_images/671005168356331520/YCp_08J8_400x400.jpg"></div>' +
//                        '<div class="data-container">' +
//                            '<div class="name floatleft">' + _author_structure + _is_administrator + '</div>' +
//                            '<div class="date floatright">' + data.insert_date + '</div>' +
//                            '<div class="clear"></div>' +
//                            '<div class="message">' + data.Comment1 + '</div>' +
//                            _pending_message +
//                            _info_container +
//                        '</div>' +
//                        '<div class="clear"></div>' +
//                    '</div>' +
//                '</li>';

//    if (data.is_comment) {
//        $('.comments').append(html);
//    }
//    else {
//        var comment_container = $('.item-is-parent[data-id="' + 3 + '"]');

//        if (comment_container.length == 1) {
//            if (!comment_container.find('ul').length) {
//                comment_container.append('<ul></ul>');
//            }
//            comment_container.find('ul').append(html);
//        }
//        else {
//            console.log('error please refresh page!');
//        }
//    }
//}

function get_token() {
    return $('input[name="__RequestVerificationToken"]').val();
}