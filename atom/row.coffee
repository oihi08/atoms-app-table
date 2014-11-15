"use strict"

class Atoms.Atom.TableRow extends Atoms.Class.Atom

  @template: """<tr {{#if.style}}class="{{style}}"{{/if.style}}></tr>"""

  @base    : "TableRow"

  @events  : ["touch"]

  _render: ->
    super
    if @entity?
      tds = ""
      fields = @entity.constructor.attributes
      if @parent.attributes.columns
        fields = (field for field of @parent.attributes.columns)
      for field, index in @entity.constructor.attributes when field in fields
        value = @entity[field] or ""
        tds += """<td data-row-field="#{field}" data-row-index="#{index}">#{value}</td>"""
      @el.html tds
