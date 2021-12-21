

require './brave'
require './monster'
require './games_controller'
games_controller = GamesController.new
merioeru = Brave.new(name: "メリオエル", hp: 5000, offense: 200, defense: 100)
sukumono = Monster.new(name: "巣食うもの", hp: 2500, offense: 200, defense: 100)
games_controller.battle(brave: merioeru, monster: sukumono)
