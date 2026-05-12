sequenceDiagram
    autonumber
    actor 교수 as 교수
    participant UI as 성적입력화면
    participant Controller as 성적관리컨트롤러
    participant Data as 성적데이터베이스

    교수->>UI: 성적 입력 요청(교수id, 학생id, 자바, DB, 보안)
    UI->>Controller: 성적 저장 처리(교수id, 학생id, 자바, DB, 보안)

    Note right of Controller: [교수체크] include
    Controller->>Controller: 교수id 확인 ("inha")

    alt 교수id == "inha"
        Controller->>Controller: 총점 및 평균 계산
        Controller->>Data: 성적 정보 저장(학생id, 자바, DB, 보안, 총점, 평균)
        Data-->>Controller: 저장 완료 응답
        Controller-->>UI: 성적 입력 성공 메시지
        UI-->>교수: "성적이 정상적으로 등록되었습니다"
    else 교수id != "inha"
        Controller-->>UI: 권한 오류 반환
        UI-->>교수: "교수 ID가 일치하지 않습니다"
    end