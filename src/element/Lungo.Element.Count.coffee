###
Set a counter to the element

@namespace Lungo.Element
@class count

@param  {string} Element query selector
@param  {number} Value for counter

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###


Lungo.Element.count = (selector, count, aside = false) ->
  element = Lungo.dom(selector)
  if element
    element.children(".tag.count").remove()
    if count
      binding = Lungo.Constants.BINDING.SELECTOR
      if aside
        html = Lungo.Attributes.count_aside.html.replace(binding, count)
        element.prepend html
      else
        html = Lungo.Attributes.count.html.replace(binding, count)
        element.append html
