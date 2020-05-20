import $ from 'jquery'

var currentData;

$(document).ready(function () {
    var query = false;
    var category = 'tout';
    handleAdminElements();
    getQueryResults(query, category);

    // additional table-filtering based on word themes
    $('#categurie').on('change', function (e) {
        category = this.value;
        getQueryResults(query, category);
    });

    $('.alphabet').on('click', '.letter a', function (e) {
        e.preventDefault();
        toggleLetterProcess(this);
        query = (this.classList.contains("active") ? $(this).text() : false);
        getQueryResults(query, category);
    });
});

function getQueryResults(query, category) {
    $.ajax({
        url: urlWithQuery(query, gon.language),
        method: "get",
    }).done(function (data) {
        currentData = filterWithCategory(category, data);
        displayOnlyQueryData(currentData);
    }).fail(function (a, b, c) {
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
    } else {
        stripeEvenRows();
    }
}

function getThemeName(word) {
    return gon.themes.reduce(function (accumulator, currentTheme) {
        if (currentTheme.id === word.theme_id) { accumulator += currentTheme.name }
        return accumulator;
    }, '');
}

function filterWithCategory(category, data) {
    if (category === 'tout') { return data; }
    return data.filter(function (word) {
        return getThemeName(word) === category;
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

function toggleLetterProcess(letterLinkElement) {
    if (!letterLinkElement.classList.contains("active")) {
        $('.alphabet').children().each(function (e) {
            $(this).find('a').removeClass('active');
        });
    }
    $(letterLinkElement).toggleClass('active');
}

function handleAdminElements() {
    if (!gon.admin) {
        $('.admin').remove();
    } else {
        $('.titres').append('<th></th><th></th>')
    }
}

function stripeEvenRows() {
    $("tr:visible").each(function (index) {
        $(this).css("background-color", !!(index + 1 & 1) ? "rgba(0,0,0,.05)" : "rgba(0,0,0,0)");
    });
}