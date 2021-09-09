<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="PiDBconn.jsp" %>
<html>
<head>
  <title>아이디중복검사</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");
  String id = request.getParameter("id");

  ResultSet resultSet = null;
  PreparedStatement preparedStatement = null;

  String sql = "select id from db01.member where id = ?";
  preparedStatement = conn.prepareStatement(sql);
  preparedStatement.setString(1, id);
  resultSet = preparedStatement.executeQuery();

  String rid = "";

  if (resultSet.next()) {
    rid = resultSet.getString("id");
  }
%>


<%
  if (id.equals(rid)) {
%>
검색된 아이디는 <%=id%>이며 중복된 아이디로 사용할 수 없습니다.
<br>
아이디를 다시 검색해 주세요!
<br>
<input type="text" class="newId">
<input type="button" value="닫기" onclick="go()">
<%
} else { %>
검색된 아이디는 <%=id%>이며 사용가능합니다
<br>
<input type="button" value="닫기" onclick="window.close()">

<%
  }
%>

<%
  if (resultSet != null) resultSet.close();
  if (preparedStatement != null) preparedStatement.close();
  if (conn != null) conn.close();
%>
<script>
  function go(){
    const newId = document.querySelector(".newId").value;
    opener.callBackID(newId);
    window.close();
  }
</script>
</body>
</html>
