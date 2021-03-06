Crafty.c 'Character',

  init: ->
    @requires('DOM, 2D, Solid, Identifier, SpeechBubble')
    @identify 'color'
    @set_bubble_text 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris accumsan leo eget lacus.'
    @z = 3

  at: (x, y, level = @level) ->
    board = game.board()
    if x? and y?
      @attr
        x: x * board.tile_width()
        y: (y * board.tile_height()) - (level * board.level_height())
        level: level
      @
    else
      x: Math.round(@x / board.tile_width())
      y: Math.round((@y + level * board.level_height()) / board.tile_height())
      level: level

  # Solid determines I have this method
  solid_at: ->
    x: @x + 19
    y: @y + 121
    w: 65
    h: 19

  stop_movement: ->
    @disableControl()
    if @_movement
      @x -= @_movement.x
      @y -= @_movement.y

  start_movement: ->
    @enableControl()
