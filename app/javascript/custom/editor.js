import $ from 'jquery';

$(document).ready(function () {
  CKEDITOR.replace('article[content]');
  $('.edit_article_form').submit(function () {
    getContent();
  })
})

function getContent() {
  var customStr = CKEDITOR.instances['article_content'].getData();
  $("#article_content").val(customStr);
}