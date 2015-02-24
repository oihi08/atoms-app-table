## Molecule.Table
Con esta molécula podemos generar una tabla de datos de manera sencilla. Atoms nos proporciona ciertos atributos y ciertos eventos para ello.

### Atributos en el IDE
```
id      : [OPTIONAL]
style   : small|big [OPTIONAL]
caption : string [OPTIONAL]
```

### Atributos para añadir en el código
```
columns : object [REQUIRED]
bind    :
    entity  : String [REQUIRED]
    atom    : String [REQUIRED]
    events  : Array [OPTIONAL]
    create  : Boolean [OPTIONAL]
    update  : Boolean [OPTIONAL]
    destroy : Boolean [OPTIONAL]
```
### Ejemplo
```
    "Molecule.Table":
        id: "active"
        events: ["select"]
        columns:
            name        : "string"
            description : "string"
        bind:
            entity : "__.Entity.Application"
            atom   : "Atom.TableRow"
            events : ["touch"]
            create : true

```

### Métodos
#### .findBy()
Este método sirve para buscar una entity concreta dentro de la tabla. Se le debe pasar como primer parámetro por qué campo queremos buscar y el segundo parámetro el valor de dicho campo.

**Parameters**

```
field : string
value : string
```
**Example**

```
.findBy("name", "Demo App");
```

#### .all()
Este método sirve para obtener todas las entities que están en la tabla.

### Eventos

#### onTableSelect
Este método se desplegará cuando pulsemos sobre una entity de la tabla. Como resultado nos devuelve dicha entity seleccionada.
