$(function() {
  $("#new_comment").on("submit", function(e) {
    e.preventDefault();
    let text = $(".show_paraphrase__main__right__input__text").val();
    $.ajax({
      url: "/themes/paraphrases",
      type: "POST",
      data: {text: text},
      dataType: 'json'
    })

    .done(function(data) {
      let html = buildHTML(data.text);
      $('.show_paraphrase__main__right__comments').prepend(html);
      $('.show_paraphrase__main__right__input__text').val("");
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
      alert("error:" + errorThrown);
    })
  });

  function buildHTML(data) {
    let html = ``
    return html;
  }
})