
# SW01

Swift quick start. 

##  Datentyp Optional: Es kann sein, dass kein Wert vorhanden ist.

Wichtig: Nicht-optionale Datentypen können nicht nil sein.

## Unwrapping:

- Safe unwrapping: Everywhere these if statements for nil check
- Forced unwrapping: `value!` -> Laufzeitfehler, falls `value` keinen Wert hat.
- Optional Binding, ähnlich wie mit if, aber es kann eine lokale variable 
erstellt werden: `if let ...`
- Optional Chaining. Ähnlidches verhalten, aber für z.B. Klassen

```swift
class Person {
var residence: Residence? // note: optional type
}
class Residence {
var numberOfRooms = 1
}

```
- Optional Chaining im Einsatz:
```swift
let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

```

Ich denke, das macht Sinn falls ein Object nil sein kann, man möchte aber auf
Methoden / Attribute dieses Objects zugreifen.


## Nil Coalescing Operator: ??

Unwrapping, aber mit default value.

##  Tupel-Datentypen

Tupel können beliebig viele Werte von beliebigen Datentypen enthalten.

Zugriff:
- Index
- Tuple Decomposition

```swift
var x = testTuple.0 + 1
var (number, flag, text) = testTuple
let inc = number + 7
var (_, justTheFlag, _) = testTuple
```

Hinweis: Tupel sind beispielsweise praktisch als Rückgabetype von Funktionen.
Funktionen können so beliebig viele Werte zurück liefern. 

## Properties

- stored Properties
    - Unterart: Lazy stored Properties
- computed Properties

Unterart lazy: Das wirt erst beim ersten Zugriff ausgewertet und zugewiesen.

## Property Observers

- willSet
- didSet
