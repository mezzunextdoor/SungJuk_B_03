classDiagram
    direction TB
    
    class Add_Sungjuk_UI {
        <<boundary>>
    }
    
    class Search_Sungjuk_UI {
        <<boundary>>
    }
    
    class 성적 {
        -학점: String
        -총점: double
        -평균: double
        +성적입력(교수id: String, 학생id: String, 자바: double, DB: double, 보안: double) double
        +학점조회(교수id: String, 학생id: String) String
    }
    
    class 교수 {
        +교수체크(교수id: String) boolean
    }

    %% 관계 설정: 레이블에 따옴표와 특수기호를 사용하여 명확히 표시
    Add_Sungjuk_UI ..> 성적 : "«include»"
    Search_Sungjuk_UI ..> 성적 : "«include»"
    성적 ..> 교수 : "«include»"