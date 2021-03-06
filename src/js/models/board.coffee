Crafty.c "Board",

  levels:
    one: [
      [
        ['g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g']
        ['g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g']
        ['g', 'g', 'g', 's', 's', 's', 's', 's', 'g', 'g', 'g']
        ['g', 'g', 'g', 's', 'w', 'w', 'w', 's', 'g', 'g', 'g']
        ['g', 'g', 'g', 's', 'w', 's', 'w', 's', 'g', 'g', 'g']
        ['g', 'g', 'g', 's', 'w', 'w', 'w', 's', 'g', 'g', 'g']
        ['g', 'g', 'g', 's', 's', 's', 's', 's', 'g', 'g', 'g']
        ['g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g']
        ['g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g']
      ]
      [
        []
        []
        []
        []
        ['3', 's', '', '2', '', '!']
      ]
    ]

  init: ->
    @requires('Model, Viewport')

  map_grid:
    width: 11
    height: 8
    tile:
      width: 101
      height: 83
      level: 40

  load: (board) ->
    for l, level of board
      for y, row of level
        for x, cell of row
          if type = Tile.fromLetter(cell)
            e = Crafty.e("Tile, #{type}").at(x, y-1, Number(l))
            if Tile.tile(type).solid
              e.requires('Solid')
          if type = Character.fromLetter(cell)
            Crafty.e("Character, #{type}").at(x, y-1, Number(l))
    @

  load_level: (name) ->
    @load(@levels[name])

  tile_width: ->
    @map_grid.tile.width

  tile_height: ->
    @map_grid.tile.height

  level_height: ->
    @map_grid.tile.level

  # what level is a specific grid at?
  level: (x, y, type = 'Tile Solid') ->
    max = -1
    for item in Crafty.find(type, {at: {x, y}})
      at = item.at()
      max = Math.max(max, at.level) if at.x is x and at.y is y
    max

  grid_width: ->
    @map_grid.width

  grid_height: ->
    @map_grid.width

  width: ->
    @map_grid.width * @map_grid.tile.width

  height: ->
    @map_grid.height * @map_grid.tile.height

  last_bottom_block: ->
    @map_grid.height - 1

  last_right_block: ->
    @map_grid.width - 1

  grid_width: ->
    @map_grid.tile.width

  grid_height: ->
    @map_grid.tile.width

  # Return all items at a given coords
  at: (x, y, type = 'Solid Grid') ->
    results = []
    for item in Crafty.find(type)
      at = item.at()
      results.push(item) if at.x is x and at.y is y
    results

  taken: (x, y, type = 'Solid Grid') ->
    @at(x, y, type).length > 0
