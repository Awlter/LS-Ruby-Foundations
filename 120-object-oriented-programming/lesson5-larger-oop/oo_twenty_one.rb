require 'pry'

module Hand
  def hit
    @cards << @deck.deal
  end

  def busted?
    total > 21
  end

  def total
    total = @cards.map(&:value).reduce(:+)
    return 0 if total.nil?
    number_of_ace = @cards.count(&:ace?)
    while number_of_ace > 0 && total <= 10
      total += 10
      number_of_ace -= 1
    end
    total
  end
end

class Deck
  SUITS = ['H', 'D', 'C', 'S']
  NUMBER_FACES = ('2'..'10').to_a
  PICTURE_FACES = ['J', 'Q', 'K']
  ACE_FACE = ['A']
  FACES = NUMBER_FACES + PICTURE_FACES + ACE_FACE

  def create_new_deck
    @cards = []
    SUITS.product(FACES).each { |card| @cards << Card.new(card) }
  end

  def deal
    @cards.shuffle!.pop
  end
end

class Card
  def initialize(card)
    @card = card
  end

  def face
    @card.join(' ')
  end

  def value
    face = @card[1]
    if Deck::NUMBER_FACES.include? face
      face.to_i
    elsif Deck::PICTURE_FACES.include? face
      10
    else
      1
    end
  end

  def ace?
    @card[1] == 'A'
  end
end

class Participant
  def initialize
    @cards = []
  end

  def <<(card)
    @cards << card
  end
end

class Player < Participant
  include Hand

  def show_cards
    puts "Your cards are #{@cards.map(&:face).join(', ')}"
    puts "Your totoal value is #{total}"
  end
end

class Dealer < Participant
  include Hand

  def show_cards
    puts "Computer's cards are #{@cards[0].face} and []"
  end

  def hit
    return if total >= 17
    super
  end
end

class TwentyOneGame
  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def display_welcome_message
    puts 'Hello welcome !!!'
  end

  def reset_deck
    @deck.create_new_deck
  end

  def initial_deal
    2.times do
      deal
    end
  end

  def deal
    @player << @deck.deal
    @dealer << @deck.deal
  end

  def show_cards
    @player.show_cards
    @dealer.show_cards
  end

  def busted?
    @player.busted? || @dealer.busted?
  end

  def stay?
    puts 'Hit or stay? (h/s)'
    input = gets.chomp[0].downcase
    input == 's' ? true : false
  end

  def show_result
    player_total = @player.total
    dealer_total = @dealer.total
    puts "The total value of faces for player and dealer" \
    " #{player_total} vs #{dealer_total}"

    if @player.busted?
      puts 'The dealer won!'
    elsif @dealer.busted?
      puts 'You won!'
    else
      puts player_total > dealer_total ? 'You won!' : 'Computer won!'
    end
  end

  def play
    display_welcome_message
    reset_deck
    initial_deal
    show_cards
    loop do
      break if busted? || stay?
      deal
      show_cards
    end
    show_result
  end
end

TwentyOneGame.new.play
