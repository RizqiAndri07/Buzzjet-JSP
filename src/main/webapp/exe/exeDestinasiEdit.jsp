<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="com.buzzjet.*" %>
	<%
	DestinasiModel destinasiModel = new DestinasiModel();
	try {
		int id = Integer.parseInt(request.getParameter("id"));
		String nama = request.getParameter("nama");
		String deskripsi = request.getParameter("deskripsi");
		
		
		Destinasi destinasi = new Destinasi();
		destinasi.setId(id);
		destinasi.setName(nama);
		destinasi.setDescription(deskripsi);
		
		
		boolean isSuccess = destinasiModel.updateDestinasi(destinasi);
		if(isSuccess) {
			out.println("<script>alert('Destinasi Berhasil Terupdate!')</script>");
		} else {
			out.println("<script>alert('Destinasi Gagal Terupdate!')</script>");	
		}
	} catch(NumberFormatException err) {
		out.println("<script>alert('Input Data Tidak Valid.')</script>");
	} catch(Exception err) {
		err.printStackTrace();
		out.println("<script>alert('Terjadi Kesalahan, Coba Lagi Nanti')</script>");
	}
	%>
	<script>
		location.href = "../view/Destinasi.jsp"
	</script>
</body>
</html>