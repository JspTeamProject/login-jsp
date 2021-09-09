<%--
  Created by IntelliJ IDEA.
  User: ojh21
  Date: 2021-09-09
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Pack.Member" %>
<%@ include file="dbconn.jsp"%>
<jsp:useBean id="recv" class="Pack.Member" scope="page"/>
<jsp:setProperty name="recv" property="*"/>
<html>
<head>
    <title>Login Result</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    try {
        String sql = "select * from member where id = ? and pw = ? ";
        preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1, recv.getId());
        preparedStatement.setString(2, recv.getPw());
        System.out.println(recv.getId());
        System.out.println(recv.getPw());
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            recv.setId(resultSet.getString("id"));
            recv.setPw(resultSet.getString("pw"));
            recv.setName(resultSet.getString("name"));
            recv.setEmail(resultSet.getString("email"));
            recv.setAddress(resultSet.getString("address"));
            recv.setPhone(resultSet.getString("phone"));
        }
        if(recv.getName()==null || recv.getName() == ""){
%>
<h1> 로그인 정보가 올바르지 않습니다. </h1><br>
<a href="index.jsp">돌아가기</a>
<%
    }else {
%>
<fieldset>
    <legend>로그인 정보</legend>
    <form method="post" action="update.jsp">
        <table style="margin-left : auto; margin-right :auto;">
            <tr>
                <td style="text-align: right">접속 중인 ID :</td>
                <td colspan="2"><jsp:getProperty name="recv" property="id"/>
                </td>
            </tr>

            <tr>
                <td style="text-align: right">PW :</td>
                <td><jsp:getProperty name="recv" property="pw"/>
                </td>
                <td><input type="text" name="pw" value="<jsp:getProperty name="recv" property="pw"/>"></input></td>
            </tr>

            <tr>
                <td style="text-align: right">이름 :</td>
                <td><jsp:getProperty name="recv" property="name"/>
                </td>
                <td><input type="text" name="name" value="<jsp:getProperty name="recv" property="name"/>"></input></td>
            </tr>
            <tr>
                <td style="text-align: right">이메일 :</td>
                <td><jsp:getProperty name="recv" property="email"/>
                </td>
                <td><input type="text" name="email" value="<jsp:getProperty name="recv" property="email"/>"></input></td>
            </tr>
            <tr>
                <td style="text-align: right">주소 :</td>
                <td><jsp:getProperty name="recv" property="address"/>
                </td>
                <td><input type="text" name="address" value="<jsp:getProperty name="recv" property="address"/>"></input></td>
            </tr>
            <tr>
                <td style="text-align: right">전화번호 :</td>
                <td><jsp:getProperty name="recv" property="phone"/>
                </td>
                <td><input type="text" name="phone" value="<jsp:getProperty name="recv" property="phone"/>"></input></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td><input type="submit" value="수정하기"></td>
            </tr>
        </table>
    </form>
</fieldset>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (preparedStatement != null) preparedStatement.close();
        if (conn != null) conn.close();
        if (resultSet != null) resultSet.close();
    }
%>
</body>
</html>