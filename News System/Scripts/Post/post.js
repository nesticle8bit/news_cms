$(document).ready(function () {    
    $.ajax({
        url: '/Post/GetTags',
        type: "GET",
        success: function (result) {
            var data = result.data;
            var items = data.map(function (x) { return { item: x }; });

            console.log(items);

            $('#input-tags').selectize({
                delimiter: ',',
                persist: false,

                options: items,

                labelField: "item",
                valueField: "item",
                sortField: 'item',
                searchField: 'item',

                maxItems: 5,
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

    $("#editor").wysibb();

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
        var comment_id = item.attr('data-id');
        if (holder.find('li[data-reply="true"]').length > 0) {
            holder.find('li[data-reply="true"]').remove();
        }

        var reply_html = $('.post-comment').clone(true);

        item.after('<li data-reply="true"></li>');
        reply_html.addClass('active');
        holder.find('li[data-reply="true"]').html(reply_html);
        //reply_html.find('.submit-comment').attr({'onclick' : 'post_reply(this, '+ comment_id +');'});
        reply_html.find('.submit-comment').attr({ 'onclick': 'post_comment(this, false)' });

        e = e || window.event;
        e.preventDefault();
    }

    function toggle_reply(obj, e) {
        var item = $(obj).closest('.item-is-parent');
        var holder = item.closest('.comments');
        var comment_id = item.attr('data-id');
        if (holder.find('li[data-reply="true"]').length > 0) {
            holder.find('li[data-reply="true"]').remove();
        }

        var reply_html = $('.post-comment').clone(true);

        item.after('<li data-reply="true"></li>');
        reply_html.addClass('active');
        holder.find('li[data-reply="true"]').html(reply_html);
        //reply_html.find('.submit-comment').attr({'onclick' : 'post_reply(this, '+ comment_id +');'});
        reply_html.find('.submit-comment').attr({ 'onclick': 'post_comment(this, false)' });

        e = e || window.event;
        e.preventDefault();
    }

    function clear_comment_box(obj) {
        obj.find('textarea[name="content"]').val('');

        (obj.find('input[name="url"][readonly]').length == 1) ? '' : obj.find('input[name="email"]').val('');
        (obj.find('input[name="url"][readonly]').length == 1) ? '' : obj.find('input[name="author"]').val('');
        (obj.find('input[name="url"][readonly]').length == 1) ? '' : obj.find('input[name="url"]').val('');


        if (obj.hasClass('active')) {
            obj.removeClass('active');
        }
    }

    function build_comment_html(obj, data) {
        var _comment_attributes = 'class="item-is-parent" data-id="' + data.id + '"';
        var _info_container = ((data.is_comment && data.status_code == "A") ? '<div class="info-container"><a href="#" class="reply-anchor" onclick="toggle_reply(this)">REPLY</a></div>' : '');
        var _author_structure = ((!data.url.length) ? data.author : '<a href="' + data.url + '" target="_blank">' + data.author + '</a>');
        var _is_administrator = ((data.role_code == "A" || data.role_code == "U") ? '<span class="label blue border-radius-3">WEB DESIGNER</span>' : '');
        var _pending_message = ((data.status_code == "P") ? '<div class="pending-message">Your comment is awaiting moderation. Please be patient, comment moderation might take a bit longer than usual. Thank you!</div>' : '');
        var _is_pending_class = ((data.status_code == "P") ? 'pending' : '');

        var html = '<li ' + ((data.is_comment) ? _comment_attributes : '') + '>' +
                        '<div class="comment-item ' + _is_pending_class + '">' +
                            '<div class="avatar"><img src="' + data.thumb + '"></div>' +
                            '<div class="data-container">' +
                                '<div class="name floatleft">' + _author_structure + _is_administrator + '</div>' +
                                '<div class="date floatright">' + data.insert_date + '</div>' +
                                '<div class="clear"></div>' +
                                '<div class="message">' + data.content + '</div>' +
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
            var comment_container = $('.item-is-parent[data-id="' + data.comment_id + '"]');
            console.log(comment_container);
            if (comment_container.length == 1) {
                if (!comment_container.find('ul').length) {
                    comment_container.append('<ul></ul>');
                }
                comment_container.find('ul').append(html);
            }
            else {
                console.log('error please refresh page!!! (icbc frontend.js - build_comment_html())');
            }
        }
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
                    console.log(comment_data);
                    build_comment_html(obj, comment_data);

                    if (!comment_data.is_comment) {
                        $(obj).parent().remove();
                    }
                }

            });
        }, time);

    }

    function post_comment(obj, is_comment) {
        var container = $(obj).closest('.post-comment');

        var comment_obj = {
            csrf_token: csrf_token(),
            content: container.find('textarea[name="content"]').val(),
            email: container.find('input[name="email"]').val(),
            author: container.find('input[name="author"]').val(),
            url: container.find('input[name="url"]').val(),
            is_comment: is_comment,
            article_id: $(document).find('input[name="article_id"]').val()
        }

        if (!is_comment) {
            comment_obj.comment_id = container.closest('li').prev().attr('data-id');
        }

        $.ajax({
            type: "POST",
            url: "/ajaxfrontend/post_comment/",
            data: comment_obj,
            dataType: "json"
        })
        .done(function (data) {
            //done
            console.log('done');
            pop_message(container, data.message, data.status, data.comment_data);
        })
        .fail(function (data) {
            // fail
            console.log('data failed to load for some reason');
            console.log(data);
        })
        .always(function (data) {
            // always
            console.log('always');
            console.log(data);
        });
    }
});
