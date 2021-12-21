

require './brave'
require './monster'
require './games_controller'
games_controller = GamesController.new
merioeru = Brave.new(name: "メリオエル", hp: 2500, offense: 500, defense: 500)
sukumono = Monster.new(name: "巣食うもの", hp: 2500, offense: 800, defense: 200)
games_controller.battle(brave: merioeru, monster: sukumono)
