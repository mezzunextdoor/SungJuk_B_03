classDiagram
    class 성적 {
        -학생id: String
        -총점: double
        -평균: double
        -자바: double
        -DB: double
        -보안: double
        +성적입력(학생id: String, 자바: int, DB: int, 보안: int) void
        +학점조회(교수id: String, 학생id: String) String
    }

    class 교수 {
        -교수id: String
        +교수체크(교수id: String) boolean
    }

    class Add_Sungjuk_UI {
        <<boundary>>
    }

    class Search_Sungjuk_UI {
        <<boundary>>
    }

    %% 관계 및 다중도 설정
    교수 "1" --> "1..*" 성적 : 관리
    Add_Sungjuk_UI ..> 성적 : 접근
    Search_Sungjuk_UI ..> 성적 : 접근