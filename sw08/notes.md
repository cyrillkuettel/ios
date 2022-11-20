
# GPU: Grundlegender Prozess auf Softwareebene:
1.) Geometry processing.
2.) Rasterizer
3.) Fragment Processing.: Für jedes einzelne Pixel wird berechnet, was es für eine Farbe haben soll. Für Komplexe 3d Strukturen meistens eine Kombination.

Shader = Code der ausgeführt wird auf der Grafikkarte.

Die Api ist für verschiedene GPU apis unterschiedlich, aber die Grundsätze bleibem gleich.

METAL basiert auf C++, statisch kompiliert, also der code ist nicht 
als string hinterlegt. C++ gibt auch mehr möglichkeitne.


Grundsätzlich mit solchen shaders kann man eigentlich relativ viel machen.
UIKit is schlussendlich ein Wrapper um die Graphics.


SpriteKit und SceneKit: Elegantere, Abstraktere Anwendung verglichen mit OpenGL/Metal


 GPS: Es gibt lösungen zum Beispiel: swisstopo: verwendet nur GP und Kompass. Dadurch wird manuell die Transformations-Matrix umgerechnet.
