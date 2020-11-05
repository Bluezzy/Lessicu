$(document).ready(function() {
  $('action-text-attachment').css('cursor', 'pointer');
  $('action-text-attachment').click(function() {
    var url = $(this).attr('url');
    window.open(url, '_blank');
  });
});
