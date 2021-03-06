# alpacaV2  

첫번째로 만든 alpaca는 jsp를 기반으로 게시판을 만들었습니다  

기능의 동작을 목표로 연습의 목적이 강한 첫번째 프로젝트는 모델1 방식의 구현을  
우선으로 만들었기에 코드를 알아보기 힘들고 개선의 여지가 많이 남은 습작이었습니다.  

## alpacaV2에서는  

* 로그인 / 세션 기능  
* CRUD 게시글 생성 / 읽기 / 갱신 / 삭제  
* 게시글 목록 페이징  
    * sql문 조건없이 jsp에서 페이징 처리  
    * break문 없이 jsp에서 페이징 처리  
* 댓글 기능 추가  
    * 상세보기 페이지에서 댓글 생성 / 수정 / 삭제  
    * 답글 기능  
* 게시글 조회수 기능  
* 만드는 과정에서의 문제들  
    * 데이터베이스 저장시 한글 저장이 안되는 현상 수정  
    * 게시글 번호 음수표기 수정  
    * 페이지가 없는곳에서 넘어가는 문제 수정  

의 과정을 거쳐서 MVC를 공부한 후 이를 바탕으로 제작을 시작했고 완벽한 MVC는  
아니지만 습작대비 최소한의 코드만이 뷰페이지상에서 제거 되었고 서블릿에서의  
처리를 고민하여 제작하였습니다.  

이후 프론트페이지는 잘 만들지 못했지만 기능의 구현을 점검하고자 GCP상에서  
로컬이 아닌 서비스 환경에서의 배포를 시도 했지만 데이터베이스와 관련된  
설정부분의 문제로 에러를 파악하려 노력했지만 찾지 못했습니다.  

alpacaV2는 중단한 상태이고, spring-boot-get-started 실습완료 후 스프링을 기반으로  
새로이 만들어 볼 예정입니다.  

alpacaV3에서는 sql을 중심으로 완성도를 높일수 있게 시도하겠습니다.
