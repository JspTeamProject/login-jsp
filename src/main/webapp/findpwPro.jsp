<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Pack.memberBean" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="recv" class="Pack.memberBean" scope="page"/>
<jsp:setProperty name="recv" property="*"/>

아이디 : <jsp:getProperty name="recv" property="id"/>
<br/>
이름 : <jsp:getProperty name="recv" property="name"/>

</body>
</html>
