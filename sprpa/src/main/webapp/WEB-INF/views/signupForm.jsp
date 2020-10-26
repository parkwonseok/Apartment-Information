<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/member/addMember" method="post">
        이메일: <input type="text" name="mb_email"><br>
        비밀번호: <input type="text" name="mb_pw"><br>
        이름: <input type="text" name="mb_name"><br>
        
      
        <input type="submit" value="제출">
    </form>
</body>
</html>
