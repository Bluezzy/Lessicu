import $ from 'jquery'

var currentData;

$(document).ready(function () {
    var query = false;
    var themeFilterValue = 'tout';
    if (!gon.admin) {
        $('.admin').remove();
    } else {
        $('.titres').append('<th></th><th></th>')
    }
    $('.all a').addClass('active');

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
        getQueryResults(query, themeFilterValue);
    });

    // additional table-filtering based on word themes
    $('#categurie').on('change', function (e) {
        themeFilterValue = this.value;
        getQueryResults(query, themeFilterValue);
    });

    $('.alphabet').on('click', '.letter a, .all a', function (e) {
        e.preventDefault();
        $('.alphabet').children().each(function (e) {
            $(this).children().removeClass('active');
        })
        $(this).toggleClass('active');
    });
});

function getQueryResults(query, themeFilterValue) {
    $.ajax({
        url: urlWithQuery(query, gon.language),
        method: "get",
    }).done(function (data) {
        currentData = filterWithTheme(themeFilterValue, data);
        displayOnlyQueryData(currentData);
    }).fail(function (a, b, c) {
        debugger;
        alert('votre requête a échoué')
    });
}

function displayOnlyQueryData(data) {
    $('.no_result').hide();
    $('#glossary .row_result').each(function (index, element) {
        var existsInQuery = data.filter(function (word) {
            return word.id === Number(element.dataset.id);
        }).length > 0;
        if (!existsInQuery) {
            $(element).hide();
        } else {
            $(element).show();
        }
    });
    if (data.length === 0) {
        $("#glossary").after('<div class="no_result"><p><em><strong>Pas de résultat</em></strong></p></div>');
    }
}

function getThemeName(word) {
    return gon.themes.reduce(function (accumulator, currentTheme) {
        if (currentTheme.id === word.theme_id) { accumulator += currentTheme.name }
        return accumulator;
    }, '');
}

function filterWithTheme(themeFilterValue, data) {
    if (themeFilterValue === 'tout') { return data; }
    return data.filter(function (word) {
        return getThemeName(word) === themeFilterValue;
    });
}

function urlWithQuery(query, language) {
    if (language === 'français') {
        if (query) {
            return "/search?query=" + query;
        } else {
            return "/search";
        }
    } else if (language === 'corsu') {
        if (query) {
            return "/circa?query=" + query;
        } else {
            return "/circa";
        }
    }
}