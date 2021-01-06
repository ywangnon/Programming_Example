import UIKit

/*:
 
 # 가장 쉬운 Swift 입문 책
 
 - 보면서 기억할만한 것들을 따로 정리하였다.
 
 ## 1장
 
 - Swift는 애플에 의해 설계된 코코아(Mac OS X)와 코코아 터치(iOS) 프로그래밍을 위한 새로운 프로그래밍 언어
 
 ## 2장
 
 ### 정수 리터럴
 
 - 2진수: 0b
 
 - 8진수: 0o
 
 - 16진수: 0x
 
 ### 부동 소수점
 
 - Float: 32bit
 
 - Double: 64bit
 
 ### 부동 소수점 리터럴
 
 10의 제곱: E(e)로 표현
 
 - 10^2: E2
 
 - 10^(-2): E-2
 
 16진수 2의 제곱: p
 
 - 0xFp2: 15 * (2^2)
 
 ### 튜플
 
 - 순서있음
 
 - 모두 같은 자료형일 필요 없음
 
 ### 열거형 함수
 
 */

enum DeviceType {
    case Phone (Int, String)
    case Tablet(String)
    var info: String {
        switch self {
        case let .Phone(type, model):
            return "\(type) - " + model
        case let .Tablet(model):
            return model
        }
    }
}

var d1 = DeviceType.Phone(1, "iPhone")
d1.info

/*:
 
 ### 원시값 자동 증가
 
 - 중간에 다른값을 넣으면 그 수부터 다시 증가
 
 */

enum heroCharacters: Int {
    case SuperMan = 1
    case Batman
    case Wonderwoman
    case Spiderman = 9
    case IronMan
    case CaptainAmerica
}

var h = heroCharacters.Wonderwoman
print(h.rawValue)

h = heroCharacters.IronMan
print(h.rawValue)

/*:
 
 ## 5장
 
 ### 가변 매개 변수
 
 - ...: 가변적인 수의 인자를 받을 수 있는 매개변수
 
 - 함수에서 모든 매개 변수는 상수
 
 */

func average(nums: Int...) -> Float {
    var sum: Float = 0

    for num in nums {
        sum += Float(num)
    }

    return sum/Float(nums.count)
}

print(average(nums: 1,2,3))
print(average(nums: 1,2,3,4))
print(average(nums: 1,2,3,4,5,6))

/*:
 
 ### In-Out 매개 변수
 
 - 함수 안에서 변경된 내용이 지속되는 매개 변수
 
 #### 주의사항
 
 - 매개변수로 변수를 전달. 상수 금지
 
 - 값의 변경 가능을 표현하기 위해 전달하는 변수앞에 &붙임
 
 - 기본값 금지
 
 */

func fullName(name: inout String, withTitle title: String) {
    name = title + " " + name
}

var myName = "James"
fullName(name: &myName, withTitle: "Mr.")
print(myName)

/*:
 
 ## 6장
 
 ### 딕셔너리
 
 - 순서 x
 
 - 키로 접근
 
 - 반환값이 없을 수도 있으므로 옵셔널
 
 */


var ranking = [
    1:"Gold",
    2:"Silver",
    3:"Bronze"
]

/*:
 
 ## 7장
 
 ### Switch
 
 - 각 case는 반드시 하나 이상의 실행문 가짐. 주석은 안됨.
 
 - fallthrough 동작의 구현은 명시적으로 키워드 사용
 
 - 튜플 매칭시 일치하는 값을 임시 변수나 상수에 값 바인딩 해줌
 
 ### Where
 
 - where로 조건 검사 가능
 
 */

var score = (70, 60)

switch score {
case let (math, science) where math > 80 && science > 80:
    print("Good!")
case (50...100, let science):
    if science<50 {
        print("science failed")
    } else {
        print("science passed")
    }
case (let math, 50...100):
    if math<50 {
        print("math failed")
    } else {
        print("math passed")
    }
default:
    print("failed")
}

/*:
 
 ### for-in 루프
 
 - 배열, 딕셔너리, 문자열 직접 넣어서 반복 가능
 
 ### While 루프
 
 - 조건이 true인 한 반복 수행
 
 ### 제어 이동문
 
 - break: 루프 끝으로 이동
 
 - continue: 나머지 문장을 실행하지 않고 다음 반복 진행
 
 - outerLoop: 라벨ㅇ르 붙여 명시적으로 빠져나오려는 While 루프 지정
 
 */

