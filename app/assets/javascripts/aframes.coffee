# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # how to do this better?
  window["myr"] = {}

  myr.env = (snap) ->
    random = ->
      Math.random()

    getRandomColor = ->
      letters = '0123456789ABCDEF'
      color = '#'
      i = 0
      while i < 6
        color += letters[Math.floor(Math.random() * 16)]
        i++
      color

    initScene = () ->
      $("#scene").empty()
      $("#scene").append("<a-scene></a-scene>")
      window.sceneEl = document.querySelector('a-scene')
      
    box = (x,y,z) ->
      boxEl = document.createElement('a-box')
      boxEl.setAttribute 'material', color: getRandomColor()
      position = 
        x: random() * 20 - 10
        y: random() * 20 - 10
        z: random() * 20 - 10
      boxEl.setAttribute 'position', position
      scale = 
        x: x
        y: y
        z: z
      boxEl.setAttribute 'scale', scale
      sceneEl.appendChild boxEl
      return boxEl

    exec = (snap) ->
      eval(snap)

    exec(snap)

  $("#run").click((e)->
    e.preventDefault()
    editor = ace.edit("snapshot-area")
    snap = editor.getValue()
    myr.env(snap)
  )

  $("#clear").click((e)->
    e.preventDefault()
    $("#scene").empty()
    $("#scene").append("<a-scene></a-scene>")
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