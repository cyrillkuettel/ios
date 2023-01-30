
# SW01

Swift quick start. 

##  Datentyp Optional: Es kann sein, dass kein Wert vorhanden ist.

Nicht-optionale Datentypen können nicht nil sein.

## Unwrapping:

- Safe unwrapping: Everywhere these if statements for nil check
- Forced unwrapping: `value!` -> Laufzeitfehler, falls `value` keinen Wert hat.
- Optional Binding, ähnlich wie mit if, aber es kann eine lokale variable 
erstellt werden: `if let ...`
- Optional Chaining. Ähnlidches verhalten, aber für Zugriff auf Klassenattribute

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

- `willSet`
- `didSet`

# Type Properties (static)

Was in vielen anderen Sprachen (Java, Kotlin, C# ) als "static property" 
bezeichnet wird, heisst bei Swift "Type Properties"



# Closure

"A closure is an inner function, that remembers, and has access to, variables
in the local scope where it was created. (Even after the outer function has 
finished executing.)" 



## Wieso also sind Views Structs?

- Performance: Für kleine Datenmengen sind Structs effizienter.
- Korrektheit: Eine Klasse mit let deklarierte Klasse, deren properties sind
nicht immutable. Eine let-Variabel mit einem Struct lässt keine unerwünschten  
Veränderungen zu, bei einer let-Variabel von einer Klassen-Instanz ist nur die 
Referenz direkt geschützt
- Man wird gezwungen, die View als isolierten Status oder als Daten zu sehen 
und ist nicht versucht, in (imperativen) Änderungen von bestehenden Objekten zu 
denken.

### View Modifiers: Jeder View Modifier erstellt eine neue View.
```swift
Text("Hello, World!")
    .padding() // <--- View Modifier
```

Reihenfolge oft entscheidend.





## Layout Mechanismus
Alle Layouts in Swift UI funktionieren mit den gleichen drei Regeln:

1. Eine View bietet einer Subview eine bestimmte Grösse an
2. Die Subview kann diese Grösse annehmen oder sich für eine andere Grösse 
entscheiden
3. Die Container-View positioniert die Subview

Diese Schritte werden rekursiv auf alle Subivews angewendet.






# Kontrollfragen

## Mit welchen Anpassungen kann die Accessibility einer SwiftUI-View
verbessert werden? Was ist in der Regel nicht nötig?

- Ein `accessibilityLabel` hinzufügen. Dieses Label beschreibt den Sinn oder den 
Inhalt der View, und das wird dann über VoiceOver vorgelesen.
- `accessibilityTraits`, Beschreibt Typ der View: Button, Link, oder Label ...?
-

##  Welche Inhalte hat ein `Label` und wie werden diese dargestellt?

- `text`: The text displayed by the label.
- `font`: The font used to display the text.
- `foregroundColor`: The color used to display the text.


###  Was bedeutet `Identifiable` und welche Bedeutung hat dies in SwiftUI?

Identifiable ist ein Protocol dass eine Klasse oder ein Struct implementieren
kann und diese muss ein Attribut vom Typ Hashable halten.

### Identifiable vs Hashable

#### Disambiguation: Hashable. 

Identifiable may seem similar to hashable. There are some important differences:

- Identifiable usually depends on the State of and object. They change when an 
object is mutated.
- Identifiable values are stable between launches, Hashable values change
  between restarts.
-  are truly unique, whereas hash values may collide.
- Identifiable may be meaningful, Hash is always random by it's nature.


This identifier is typically used when working with lists or other collections 
of items, to ensure that each item is properly updated, inserted, or removed
when the underlying data changes. 


# lokale Persistenz (Möglicheiten)

- Dateisystem 
- Core Data
- KeyStore
- User Defaults


## SwiftUI in einem UIViewController

# Braindump 


## 2 Arten von Optionals
```swift
let shortForm: Int? = Int("42")
let longForm: Optional<Int> = Int("42")
```

# Storyboard, ViewControllers

Das Storyboard beschreiben und den Zusammenhang zwischen Storyboard und Code
(UIViewController) erklären. Beschreiben, wie IBOutlets/IBActions erstellt
werden können. 

IBOutlet ist eine Referenz des UIElement im Code und IBAction ist eine Methode 
die bei einem Event aufgerufen wird.

# View Controller
View Controller sind das Fundament der internen Struktur einer iOS-App.
    - UIViewController: Üblicherweise eine Bildschirmseite (UIKit)
    


