# ARC Example



Weak과 Strong으로 만든 UI의 차이 



## 설정



- 코드와 스토리보드로 각각 UIView를 만들어서 Top과 Bottom의 Contraint를 조정해보았다.
- 탑은 Weak, Bottom은 Strong으로 설정



## 실험



- 각각의 Constraint를 비활성화 시켰다가 활성화시켜서 어떻게 작동하는지 확인



## 결과



- 스토리보드의 Weak은 에러 발생. 나머지는 제대로 작동.



## 유추



### 스토리보드



- Weak의 경우: 인터페이스 빌더에서 레퍼런스 카운트를 1씩 올리고 끝.
- Strong의 경우: 인터페이스 빌더에서 레퍼런스 카운트를 1씩 올리고, 코드를 통해 1이 더 추가



Weak은 UIView가 사라지면서 모든 레퍼런스 카운트가 0이 되고, 메모리에서 관련된 정보를 삭제함

Strong은 UIView가 사라졌지만, 레퍼런스 카운트가 남아있기 때문에 관련 정보를 가지고 있음.



### 코드



- 코드의 경우 프로퍼티가 정의된 곳은 ViewController이므로 ViewController가 없어지지 않는한 정보를 가지고 있다.



그래서 코드로 작성한 경우 Weak, Strong에 상관없이 정보를 가지고 활성화 시켜준다.

