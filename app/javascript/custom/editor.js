import $ from 'jquery'

$(document).ready(function() {
  $('.edit_article_form').submit(function(e) {
    getContent();
  });
})

function getContent(){
  var customStr = document.getElementById("editable_content").innerHTML
  $("#article_content").val(customStr);
}