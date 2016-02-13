$.fn.rippleBounce = function(options) {
    var defaults = {rippleClass: 'ripple-wrapper'};

    $.extend(defaults, options);

    $(this).append('<span class=' + defaults.rippleClass + '></span>');
    $(this).addClass('has-ripple').css({'position': 'relative', 'overflow': 'hidden'});

    $(this).on('click', function(e) {
        $(this).find('.' + defaults.rippleClass).removeClass('animated');

        var elementWidth  = $(this).outerWidth();
        var elementHeight = $(this).outerHeight();
        var dimension     = Math.max(elementWidth, elementHeight);

        $(this).find('.' + defaults.rippleClass).css({'width': dimension, 'height': dimension});

        var rippleX = e.clientX - $(this).offset().left - dimension / 2;
        var rippleY = e.clientY - $(this).offset().top - dimension / 2;

        $(this).find('.' + defaults.rippleClass).css('top', rippleY + 'px').css('left', rippleX + 'px').addClass('animated');
    });
};