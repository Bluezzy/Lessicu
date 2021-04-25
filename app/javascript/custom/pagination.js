import $ from 'jquery'

$(document).ready(function() {
    var text;

    $('.page-item').each(function() {
        text = $(this).find('a').text();
        if ($(window).width() <= 900) {
            removePaginationWords.call(this, text);
        }
    });
});

$(window).resize(function() {
    var text;

    $('.page-item').each(function() {
        text = $(this).find('a').text();
        if ($(window).width() <= 900) {
            removePaginationWords.call(this, text);
        }
    });
});

function withoutPaginationWords(text) {
    var newText = text.replace('Seguente', '')
    .replace('Precedente', '')
    .replace('Prima', '')
    .replace('Ultima', '');
    return newText;
}

function removePaginationWords(text) {
    $(this).find('a').text(function() {
        return withoutPaginationWords(text);
    })
}
