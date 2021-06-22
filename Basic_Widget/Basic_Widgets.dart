import 'package:flutter/material.dart';

void main(){

  runApp(
    MaterialApp( // MaterialApp은 Flutter가 제공하는 Material로써 디자인을 사용하는 앱을 의미합니다.
     title: "My app",
     home: MyScaffold(),
    )
  );

}

// 여기서 StatelessWidget이라 함은 변화가 필요없는 화면을 구성 할 때 사용하는 위젯 클래스이며
// 따라서 build Methomd는 딱 한번만 호출 됨을 알 수 있습니다

// 반대로 StatefullWidget이라 함은 한번 생성된 화면의 구성이 어떠한 이유(매커니즘)으로 인해 변경될 수 있는 경우에 사용되는 것이죠

// 그렇다면 Widget 이라 함은 인터페이스 요소라고 보면 될 것 같습니다.

class MyScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //Material을 생성하여 반환하는 과정을 가져봅시다.
    return Material(
      // Material에 column을 자식으로 추가하겠습니다. column은 수직적인 구성을 가집니다.
      child: Column(
        // Column에 Widget(MyAppBar와 Expanded)를 자식으로 추가하겠습니다.

        // 컬럼에 위젯과 자식들로 추가해야합니다.
        children: <Widget>[
          // 첫번째 자식으로 MyAppBar를 추가합니다.
          MyAppBar(
            title: Text(
              "Example Title",
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),

          // 두번째 자식으로 Expanded를 추가합니다. MyAppBar를 제외한 영역을 차지합니다.
          Expanded(
            // Expanded의 자식으로 Center를 추가하겠습니다.
            child: Center(
              // Center의 자식으로 Text를 추가하겠습니다.
              child: Text("이제 이게 잘 보여야할텐데."),
            ),
          ),
        ],
      ),
    );
  }
}


/*
// 일단 MyScaffold의 Class에 대해 설명을 해보고 넘어갑시다.
// MyScaffold 클래스는 Main함수의 MaterialApp 함수의 Home 속성에서 호출되는 클래스라고 할 수 있습니다.
// 그렇다면 Home이라는 속성은 무엇일까요??
// Home 역시 widget type입니다.
// 그리고 Home을 MyScaffold로 지정하는 것이구요.
 */

class MyAppBar extends StatelessWidget{

  // 생성자. 생성시 전달받은 값을 타이틀로 할당합니다.
  MyAppBar({this.title});

  // 타이틀 위젯을 선언합니다.
  final Widget title;


  // override는 이제 method overriding인데 부모 클래스의 기본적인 동작방법을 변경해야함
  // -> 이 말은 이제 상속이라는 개념을 먼저 알아야 할텐데
  // 상속 : 상위 클래스의 기능을 하위 클래스에게 물려주는 즉 상위 클래스에서의 code modifying을 하위 클래스 modifying이 가능해야한다.
  // 하지만 하위클래스는 상위 클래스의 메소드를 주어진 그대로 사용하는건 제약이 많기 때문에
  // 하위 클래스가 부모 클래스의 기본적인 동작방법을 변경하는 것이 이제 메소드 overriding이라고 할 수 있다.

  @override
  Widget build(BuildContext context) {

    // 컨테이너를 구성하여 반환합니다. 컨테이너는 사각형 모양의 elements 등을 생성 할 수 있습니다.
    return Container(
      height: 70.0, // container 높이
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // 컨테이너 내부 padding 값
      decoration: BoxDecoration(color: Colors.blue), // 컨테이너 색을 파란색으로 바꿉니다.

      child: Row( // container의 열을 자식으로 추가하겠습니다.
        children: <Widget>[ // IconButton, Expended, IconButton을 열의 자식들로 추가하겠습니다.
          IconButton(
              icon: Icon(Icons.menu), // Menu Icon
              tooltip: 'Naviagtion menu', // 메뉴 아이콘을 누르고 있으면 표시될 문구
              onPressed: null, //눌렀을때 기능은 없다고 null로 처리함
          ),

          // 두번째 자식으로는 Expanded를 추가합니다.
          // Expanded는 다른 자식들이 차지하고 있지 않은 영역을 자신의 영역(너비)로 가져서 처리합니다.
          Expanded(child: title),

          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
          )
        ],
      ),
    );


 // 생성자, 생성시 전달받은 값을 타이틀로 할당합니다.



  }
}