```mermaid
sequenceDiagram
    autonumber
    actor P_Actor as 교수
    participant UI as : Add_Sungjuk_UI
    participant S as sj : 성적
    participant P as pf : 교수

    P_Actor->>+UI: 성적입력 요청
    
    %% 성적 객체 생성 및 입력 호출
    UI->>+S: <<create>>
    UI->>S: 성적입력(교수id, 학생id, 자바, DB, 보안)

    %% 교수 권한 확인 단계
    S->>+P: <<create>>
    S->>P: check := 교수체크(교수id)
    P-->>-S: check 결과 반환

    %% 결과 처리 분기
    alt check == true
        Note right of S: 성적 계산 프로세스
        S->>S: 총점 = 자바 + DB + 보안
        S->>S: 평균 = 총점 / 3
        S->>S: 학점 = 학점계산(평균)
        S-->>UI: return true (성공)
    else check == false
        Note right of S: 권한 확인 실패
        S-->>-UI: return false (실패)
    end

    UI-->>-P_Actor: 최종 처리 결과 출력
