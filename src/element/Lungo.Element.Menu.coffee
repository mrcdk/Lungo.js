###
Set a progress to the element

@namespace Lungo.Element
@method Menu

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###


Lungo.Element.Menu = do (lng = Lungo) ->

  C = lng.Constants


  ###
  Displays the <data-control-menu> with a determinate Id
  @method   show
  @param    {string} <data-control-menu> Id
  ###
  show = (id) ->
    element = @_instance id
    if element
      element.addClass C.CLASS.SHOW
      # Set a timeout to skip firing events simultaneously 
      setTimeout -> Lungo.dom(C.ELEMENT.BODY).addClass C.CLASS.MENU_OPENED, C.DELAY.DEFAUT

  ###
  Hides the <data-control-menu> with a determinate Id
  @method   hide
  @param    {string} <data-control-menu> Id
  ###
  hide = (id) ->
    element = @_instance id
    if element 
      element.removeClass C.CLASS.SHOW
      Lungo.dom(C.ELEMENT.BODY).removeClass C.CLASS.MENU_OPENED

  ###
  Toggles the <data-control-menu> with a determinate Id
  @method   toggle
  @param    {string} <data-control-menu> Id
  ###
  toggle = (id) ->
    element = @_instance id
    if element
      if element.hasClass C.CLASS.SHOW then @hide id else @show id
                
  closeAll = ->
    _this = @
    Lungo.dom(C.CONTROL.MENU).each ->
      el = _this._instance Lungo.dom(@).attr C.ATTRIBUTE.ID
      if el then el.removeClass C.CLASS.SHOW

  _instance: (id) -> Lungo.dom "#{C.CONTROL.MENU}##{id}"

  show  : show
  hide  : hide
  toggle: toggle
  closeAll: closeAll
