import $ from 'jquery'

$(document).ready(function () {
    $('.description').hover(function () {
        $(this).css('box-shadow', '5px 9px 6px -6px #00cc66');
    }, function () {
        $(this).css('box-shadow', '5px 9px 6px -6px #777');
    })
});
