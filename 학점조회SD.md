```mermaid
sequenceDiagram
    autonumber
    actor P_Actor as 교수
    participant UI as : Search_Sungjuk_UI
    participant S as sj : 성적
    participant P as pf : 교수

    P_Actor->>+UI: 학점조회 요청 (교수id, 학생id)
    UI->>+S: 학점조회(교수id, 학생id)

    %% 교수 권한 확인 단계
    S->>+P: <<create>>
    S->>P: check := 교수체크(교수id)
    P-->>-S: check 결과 반환

    %% 결과 처리 분기
    alt check == true
        Note right of S: 저장된 데이터베이스에서 학점 검색
        S-->>UI: 학점 반환
    else check == false
        Note right of S: 권한 없음 (조회 실패)
        S-->>-UI: null 반환
    end

    UI-->>-P_Actor: 조회 결과(학점 또는 에러 메시지) 출력
