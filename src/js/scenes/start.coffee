Crafty.scene "Start", ->

  game.board().load_level('one')

  Crafty.e("Title").at(0, 1).text "Regex Adventures"

  Crafty.e("Subtitle").at(0, 5).text "Press any key to continue"

  Crafty.e("Keyboard").one 'KeyDown', ->
    return
    Crafty.scene 'Game'