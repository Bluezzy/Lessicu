import $ from 'jquery'

var currentData;

$(document).on('turbolinks:load', function () {
    var query = false;
    var themeFilterValue = 'all';
    // by default, the entire glossary is displayed
    displayAllGlossary();

    // clicking on a letter displays query results
    $('.letter').click(function (e) {
        e.preventDefault();
        query = $(this).children().text();
        getQueryResults(query, themeFilterValue);
    });

    // clicking on "all" display the entire glossary
    $('.all').click(function (e) {
        e.preventDefault();
        query = false;
        displayAllGlossary();
    });

    $('select').on('change', function(e) {
        themeFilterValue = this.value;
        getQueryResults(query, themeFilterValue);
      });
});

function displayData(data) {
    for (var i = 0; i < data.length; i++) {
        var word = data[i];
        $('#query_results table').append(generateTableRow(word));
    }
}

function generateTableRow(word) {
    return "<tr class='row_result'><td>" + word.name + "</td><td>  " + word.translation + "</td><td> " + getThemeName(word) + "</td></tr>"
}

function emptyQueryResults() {
    $('.row_result').remove();
}

function displayAllGlossary() {
    $.ajax({
        url: "/search",
        method: "get",
    }).done(function (data) {
        currentData = data;
        emptyQueryResults();
        displayData(data);
    });
}

function getQueryResults(query, themeFilterValue) {
    $.ajax({
        url: urlWithQuery(query),
        method: "get",
    }).done(function (data) {
        currentData = filterWithTheme(themeFilterValue, data);
        emptyQueryResults();
        displayData(currentData);
    });
}

function getThemeName(word) {
    return gon.themes.reduce(function(accumulator, currentTheme) {
        if (currentTheme.id === word.theme_id) {accumulator += currentTheme.name}
        return accumulator;
    }, '');
}

function filterWithTheme(themeFilterValue, data) {
    if (themeFilterValue === 'all') { return data; }
    return data.filter(function(word) {
        return getThemeName(word) === themeFilterValue;
    });
}

function urlWithQuery(query) {
    if (query) {
        return "/search?query=" + query;
    }
    return "/search";
}