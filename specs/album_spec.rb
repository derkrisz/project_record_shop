require('minitest/autorun')
require('minitest/rg')
require_relative('../models/album.rb')

class TestAlbum < MiniTest::Test

  def setup
    @album1 = Album.new({
      'title' => 'Davidian',
      'quantity' => 5,
      'buy_price' => 10,
      'sell_price' => 15,
      'genre' => 'metal'
      })

    @album2 = Album.new({
      'title' => 'The More Things Change',
      'quantity' => 1,
      'buy_price' => 11,
      'sell_price' => 16,
      'genre' => 'metal'
      })
    end


      def test_stock_level
        result = @album1.stock_level
        result2 = @album2.stock_level
        assert_equal('Medium stock', result)
        assert_equal('Low stock', result2)
      end

    end
