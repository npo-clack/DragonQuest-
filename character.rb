require './message_dialog'

class Character
  # MessageDialogのインクルード
  include MessageDialog

  attr_reader :potential_offense, :potential_defense
  attr_accessor :hp, :name, :offense, :defense

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @potential_offense = params[:offense]
    @potential_defense = params[:defense]
  end
end
