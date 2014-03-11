#NHN NEXT : Ruby on Rails Study
- [SLiPP 위키](http://slipp.net/wiki/pages/viewpage.action?pageId=16416819)

##Principle
1. SoC : Seperation of Concerns
    - encapsulation
    - information hiding
2. Controller be light, Model be heavy


##Requirements Spec
- original requirements spec : https://www.evernote.com/shard/s212/sh/912d1fad-6dce-48e7-816d-ccb8de995f49/c301540803eb851ec28db3ef8cd86e3d

- v0.1.0
  - Model
    - Album Model은 두 concern을 포함한다. 
      - Web Crawler
      - Youtube Parser

    - CONTENT_PROVIDER Model은 Album Model을 상속받는다.
    - CONTENT_PROVIDER Model은 실제 DB를 가지지 않는다. 실제 테이블은 Album에 의해서만 생성된다.

    - Album Model은 DB에 관한 모든 책임을 가진다. 즉, validation은 Album Model 에서 이루어져야 한다. 
    - Template : Album Model은 아직 구현되지 않은 클래스 메쏘드를 가져야 한다.
    - other models must override method

    - Encapsulation 

  - Controller 
    - be Light
    - 모델 / 뷰 / 컨트롤러에서 모두 사용하는 기능에 대해서 helper를 가진다.
    - url_generator는 반드시 헬퍼에 포함되어야 한다.

  - View
    - 사용자는 음악을 선택할 수 있다.
    - 사용자는 음악 리스트를 볼 수 있다.
    - 사용자는 음악 리스트를 업데이트 할 수 있다.


- v0.1.2
  - View
    - 사용자는 직접 음악을 검색하고 들을 수 있어야한다.
    - 그 과정에서 페이지 리로딩은 일어나면 안된다. -> AJAX로 구현할 것
    - 사용자는 현재 듣고 있는 음악이 무엇인지 쉽게 볼 수 있어야 한다.

  - Controller
    - 사용자의 검색 쿼리를 받아서 모델로 전달할 것

 - Model
    - 컨트롤러가 보낸 쿼리를 가지고 유투브 파싱을 할 것
    - 정보를 JSON형식으로 전달할 것


