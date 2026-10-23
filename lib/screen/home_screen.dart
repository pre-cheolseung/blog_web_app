import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final uri = Uri.parse('https://blog.codefactory.ai');   // URI/URL을 생성하는 데 도움을 주는 클래스

class HomeScreen extends StatelessWidget {
  WebViewController webViewController = WebViewController()   // WebViewController 선언
    ..setJavaScriptMode(JavaScriptMode.unrestricted)   // JavaScript가 제한 없이 실행될 수 있도록 허용
    // WebView 내에서 발생하는 페이지 이동, 로딩 상태 등의 이벤트를 감지하고 제어
    ..setNavigationDelegate(NavigationDelegate(
      // URL의 로딩이 완료되었을 때 호출되는 콜백 함수
      onPageFinished: (String url) {
        print(url);
      }
    ))
    ..loadRequest(uri);

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
  
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar 위젯 추가
      appBar: AppBar(
        backgroundColor: Colors.orange,   // 배경색 지정
        centerTitle: true,   // 가운데 정렬
        title: Text('Code Factory'),   // 앱 타이틀 설정
        // 뒤로 가기 버튼
        // AppBar의 왼쪽에 배치되는 위젯을 정의하는 속성
        leading: IconButton(
          onPressed: goBack,   // 아이콘을 눌렀을 때 콜백 함수
          icon: const Icon(   // 뒤로 가기 아이콘 설정
            Icons.arrow_back,
          ),
        ),
        // AppBar에 액션 버튼을 추가할 수 있는 매개변수
        // AppBar의 오른쪽에 배치되는 위젯을 정의하는 속성
        actions: [
          // 앞으로 가기 버튼
          IconButton(
            onPressed: goForward,
            icon: const Icon(   // 앞으로 가기 아이콘 설정
              Icons.arrow_forward,
            ),
          ),
          // 지정한 홈 주소로 이동 버튼
          IconButton(
            onPressed: goHome,
            icon: const Icon(   // 홈 버튼 아이콘 설정
              Icons.home,
            ),
          ),
        ],
      ),
      // WebView 위젯 추가
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}