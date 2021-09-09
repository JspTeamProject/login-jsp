<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;Charset=UTF-8");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="PiDBconn.jsp" %>
<html>
<head>
    <title>아이디중복검사</title>
    <style>
        body {
            text-align: center;
        }

        .button {
            border: none;
            width: 100px;
            height: 50px;
            background-color: salmon;
            border-radius: 5px;
            margin: 10px 10px 10px 10px;
        }

        h3 {
            margin-top: 50px;
        }
    </style>
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
<h3>검색된 아이디는 <%=id%>이며 <br/>
    중복된 아이디로 사용할 수 없습니다.
    <br/>
    아이디를 다시 검색해 주세요!</h3>
<br>
<input type="text" class="newId" placeholder="아이디"><br/>
<button onclick="deny()" class="button">아이디 재입력</button>
<%
} else { %>
<h3>
    검색된 아이디는 <%=id%>이며 사용가능합니다
</h3>
<br>
<button onclick="ok()" class="button">창 닫기</button>

<%
    }
%>

<%
    if (resultSet != null) resultSet.close();
    if (preparedStatement != null) preparedStatement.close();
    if (conn != null) conn.close();
%>
<script>
    const ok = () => {
        opener.IdConfirmed();
        window.close()
    }

    function deny() {
        const newId = document.querySelector(".newId").value;
        opener.IdDenied(newId);
        window.close();
    }
</script>
</body>
</html>
