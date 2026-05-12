<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="A.성적" %>
<%--
    Search_Sungjuk_UI.jsp  (boundary 클래스)
    - 입력창 없이, 하드코딩된 교수id/학생id 로 학점조회 결과만 텍스트 출력
    - 순차도(학점조회) 흐름을 그대로 따른다.
    - 데모용 초기 데이터는 model.성적 클래스의 static 블록에서 미리 입력됨.
--%>
<%
    request.setCharacterEncoding("UTF-8");

    /* ── 테스트 데이터 (입력창 대신 하드코딩) ───────────── */
    String 교수id = "inha";
    String 학생id = "20231234";

    /* ── 순차도 step 1 : 학점조회 호출 ──────────────────── */
    성적 sj   = new 성적();
    String 학점 = sj.학점조회(교수id, 학생id);
%>
<!DOCTYPE html>
<html lang="ko">
<head><meta charset="UTF-8"><title>학점조회 결과</title></head>
<body>
<pre>
==================== 학점조회 처리 결과 ====================
교수 id : <%= 교수id %>
학생 id : <%= 학생id %>
------------------------------------------------------------
<% if (학점 != null) { %>
처리결과 : 학점조회 성공
학 점  : <%= 학점 %>
<% } else { %>
처리결과 : 학점조회 실패 (교수 id 오류 또는 입력된 성적 없음)
<% } %>
============================================================
</pre>
</body>
</html>