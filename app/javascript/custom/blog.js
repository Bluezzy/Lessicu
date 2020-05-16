import $ from 'jquery'

$(document).ready(function () {
    $('.read_article').hover(function () {
        $(this).find('.title').css('color', '#f17114');
        $(this).find('.description').css('box-shadow', '5px 9px 6px -6px #f17114');
    }, function () {
        $(this).find('.title').css('color', '#00cccc');
        $(this).find('.description').css('box-shadow', '5px 9px 6px -6px #777');
    })

    $('.read_article').click(function () {
        $(this).find('.title').css('color', '#f17114');
        $(this).find('.description').css('box-shadow', '5px 9px 6px -6px #f17114');
    });

    $(".category_item a").hover(function () {
        $(this).parent().css('background-color', '#006666e8');
        $(this).css('color', '#00cccc');
    }, function () {
        $(this).parent().css('background-color', 'white');
        $(this).css('color', '#bfbfbf');
    });
});
