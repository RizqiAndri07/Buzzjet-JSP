<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="com.buzzjet.*"%>
	<%
	DestinasiModel destinasiModel = new DestinasiModel();

	try {
		int id = Integer.parseInt(request.getParameter("id"));

		Destinasi b = new Destinasi();
		b.setId(id);

		boolean isSuccess = destinasiModel.deleteDestinasi(id);
		if (isSuccess) {
			out.println("<script>alert('Destinasi Berhasil Dihapus!')</script>");
		} else {
			out.println("<script>alert('Destinasi Gagal Dihapus!')</script>");
		}
	} catch (NumberFormatException err) {
		out.println("<script>alert('Input Data Tidak Valid.')</script>");
	} catch (Exception err) {
		err.printStackTrace();
		out.println("<script>alert('Terjadi Kesalahan, Coba Lagi Nanti')</script>");
	}
	%>
	<script>
		location.href = "../view/Destinasi.jsp"
	</script>
</body>
</html>