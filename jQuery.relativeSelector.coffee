( ($) ->
  $.fn.relativeSelector = ->

    tag = this.get(0).nodeName.toLowerCase()

    if this.attr('id')
      "##{this.attr('id')}"
    else if (['body','head','html'].some (test) -> test == tag)
      # elements that should be unique-ish
      tag
    else
      classes = ""
      if this.attr('class')
        classes = (".#{c}" for c in this.attr('class').split(' ')).join('')


      tag_and_class = "#{tag}#{classes}"

      if $(tag_and_class).length == 1
        tag_and_class
      else
        "#{this.parent().relativeSelector()} #{tag_and_class}:eq(#{this.parent().children(tag_and_class).index(this)})"

)(jQuery)
