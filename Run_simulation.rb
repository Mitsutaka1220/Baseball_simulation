
require "./Baseball_team"
require "./Baseball_game"

PlayerInfoA = {1 => { attack: 32, defense: 3},
               2 => { attack: 11, defense: 4},
               3 => { attack: 21, defense: 1},
               4 => { attack: 48, defense: 5},
               5 => { attack: 21, defense: 12},
               6 => { attack: 15, defense: 2},
               7 => { attack: 51, defense: 5},
               8 => { attack: 13, defense: 6},  #キーを付け替えることで打者の打順変更が、
               9 => { attack: 11, defense: 66}}   #各値の変更で選手パラメータの変更が可能です
              
PlayerInfoB = {1 => { attack: 30, defense: 1},
               2 => { attack: 101, defense: 2},
               3 => { attack: 40, defense: 3},
               4 => { attack: 120, defense: 4},
               5 => { attack: 100, defense: 5},
               6 => { attack: 55, defense: 6},
               7 => { attack: 71, defense: 7},
               8 => { attack: 51, defense: 8},
               9 => { attack: 31, defense: 9}}

A = Baseball_team.new(PlayerInfoA)
B = Baseball_team.new(PlayerInfoB)

gameAvsB = Baseball_game.new
gameAvsB.play_game(A,B)