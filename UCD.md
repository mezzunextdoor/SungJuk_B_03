```mermaid
graph LR
    %% Actor Definition
    Professor(("교수"))

    subgraph "성적처리시스템"
        %% Use Cases
        UC1(["성적입력"])
        UC2(["학점조회"])
        UC3(["교수체크"])

        %% Relationships (Include)
        UC1 -.->|«include»| UC3
        UC2 -.->|«include»| UC3
    end

    %% Actor to Use Case Connections
    Professor --- UC1
    Professor --- UC2
