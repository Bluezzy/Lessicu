import $ from 'jquery'

$(document).on('turbolinks:load', function () {
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
        $('#query_results table').append(generateTableRow(word));
    }
}

function generateTableRow(word) {
    return "<tr class='row_result'><td>" + word.name + "</td><td>  " + word.translation + "</td><td> " + word.category + "</td></tr>"
}

function emptyQueryResults() {
    $('.row_result').remove();
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