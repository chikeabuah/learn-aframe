# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # how to do this better?
  window["aframe"] = {}

  $("#run").click((e)->
    e.preventDefault()
    $("a-scene").empty()
    editor = ace.edit("snapshot-area")
    snap = editor.getValue()
    eval(snap)
  )

  $("#random").click((e)->
    e.preventDefault()
    $.ajax
      dataType: 'text'
      url: '/aframes/random'
      type: 'POST'
      success: (res) ->
        f = JSON.parse(res)
        editor = ace.edit("snapshot-area")
        snap = editor.setValue(f["prog"])
      error: (res) -> window.location = "/"
  )

  if namespace.controller is "aframes" and namespace.action is "new"
    editor = ace.edit('snapshot-area')
    editor.renderer.setShowGutter(false)
    editor.setTheme 'ace/theme/xcode'
    editor.session.setMode("ace/mode/javascript")
    editor.setOptions fontSize: '16pt'
    editor.resize()
    editor.on 'guttermousedown', (e) ->
      target = e.domEvent.target
      if target.className.indexOf('ace_gutter-cell') == -1
        return
      if !editor.isFocused()
        return
      if e.clientX > 25 + target.getBoundingClientRect().left
        return
      breakpoints = e.editor.session.getBreakpoints(row, 0)
      row = e.getDocumentPosition().row
      if typeof breakpoints[row] == typeof undefined
        e.editor.session.setBreakpoint row
      else
        e.editor.session.clearBreakpoint row
      e.stop()
      return