var i = 0
outerLoop: while i<3 {
    i += 1
    var j = 0
    while j<3 {
        j += 1
        print("\(i), \(j)")
        break outerLoop
    }
}

/*:
 
 ## 8장
 
 ### 구조체
 
 - 값 타입
 
 - ==로 비교 불가
 
 ### 지연 저장 프로퍼티
 
 - 해당 프로퍼티를 만드는데 오랜시간이 걸리는 경우 사용. 그렇지 않을 경우 객체를 만드는데 모든 시간을 소비하게 됨.
 
 - 프로퍼티에 접근할 때만 인스턴스화
 
 - 지연 저장 변수는 항상 var 키워드를 사용해서 선언
 
 ### 계산 프로퍼티
 
 - 다른 프로퍼티의 값을 설정하거나 가져오게 함
 
 - 실제 구현되는 프로퍼티를 줄일 수 있고, 실수를 줄일 수 있다.
 
 ### 프로퍼티 옵저버
 
 - 프로퍼티 값의 변화를 감지하고 반응
 
 - willSet: 프로퍼티 값이 저장되기 전에 호출
 
 - didSet: 값이 저장된 직후 호출
 
 ### 타입 프로퍼티
 
 - 인스턴스들 간에 같은 값을 가진 프로퍼티가 필요한 경우에 유용
 
 ### 이니셜라이저
 
 - 컴파일러는 클래스 내의 모든 프로퍼티가 기본값을 가질 때만 기본 이니셜라이저를 만듦
 
 ### 인스턴스 비교
 
 - 같은 인스턴스를 참조하는지 검사하려면 === 사용
 
 ### 클래스의 메소드
 
 - 인스턴스 메소드: 메소드를 호출하려면 먼저 클래스의 인스턴스를 만들어야 함
 
 ### self 프로퍼티
 
 - 해당 클래스의 인스턴스를 참조
 
 ### 타입 메소드
 
 - 클래스명을 직접 이용해 호출
 
 ### 구조체의 메소드
 
 - 값 타입은 자신의 인스턴스 메소드 안에서 그 프로퍼티들을 수정할 수 없음
 
 - 바꾸기 위해서는 메소드가 변경을 한다는 것을 명시적으로 표현해야 함(mutating
 
 */

struct Go {
    var row: Int
    var column: Int
    
    mutating func move(dRow: Int, dColumn: Int) {
        row += dRow
        column += dColumn
    }
}

var stone = Go(row: 12, column: 16)
stone.move(dRow: 2, dColumn: 1)
print(stone)

/*
 실제로 발생하는 것은 move() 메소드가 원본 구조체(stone)를 변경하고 그 구조체의 새로운 인스턴스를 반환하여 원본 인스턴스를 덮어쓰는 것
 */

/*:
 
 ## 9장 상속
 
 - 클래스 상속은 코드 재사용을 높여주고 동일한 구현을 다른 곳에서 사용할 수 있게 변경을 허용
 
 ### 추상 클래스 만들기
 
 - 추상 클래스는 직접적으로 인스턴스화 할 수 없는 클래스
 
 - Swift는 추상 클래스를 지원하지 않는다.
 
 - 프로토콜을 사용하여 추상 클래스 구현
 
 ### 이니셜라이즈 오버로딩
 
 - 하위 클래스에 이니셜라이저가 없다면 모든 상위 클래스의 이니셜라이저를 하위클래스에서 사용 가능
 
 - 하위 클래스가 하나 이상의 이니셜라이저를 가지고 있다면 상위 클래스의 모든 이니셜라이저는 숨겨짐
 
 */

class Shape {
    var length: Double = 0
    var width: Double = 0
    
    init() {
        length = 0
        width = 0
    }
    
    init(length: Double, width: Double) {
        self.length = length
        self.width = width
    }
    
    func perimeter() -> Double {
        return 2 * (length + width)
    }
}

class Rectangle: Shape {
    
}

class Square: Shape {
    init(length: Double) {
        super.init()
        self.length = length
        self.width = length
    }
}

