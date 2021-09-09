<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>로그인</title>
</head>
<style>
      a:link{color:black; text-decoration:none;}
      a:visited{color:black;text-decoration: none;}
      a:hover{color:coral;text-decoration: underline;}
</style>
<body>
<table style="margin-left : auto; margin-right : auto; text-align: center; border:solid coral 1px" >
    <form method="post" action="loginPro.jsp">
        <tr>
            <td>이름</td>
            <td><input type="text" name="name"></td>
            <td rowspan="2"><input style="height:50px;background:lightcoral; border:0px" type="submit" value="로그인"></td>
        </tr>
        <tr>
            <td>아이디</td>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <td><a class="loginMenu" href="#">회원가입</a></td>
            <td><a class="loginMenu" href="#">아이디 찾기</a></td>
            <td><a class="loginMenu" href="#">비밀번호 찾기</a></td>
        </tr>
    </form>
</table>
</body>
</html>