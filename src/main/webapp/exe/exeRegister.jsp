<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.buzzjet.UserModel, com.buzzjet.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Registrasi</title>
</head>
<body>
	<%
	UserModel userModel = new UserModel();

	try {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// Pengecekan apakah username sudah digunakan
		if (userModel.isUsernameTaken(username)) {
			out.println("<script>alert('Username sudah digunakan')</script>");
			response.sendRedirect("../view/register.jsp");
			return;
		}

		User user = new User();
		user.setUsername(username);
		user.setPassowrd(password);
		user.setRole("user"); // Set default role to "user"

		boolean isSuccess = userModel.addUser(user);
		if (isSuccess) {
			out.println("<script>alert('Registrasi Berhasil!')</script>");
			response.sendRedirect("../view/login.jsp");
		} else {
			out.println("<script>alert('Registrasi Gagal!')</script>");
			response.sendRedirect("../view/register.jsp");
		}
	} catch (Exception err) {
		err.printStackTrace();
		out.println("<script>alert('Terjadi Kesalahan, Coba Lagi Nanti')</script>");
		response.sendRedirect("../view/register.jsp");
	}
	%>
</body>
</html>