import $ from 'jquery'

$(document).ready(function () {
    $('.letter').click(function (e) {
        e.preventDefault();
        $.ajax({
            url: "/json",
            method: "get",
        }).done(function (data) {
            debugger;
        });
    });
});