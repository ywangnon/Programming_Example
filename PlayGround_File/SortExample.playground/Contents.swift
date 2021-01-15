import UIKit

var arr: Array<SortModel> = []

let model1 = SortModel(king: true, name: "아무무")
let model2 = SortModel(king: false, name: "밴시여왕")
let model3 = SortModel(king: true, name: "쓰랄")
let model4 = SortModel(king: false, name: "제이나")
let model5 = SortModel(king: false, name: "가로쉬")
let model6 = SortModel(king: true, name: "스웨인")
let model7 = SortModel(king: false, name: "가라")
let model8 = SortModel(king: true, name: "두둥등장")

arr.append(model1)
arr.append(model2)
arr.append(model3)
arr.append(model4)
arr.append(model5)
arr.append(model6)
arr.append(model7)
arr.append(model8)

let newArr3 = arr.sorted { (m1, m2) -> Bool in
    if m1.king != m2.king {
        return m1.king ? true : false
    } else {
        return m1.name < m2.name
    }
}

for a in newArr3 {
    print(a)
}

struct SortModel {
    var king: Bool
    var name: String
}

print("\n---------- [ struct ] ----------\n")
let decodedStruct = String(data: <#T##Data#>, encoding: .utf8)!
print(decodedStruct)
