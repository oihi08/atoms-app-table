###
@TODO

@namespace Atoms.Molecule
@class Table

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Table extends Atoms.Class.Molecule

  @extends  : true

  @template : """
    <table {{#if.style}}class="{{style}}"{{/if.style}}>
      {{#if.caption}}<caption>{{caption}}</caption>{{/if.caption}}
      <tbody></tbody>
    </table>
    """

  @available: ["Atom.TableRow"]

  @base     : "Table"

  @events   : ["select"]

  constructor: ->
    super
    @el = @el.find "tbody"

  _render: ->
    super
    if @attributes.columns
      columns = ""
      for name, type of @attributes.columns
        columns += """<th data-row-field=#{name} draggable="true">#{name}</th>"""
      @el.prepend """<thead><tr >#{columns}</tr></thead>"""
      do @_bindColumnOrder


  # -- Children Bubble Events --------------------------------------------------
  onTableRowTouch: ->
    console.log ">>>>>"

  # -- Private Methods ---------------------------------------------------------
  _bindColumnOrder: ->
    @el.find("thead th").on "touch", (event) =>
      el = event.target
      order = el.getAttribute("data-row-order")
      order = if not order  or order is "desc" then "asc" else "desc"
      el.setAttribute("data-row-order", order)

      field = el.getAttribute("data-row-field").toLowerCase()
      @entity (record.entity for record in @_records).sort (a, b) ->
        if order is "asc"
          if (a[field] or "") > (b[field] or "") then 1 else - 1
        else
          if (a[field] or "999") < (b[field] or "999") then 1 else - 1

    @el.find("thead th").on "dragstart", (event) =>
      @source = event.target

    @el.find("thead th").on "dragend", (event) =>
      Atoms.$(@source).siblings().removeClass "drag"
      @source = undefined

    @el.find("thead th").on "dragover", (event) =>
      if @source isnt event.target
        Atoms.$(event.target)
          .addClass "drag"
          .siblings().removeClass "drag"
      else
        Atoms.$(@source).siblings().removeClass "drag"
