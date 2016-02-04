$(document).ready(function () {
    $(":file").filestyle({ buttonName: "btn-primary" });

    //Activar los Tooltip
    $('[data-tooltip="true"]').tooltip();
    $('[data-toggle="tooltip"]').tooltip();
    $("[rel='tooltip']").tooltip();
    $('[data-toggle="popover"]').popover();
});

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