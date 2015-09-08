$ ->
  $('.reply').click (e) ->
    e.preventDefault()

    $commentForm = $(@).closest('blockquote').find('.comment-form')
    $commentForm.toggleClass('hidden')
    @classList.add 'hidden'