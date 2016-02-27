require_relative '../test_helper'



describe "GoL::Game" do
  Given(:game) { GoL::Game.new(board) }

  context "emmpty board" do
    Given(:board) { [] }
    Then { game.tick == [] }
  end

  context "bigger zero board" do
    Given(:board)     { [[0,0,0],
                         [0,0,0],
                         [0,0,0]] }
    When { game.tick }
    Then { game.board == [[0,0,0],
                          [0,0,0],
                          [0,0,0]] }
  end

  context "6 size board" do

    context "blank" do
      Given(:board)     { [[0,0,0,0,0,0],
                           [0,0,0,0,0,0],
                           [0,0,0,0,0,0],
                           [0,0,0,0,0,0],
                           [0,0,0,0,0,0],
                           [0,0,0,0,0,0]] }
      When { game.tick }
      Then { game.board == [[0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0]] }
    end

    context "kill lonelys" do
      Given(:board)     { [[0,0,0,0,0,0],
                           [0,1,0,0,1,0],
                           [0,0,0,0,0,0],
                           [0,0,0,0,0,0],
                           [0,1,0,0,1,0],
                           [0,0,0,0,0,0]] }
      When { game.tick }
      Then { game.board == [[0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0]] }
    end

    context "two blocks should not change" do
      Given(:board)     { [[1,1,0,0,0,0],
                           [1,1,0,0,0,0],
                           [0,0,0,0,0,0],
                           [0,0,0,0,0,0],
                           [0,0,0,0,1,1],
                           [0,0,0,0,1,1]] }
      When { game.tick }
      Then { game.board == [[1,1,0,0,0,0],
                            [1,1,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,1,1],
                            [0,0,0,0,1,1]] }
    end

    context "blinker oscilator" do
      Given(:board)     { [[0,0,0,0,0,0],
                           [0,0,1,0,0,0],
                           [0,0,1,0,0,0],
                           [0,0,1,0,0,0],
                           [0,0,0,0,0,0],
                           [0,0,0,0,0,0]] }
      When { game.tick }
      Then { game.board == [[0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,1,1,1,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0]] }
    end

    context "boat should not change" do
      Given(:board)     { [[0,0,0,0,0,0],
                           [0,0,1,0,0,0],
                           [0,1,0,1,0,0],
                           [0,0,1,1,0,0],
                           [0,0,0,0,0,0],
                           [0,0,0,0,0,0]] }
      When { game.tick }
      Then { game.board == [[0,0,0,0,0,0],
                            [0,0,1,0,0,0],
                            [0,1,0,1,0,0],
                            [0,0,1,1,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0]] }
    end

    context "toad should be the same after two ticks" do
      Given(:board)     { [[0,0,0,0,0,0],
                           [0,0,0,0,0,0],
                           [0,0,1,1,1,0],
                           [0,1,1,1,0,0],
                           [0,0,0,0,0,0],
                           [0,0,0,0,0,0]] }
      When { game.tick
             game.tick }
      Then { game.board == [[0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,1,1,1,0],
                            [0,1,1,1,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0]] }
    end


  end

end
