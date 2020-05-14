import $ from 'jquery'

$(document).ready(function () {
    $('.read_article').hover(function () {
        $(this).find('.title').css('color', '#f11414');
        $(this).find('.description').css('box-shadow', '5px 9px 6px -6px #f11414');
    }, function () {
        $(this).find('.title').css('color', '#00cccc');
        $(this).find('.description').css('box-shadow', '5px 9px 6px -6px #777');
    })
});
