$(document).ready(function () {
    $(":file").filestyle({ buttonName: "btn-primary" });
});


var social_timer;
$(document).ready(function () {
    if ($('.sidebar-social-carousel').length > 0) {
        social_timer = setInterval(function () { social_cycle() }, 10000);
        $('.sidebar-social-carousel').find('.carousel-item').eq('0').show();
    }
});

function social_cycle() {
    var next = 1;
    var length = $('.sidebar-social-carousel').find('.navigator-holder .item').length - 1;
    var current = $('.sidebar-social-carousel').find('.navigator-holder .item.active').index();
    if (current >= length) {
        next = 0;
    }
    else {
        next = current + 1;
    }
    social_nav($('.sidebar-social-carousel').find('.navigator-holder .item:eq(' + next + ')'));
}

function social_nav(obj) {
    var index = $(obj).index();

    if (!$(obj).hasClass('active')) {
        $(obj).closest('.sidebar-social-carousel').find('.carousel-item').hide();
        $(obj).closest('.sidebar-social-carousel').find('.carousel-item').eq(index).show();
        $(obj).siblings().removeClass('active');
        $(obj).addClass('active');
        clearInterval(social_timer);
        social_timer = setInterval(function () { social_cycle() }, 10000);
    }
    else {
        return;
    }
}



$(function () {

    var sidebar = $('.content-container > .inner > .sidebar');
    var stickyEl = $('div[data-sidebar-sticky]');
    var content = $('.content-container > .inner > .content-wrap');
    var sidemenuButton = $('.side-menu-button');
    var pageHolder = $('#page-holder');

    var scrollPos = $(window).scrollTop();



    if (sidebar.length == 1) {
        $(window).scroll(function () {
            var sidebarVerticalPosition = sidebar.outerHeight(true) + sidebar.offset().top;
            var documentHeightwoFooter = $(document).outerHeight(true) - $('.footer').outerHeight(true);

            if (sidebar.css('float') == "none") {
                stickyEl.removeClass('fixed-section');
                return;
            }

            if (content.outerHeight(true) < sidebarVerticalPosition) return;

            stickyEl.removeAttr('style');

            if (!stickyEl.hasClass('fixed-section') && $(this).scrollTop() > sidebarVerticalPosition - stickyEl.outerHeight(true)) {
                stickyEl.addClass('fixed-section');
            }
            else if (stickyEl.hasClass('fixed-section') && $(this).scrollTop() < sidebarVerticalPosition) {
                stickyEl.removeClass('fixed-section');
            }
            else if (stickyEl.hasClass('fixed-section') && $(window).height() < stickyEl.outerHeight(true) && stickyEl.overlaps('.footer').length != 1) {
                stickyEl.css({ top: $(window).height() - stickyEl.outerHeight(true) });
            }

            if (stickyEl.overlaps('.footer').length == 1) {
                stickyEl.css({ top: $(window).height() - stickyEl.outerHeight(true) - $('.footer').outerHeight(true) });
            }

        });
    }

    $(window).scroll(function () {
        var currScroll = $(window).scrollTop();

        if (currScroll < scrollPos && $(this).scrollTop() > 300) {
            sidemenuButton.css({ top: 20, display: 'block'/*, 'transform' : 'scale(1)'*/ });
        }
        else if (currScroll > scrollPos && !pageHolder.hasClass('side-open')) {
            sidemenuButton.css({ top: -100, display: 'block'/*, 'transform' : 'scale(0)'*/ });
        }
        else if ($(this).scrollTop() < 300 && !pageHolder.hasClass('side-open')) {
            sidemenuButton.css({ top: -100, display: 'block'/*, 'transform' : 'scale(0)'*/ });
        }

        scrollPos = currScroll;
    });

});



function searchToggle() {
    var searchHolder = $('.search-holder');

    if (searchHolder.hasClass('active')) {
        searchHolder.removeClass('active');
    }
    else {
        searchHolder.addClass('active');
    }

}

function sidemenuToggle(obj) {
    var pageHolder = $(obj).closest('#page-holder');

    if (!pageHolder.hasClass('side-open')) {
        pageHolder.addClass('side-open');
    }
    else {
        pageHolder.removeClass('side-open');
    }
}

function csrf_token() {
    return $('#csrf_token').val();
}


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

function facebook_share(url) {
    FB.ui({
        method: 'share',
        href: url,
    }, function (response) {
        if (response && !response.error_code) {
            //alert('Posting completed.');
        } else {
            //alert('Error while posting.');
        }
    }); 2
}

function twitter_share(url) {
    var title = $('title').text();
    window.open('http://twitter.com/share?url=' + url + '&text=' + title + '&via=icanbecreative' + '&', 'twitterwindow', 'height=450, width=550, top=' + ($(window).height() / 2 - 225) + ', left=' + $(window).width() / 2 + ', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');
}