import UIKit

class ColorClass {
    var color: String
    
    init(color: String) {
        self.color = color
    }
}

//let color1 = ColorClass(color: "red")
//let color2 = color1
//let color3 = ColorClass(color: "blue")
//
//color1.color
//color2.color
//color3.color
//
//color2.color = "green"
//
//color1.color
//color2.color
//color3.color

struct ColorStruct {
    var color: String
    
    init(color: String) {
        self.color = color
    }
}

let color1 = ColorStruct(color: "red")
var color2 = color1
let color3 = ColorStruct(color: "blue")

color1.color
color2.color
color3.color

color2.color = "green"

color1.color
color2.color
color3.color
