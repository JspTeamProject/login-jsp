<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;Charset=UTF-8");
%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="Pack.Member" %>
<%@include file="PiDBconn.jsp" %>
<jsp:useBean id="recv" class="Pack.Member" scope="page"/>
<jsp:setProperty name="recv" property="*"/>
<html>
<head>
    <title>Login Result</title>
    <meta charset="UTF-8">
</head>
<style>
    a:link{color:coral; text-decoration:none;}
    a:visited{color:coral;text-decoration: none;}
    a:hover{color:black;text-decoration: underline;}
</style>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;Charset=UTF-8");
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    try {
        String sql = "select * from db01.member where id = ? and pw = ? ";
        System.out.println(recv.getId());
        System.out.println(recv.getPw());
        preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1, recv.getId());
        preparedStatement.setString(2, recv.getPw());

        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            recv.setId(resultSet.getString("id"));
            recv.setPw(resultSet.getString("pw"));
            recv.setName(resultSet.getString("name"));
            System.out.println("resultSet : " + resultSet.getString("name"));
            System.out.println("recv.getName : " + recv.getName());
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
    <form method="post" action="update.jsp" accept-charset="UTF-8">
        <table style="margin-left : auto; margin-right :auto;">
            <tr>
                <td style="text-align: right">접속 중인 ID :</td>
                <td colspan="2"><jsp:getProperty name="recv" property="id"/></td>
                <td><input type="hidden" name="id" value="<jsp:getProperty name="recv" property="id"/>"></input></td>
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
                <td colspan="2" style="text-align: center"><a href="index.jsp">홈화면</a></td>
                <td><input style="background:coral;width:100%; border:0px"type="submit" value="수정하기"></td>
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