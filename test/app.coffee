"use strict"

$$ ->
  console.log Atoms.version, " || ", __.version

  table = new Atoms.Molecule.Table
    container     : "article#extension > section"
    style         : "my_own_style"
    # caption       : "First version of Table extension for Atoms.App"
    columns:
      id          : "string"
      name        : "string"
      description : "string"
      # url         : "img"
      # when        : "date"
      year        : "number"
    bind:
      entity      : "Atoms.Entity.Contact"
      atom        : "Atom.TableRow"
      events      : ["touch"]
      create      : true
      update      : true
      destroy     : true

  # MOCK
  for i in [1..10]
    Atoms.Entity.Contact.create
      name       : "Name #{i}"
      description: "Description #{i}"

  cata = Atoms.Entity.Contact.create
    id    : "@cataflu"
    name  : "Catalina Oyaneder"
    url   : "http://cdn.tapquo.com/photos/cata.jpg"
    description: "zz!"
    when  : new Date()
    year  : 1983

  oihane = Atoms.Entity.Contact.create
    id    : "@oihi08"
    name  : "Oihare Merino"
    url   : "http://cdn.tapquo.com/photos/oihane.jpg"
    when  : new Date()
    year  : 1991

  setTimeout =>
    Atoms.Entity.Contact.all()[0].updateAttributes
      id    : "@soyjavi"
      name  : "Javi Jimenez"
      url   : "http://cdn.tapquo.com/photos/javi.jpg"
      year  : 1980
    Atoms.Entity.Contact.all()[1].destroy()
    cata.updateAttributes name: "Catilla"
    table.row 2 # Select by index
  , 1000

  setTimeout =>
    table.row cata # Select by entity
  , 2000
