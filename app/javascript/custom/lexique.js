import $ from 'jquery'

$(document).ready(function () {
    // by default, the entire glossary is displayed
    displayAllGlossary();

    // clicking on a letter displays query results
    $('.letter').click(function (e) {
        e.preventDefault();
        var query = $(this).children().text();
        getQueryResults(query);
    });

    // clicking on "all" display the entire glossary
    $('.all').click(function (e) {
        e.preventDefault();
        displayAllGlossary();
    });
});

function displayData(data) {
    for (var i = 0; i < data.length; i++) {
        var word = data[i];
        $('#query_results').append(generateSpan(word));
        $('#query_results').append('<br></br>');
    }
}

function generateSpan(word) {
    return "<span>" + word.name + "</span><span>  " + word.translation + "</span>"
}

function emptyQueryResults() {
    $('#query_results').empty();
}

function displayAllGlossary() {
    $.ajax({
        url: "/search",
        method: "get",
    }).done(function (data) {
        emptyQueryResults();
        displayData(data);
    });
}

function getQueryResults(query) {
    $.ajax({
        url: "/search?query=" + query,
        method: "get",
    }).done(function (data) {
        emptyQueryResults();
        displayData(data);
    });
}