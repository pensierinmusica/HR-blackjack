class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="deal-button">Deal Another</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .deal-button": ->
      @$el.find('.stand-button, .hit-button').show()
      @model.newgame()
      @render()

  initialize: ->
    @render()
    @model.get('playerHand').on 'bust', =>
      @$el.prepend('<div class="message">Busted!</p>')
      @$el.find('.stand-button, .hit-button').hide()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
