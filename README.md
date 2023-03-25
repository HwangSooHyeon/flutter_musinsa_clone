# flutter_musinsa_cloning

---

Flutter + Firestore + Provider(Express.js) 어플리케이션

## 💻 프로젝트 소개

--- 

musinsa 어플리케이션을 참고하여 어플리케이션 자체의 기능적인 부분 및 
Firestore, provider를 이용하여 상태 관리 기능을 구현한 프로젝트

## 🕰️ 개발 환경

---

Language: Dart

Framework: Flutter 3

IDE: Android Studio

Database: Firestore

API Server: Express.js

## ⚙️ 주요 기능

---

### 어플리케이션 부분

- HomeScreen
  - CustomScrollView를 이용해 스크롤 시 AppBar가 사라지는 기능 구현
  - setState를 이용해 스크롤 시 BottomNavigationBar가 사라지는 기능 구현 
  - API Server에서 데이터를 가져와 Provider로 상태 관리를 하는 Carousel
  - API Server에서 데이터를 가져와 Provider로 상태 관리를 하는 IconButton; 클릭 시 `Navigator.push`를 통해 새 창으로 이동
- MyScreen 
  - Firestore를 이용한 회원가입, 로그인 기능 구현
  - 회원가입 및 로그인 시 SHA256 알고리즘을 이용해 비밀번호 해싱 구현
- 기타
  - API Server 데이터 송수신 테스트 코드 작성
  - Firestore 데이터 송수신 테스트 코드 작성

### 서버 부분
- Express.js를 이용해 임시 json 데이터를 송신할 수 있도록 구현

## 🔗 외부 링크

--- 

### [무신사 앱 간단 분석](https://lapis-pepper-01e.notion.site/284e0b88497f4fd9a35a32358135d253)
### [무신사 앱 제작 일별 회고](https://lapis-pepper-01e.notion.site/673cfe4b8b484f0a84de16d3dd301d1b)
 - 앱 동작 애니메이션 첨부