import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// URI/URL을 생성하는 데 도움을 주는 클래스
final uri = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {
  // WebViewController 선언
  WebViewController webViewController = WebViewController()
    // JavaScript가 제한 없이 실행될 수 있도록 허용
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // 웹뷰 내에서 발생하는 페이지 이동, 로딩 상태 등의 이벤트를 감지하고 제어
    ..setNavigationDelegate(NavigationDelegate(
      // URL의 로딩이 완료되었을 때 호출되는 콜백 함수
      onPageFinished: (String url) {
        print(url);
      }
    ))
    ..loadRequest(uri);   // Controller 변수 생성

  // 웹뷰 뒤로 가기
  Future<void> goBack() async {
    if (await webViewController.canGoBack()) {
      await webViewController.goBack();
    }
  }

  // 웹뷰 앞으로 가기
  Future<void> goForward() async {
    if (await webViewController.canGoForward()) {
      await webViewController.goForward();
    }
  }

  // 지정한 홈 주소로 이동
  void goHome() {
    webViewController.loadRequest(uri);
  }
  
  // const 생성자 : 최초 선언 후 변경 불가능한 빌드 타임 함수
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱바 위젯 추가
      appBar: AppBar(
        // 배경색 지정
        backgroundColor: Colors.orange,
        // 가운데 정렬
        centerTitle: true,
        // 앱 타이틀 설정
        title: Text('Code Factory'),
        // 앱바의 왼쪽에 배치되는 위젯을 정의하는 속성
        leading: IconButton(   // 뒤로 가기 버튼
          onPressed: goBack,   // 아이콘을 눌렀을 때 콜백 함수
          icon: const Icon(   // 뒤로 가기 아이콘 설정
            Icons.arrow_back,
          ),
        ),
        // 앱바에 액션 버튼을 추가할 수 있는 매개변수
        actions: [
          IconButton(   // 앞으로 가기 버튼
            onPressed: goForward,
            icon: const Icon(   // 앞으로 가기 아이콘 설정
              Icons.arrow_forward,
            ),
          ),
          IconButton(   // 지정한 홈 주소로 이동 버튼
            onPressed: goHome,
            icon: const Icon(   // 홈 버튼 아이콘 설정
              Icons.home,
            ),
          ),
        ],
      ),
      body: WebViewWidget(   // 웹뷰 위젯 추가
        controller: webViewController,
      ),
    );
  }
}