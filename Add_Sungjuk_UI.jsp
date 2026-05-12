<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="A.성적" %>
<%--
    Add_Sungjuk_UI.jsp  (boundary 클래스)
    - 입력창 없이, 하드코딩된 테스트 데이터로 성적입력 처리 결과만 텍스트 출력
    - 순차도(성적입력) 흐름을 그대로 따른다.
--%>
<%
    request.setCharacterEncoding("UTF-8");

    /* ── 테스트 데이터 (입력창 대신 하드코딩) ───────────── */
    String 교수id = "inha";
    String 학생id = "20231234";
    double 자바  = 95;
    double DB    = 88;
    double 보안  = 91;

    /* ── 순차도 step 1 : 성적 객체 생성 ─────────────────── */
    성적 sj = new 성적();

    /* ── 순차도 step 2 : 성적입력 호출 ──────────────────── */
    boolean 결과 = sj.성적입력(교수id, 학생id, 자바, DB, 보안);
%>
<!DOCTYPE html>
<html lang="ko">
<head><meta charset="UTF-8"><title>성적입력 결과</title></head>
<body>
<pre>
==================== 성적입력 처리 결과 ====================
교수 id : <%= 교수id %>
학생 id : <%= 학생id %>
자 바  : <%= 자바 %>
DB     : <%= DB %>
보 안  : <%= 보안 %>
------------------------------------------------------------
<% if (결과) { %>
처리결과 : 성적입력 성공
총 점  : <%= sj.get총점() %>
평 균  : <%= sj.get평균() %>
학 점  : <%= sj.get학점() %>
<% } else { %>
처리결과 : 성적입력 실패 (교수 id 가 유효하지 않음)
<% } %>
============================================================
</pre>
</body>
</html>