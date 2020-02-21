import $ from 'jquery'

var currentData;

$(document).ready(function () {
    if (!gon.admin) {
        $('.admin').remove()
   }
    var query = false;
    var themeFilterValue = 'all';

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
        $('tr').show();
    });

    $('#categurie').on('change', function(e) {
        themeFilterValue = this.value;
        getQueryResults(query, themeFilterValue);
      });
});

function getQueryResults(query, themeFilterValue) {
    $.ajax({
        url: urlWithQuery(query),
        method: "get",
    }).done(function (data) {
        currentData = filterWithTheme(themeFilterValue, data);
        displayOnlyQueryData(currentData);
    });
}

function displayOnlyQueryData(data) {
    $('#glossary .row_result').each(function(index, element) {
        var existsInQuery = data.filter(function(word) {
            return word.id === Number(element.dataset.id);
        }).length > 0;
        if (!existsInQuery) { 
            $(element).hide(); 
        } else {
            $(element).show();
        }
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