var rectangle1 = Rectangle(length: 1, width: 1)
var rectangle2 = Rectangle()
var square = Square(length: 1)

/*:
 
 ### 서브클래싱 금지
 
 - final 키워드를 사용해서 상속을 막음
 
 ### 이니셜라이저
 
 - 기본 이니셜라이저: 인스턴스화할 때 컴파일러가 생성하는 이니셜라이저
 
 - 지정 이니셜라이저: 클래스의 모든 프로퍼티 초기화
 
 - 컨비니언스 이니셜라이저: 또다른 이니셜라이저를 호출하는 이니셜라이저
 
 - 이니셜라이저 체이닝: 이니셜라이저가 이니셜라이저를 호출하는 것
 
 */

class Contact {
    var name: String
    var email: String
    var group: Int
    
    // 지정 이니셜라이저
    init(name: String, email: String, group: Int) {
        self.name = name
        self.email = email
        self.group = group
    }
    
    // 컨비니언스 이니셜라이저. 지정 이니셜라이저를 대신함
    convenience init(name: String, email: String) {
        self.init(name: name, email: email, group: 0)
    }
    
    convenience init(name: String) {
        self.init(name: name, email: "")
    }
}

/*:
 
 ### 하위 클래스에서의 이니셜라이저 호출
 
 - 하위 클래스가 기본 클래스를 상속하여 그 클래스의 이니셜라이저를 가지면, 기본 클래스의 이니셜라이저를 호출해야 함
 
 - 하위 클래스는 기본 클래스의 지정 이니셜라이저만 호출 가능
 
 ### 확장 프로퍼티
 
 - 계산 프로퍼티에 한해서 프로퍼티를 확장 가능
 
 - 확장에서 저장 프로퍼티 지원 안 함
 
 ### 모듈
 
 - 배포 단위
 
 - 앱, 프레임워크 등이 모듈
 
 - 다른 프레임워크를 사용하는 프로그램은 두 개의 구분된 모듈로 간주
 
 - 구분을 위해 접근제어 사용
 
 ## 10장 클로저
 
 - 이름 없는 함수
 
 - 함수는 특수한 형태의 클로저
 
 - 단일 문장만을 가지면 return 키워드도 생략 가능
 
 ### Array의 세가지 클로저 함수
 
 - map
 
 - filter
 
 - reduce
 
 ## 11장 프로토콜
 
 - 메소드와 프로퍼티의 청사진
 
 ### 선택 메소드
 
 - optional 키워드 사용
 
 - 구현에 대한 선택권을 줌
 
 - @objc 태그는 컴파일러에 Object-C와 상호 연동되는 클래스임을 알림
 
 - 선택 메소드를 선언하기 위해서는 @objec 태그를 프로토콜 앞에 붙임
 
 - @objc 태그가 붙은 프로토콜은 구조체나 열거형이 아닌 클래스에만 적용 가능
 
 - @objc 태그를 사용하려면 Foundation 모듈을 임포트해야함
 
 ### 딜리게이트
 
 */

@objc protocol CarProtocol {
    func accelarate()
    func decelerate()
    @objc optional func accelerateBy(amount: Int)
}

class Car: CarProtocol {
    var speed = 0
    
    func accelarate() {
        speed += 10
        if speed > 50 {
            speed = 50
        }
    }
    
    func decelerate() {
        speed -= 10
        if speed <= 0 {
            speed = 0
        }
    }
    
    // 선택적이라 구현을 안해도 된다.
    func accelerateBy(amount: Int) {
        speed += amount
    }
}

/*:
 
 ## 12장 제네릭
 
 - 함수, 클래스, 구조체에 사용 가능
  
 - 플레이스 홀더로 정의한 문자를 정의함
 
 */

func addToDictionary<KeyType, ValueType>(key: KeyType, value: ValueType) {
    
}

/*:
 
 ### 형 제한
 
 - 제네릭 뒤에 : 를 사용하여 사용하는 타입을 제한할 수 있다.
 
 ### 제네릭 타입 확장
 
 - 확장에서도 기본적으로 정의된 제네릭을 사용 가능
 
 ### 제한
 
 - where를 사용하여 제한 가능
 
 */
