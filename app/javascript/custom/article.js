$(document).ready(function() {
  $('action-text-attacyment').css('cursor', 'pointer');
  $('action-text-attachment').click(function() {
    var url = $(this).attr('url');
    window.open(url, '_blank');
  });
});