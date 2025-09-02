# 🏋️‍♂️ Six Club - 헬스 루틴 추천 웹 서비스

사용자의 목표와 신체 정보에 기반해 맞춤형 운동 루틴과 근처 헬스장을 추천해주는 **Spring 기반 웹 서비스**입니다.  
카카오맵 API를 활용한 위치 기반 검색, 운동 루틴 추천 로직, 커뮤니티 기능(Q&A)을 통합한 프로젝트입니다.

---

## 📅 개발 기간

- **2025.06.09 ~ 2025.07.01 (총 23일)**  
- **팀원 수**: 5명  
- **내 역할**: 프로젝트 총괄(팀장), Q&A 게시판, 헬스장 지도 연동, 마이페이지 기능 구현

---

## 💡 기획 배경

헬스 초보자들에게는 ‘어떤 운동을 어떻게 해야 할지’에 대한 정보 부족이 큰 장벽입니다.  
이 서비스를 통해 사용자의 목표(BULK, 다이어트 등)에 따라 운동 루틴을 추천하고,  
**헬스장 정보 + 루틴 + 커뮤니티**까지 제공하는 종합 운동 가이드를 구현하고자 했습니다.

---

## 🔧 사용 기술 스택

| 구분 | 기술 |
|------|------|
| Language | Java |
| Framework | Spring Legacy (MVC), MyBatis |
| DB | Oracle 11g |
| Frontend | HTML, CSS, JavaScript, JSTL |
| API | Kakao Map API, DAUM 주소 검색 API |
| IDE | STS3, SQL Developer |
| 협업 도구 | ERDCloud, Figma, GitHub |

---

## 🧩 주요 기능

### ✅ 사용자 기능
- 나의 목표에 따른 루틴 추천 (다이어트, 벌크업 등)
- 위치 기반 헬스장 검색 (카카오맵 연동)
- Q&A 게시판 (비밀글 포함)
- 마이페이지에서 내 활동 내역 확인

### ✅ 관리자 기능
- 헬스장 정보 등록 및 관리
- 루틴 종류 및 운동법 수정
- 게시판 모니터링

---

## 📌 맡은 역할 상세

- 🧭 **카카오맵 API 연동**
  - 사용자 위치 기반으로 반경 내 헬스장 출력
  - 검색 및 마커 클릭 시 상세 정보 팝업 구현

- 🧩 **Q&A 게시판**
  - 글쓰기, 댓글, 비밀글 처리, CRUD 기능 개발
  - 페이징 처리 및 검색 기능 추가

- 📁 **마이페이지 기능**
  - 나의 루틴, 내 게시글, 예약 정보 등 통합

- 🗂️ **DB 모델링 및 백엔드 연동**
  - MyBatis를 활용한 SQL 매핑 및 쿼리 튜닝
  - Oracle 기반 다중 테이블 관계 설정

---

## 📈 성과 및 회고

- **위치 기반 헬스장 검색** 기능 구현으로 사용자 경험 향상  
- 비밀글, 댓글, 페이징 등 **실제 서비스 수준의 게시판 구축 경험**  
- Spring MVC 구조에 대한 이해와 실전 감각 확보  
- API 연동, 서버-클라이언트 데이터 흐름의 중요성 체감  
- 협업 중 Git 충돌 해결 경험 및 이슈 관리 능력 향상

---

## 🔗 관련 자료

- 🗂️ [ERD 보기](https://drive.google.com/file/d/1n9HLfJO5Wy249rfhEKLDPgXreGYw8PHe/view?usp=sharing)  
- 📊 [발표 자료(PPT)](https://docs.google.com/presentation/d/1vfPrJWHc8aXNnSzVaXhsYdm67C1KBYMj/edit?usp=sharing&ouid=106436189513240672230&rtpof=true&sd=true)  
- ▶️ [시연 영상](https://drive.google.com/file/d/19kCE1w9HylECoXPGQJjLQpq3XAsk71DK/view?usp=sharing)

---

