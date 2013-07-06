#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'outcome', false
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', => @stand()
    @get('dealerHand').on 'checkScore', => @checkScore()
    return

  stand: ->
    @get('dealerHand').models[0].flip()
    @get('dealerHand').dealergo()

  checkScore: ->
    if @get('playerHand').scores()[0] > @get('dealerHand').scores()[0]
      @set 'outcome', "You win!"
      @trigger ('checkScore')
    else if @get('playerHand').scores()[0] < @get('dealerHand').scores()[0]
      @set 'outcome', "You lose, haha!"
      @trigger ('checkScore')
    else
      @set 'outcome', "You tie!"
      @trigger ('checkScore')

  newgame: ->
    console.log('newgame')
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()