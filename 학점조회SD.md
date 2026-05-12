sequenceDiagram
    autonumber
    actor 교수 as 교수
    participant UI as 학점조회화면
    participant Controller as 성적관리컨트롤러
    participant Data as 성적데이터베이스

    교수->>UI: 학점 조회 요청(교수id, 학생id)
    UI->>Controller: 학점 산출 및 조회 요청(교수id, 학생id)

    Note right of Controller: [교수체크] include
    Controller->>Controller: 교수id 확인 ("inha")

    alt 교수id == "inha"
        Controller->>Data: 학생 성적 데이터 요청(학생id)
        Data-->>Controller: 성적 데이터 반환(평균 포함)
        
        Note right of Controller: [학점 부여 로직]<br/>90↑: A, 80↑: B, 80↓: C
        Controller->>Controller: 학점 결정
        
        Controller-->>UI: 조회 결과 반환(학생id, 평균, 학점)
        UI-->>교수: 학점 결과 화면 표시
    else 교수id != "inha"
        Controller-->>UI: 권한 오류 반환
        UI-->>교수: "조회 권한이 없습니다"
    end