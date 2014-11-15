"use strict"

class Atoms.Atom.TableRow extends Atoms.Class.Atom

  @template: """<tr {{#if.style}}class="{{style}}"{{/if.style}}></tr>"""

  @base    : "TableRow"

  @events  : ["touch"]

  _render: ->
    super
    if @entity?
      columns = ""
      fields = @entity.constructor.attributes
      if @parent.attributes.columns
        fields = (field for field of @parent.attributes.columns)
      for field in @entity.constructor.attributes when field in fields
        value = @entity[field] or ""
        columns += """<td data-row-field="#{field}">#{value}</td>"""
      @el.html columns
