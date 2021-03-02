$(function () {
  function buildHTML(comment){
    var html =`
      <p class="alert alert-warning">
        <strong>${comment.name}:</strong>
        ${comment.text}
      </p>`
    return html;
  }
})
$('new_comment').on('submit', function(e){
  e.preventDefault();
  var formData = new FormData(this);
  var url = $(this).attr('action');

  $.ajax({
    url: url,
    type: "POST",
    data: formData,
    datatype: 'json',
    processData: false,
    contentType: false
  })

  .done(function(data) {
    var html = buildHTML(data);
    $('comment').prepend(html);
    $('form-control').val('');
    $('btn btn-outline-secondary').prop('disabled', false);
  })
  .fail(function(){
    alert('コメントを入力してください');
  })
});
