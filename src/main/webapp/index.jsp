<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<div class="flex w-full bg-slate-400 justify-center gap-x-8 py-4 ">
		<a href="./view/Destinasi.jsp">Destinasi</a> <a
			href="./view/Package.jsp">Paket</a> <a
			href="./view/daftarTransaksi.jsp">Transaksi</a>
	</div>
	<section class = "w-full h-screen flex flex-col items-center justify-center border">
	
	
	<%
	String usernameOrEmail = (String) session.getAttribute("id");
	if (usernameOrEmail != null) {
	%>
	<h1 class="font-black text-2xl">
		Selamat Datang boss,
		<%=usernameOrEmail%>!
	</h1>
	<a href="./exe/exeLogout.jsp">Logout</a>
	<%
	} else {
	%>
	<h1 class="font-black text-2xl">Harap Login Terlebih Dahulu</h1>
	<a href="./view/login.jsp" class="bg-blue-500 px-3 py-2 rounded-lg">Login</a>
	<%
	}
	%>
	</section>
	

</body>
</html>