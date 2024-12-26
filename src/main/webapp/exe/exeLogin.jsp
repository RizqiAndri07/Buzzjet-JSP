<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Login Akun</title>
</head>
<body>
    <%@ page import="com.buzzjet.*"%>
    <%
    UserModel userModel = new UserModel();
    try {
        String username = request.getParameter("username");
        String password = request.getParameter("password"); 

        User user = userModel.validateUser(username, password);
        if (user != null) {
            session.setAttribute("role", user.getRole());
            out.println("<script>alert('Login berhasil!')</script>");
            if ("admin".equals(user.getRole())) {
                response.sendRedirect("../view/Package.jsp");
            } else if ("user".equals(user.getRole())) {
                response.sendRedirect("../user/home.jsp");
            } else {
                response.sendRedirect("../index.jsp");
            }
        } else {
            out.println("<script>alert('Username atau Email atau Password yang Anda Masukkan Salah!')</script>");
            response.sendRedirect("../view/login.jsp");
        }
    } catch (Exception err) {
        err.printStackTrace();
        out.println("<script>alert('Terjadi Kesalahan, Coba Lagi Nanti')</script>");
    }
    %>
</body>
</html>