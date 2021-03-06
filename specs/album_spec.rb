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

      def test_stock_css
        result = @album1.stock_css
        result2 = @album2.stock_css
        assert_equal('medium_stock', result)
        assert_equal('low_stock', result2)
      end

      def test_markup
        result = @album1.markup
        assert_equal("50%", result)
      end
      
    end
