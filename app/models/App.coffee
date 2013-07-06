#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # @get('playerHand').on 'bust', => @bust()
    @get('playerHand').on 'stand', => @stand()
    @get('dealerHand').on 'checkScore', => @checkScore()
    return

  # bust: ->
  #   console.log 'you suck, you busted bro'
  #   @trigger "bust"

  stand: ->
    @get('dealerHand').models[0].flip()
    @get('dealerHand').dealergo()

  checkScore: ->
    if @get('playerHand').scores()[0] > @get('dealerHand').scores()[0]
      console.log 'Player wins'
    else if @get('playerHand').scores()[0] < @get('dealerHand').scores()[0]
      console.log 'Dealer wins'
    else
      console.log 'Tie'

  newgame: ->
    console.log('newgame')
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()