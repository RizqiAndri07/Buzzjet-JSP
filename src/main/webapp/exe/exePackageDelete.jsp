<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.buzzjet.PackageModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Paket</title>
</head>
<body>
    <%
        PackageModel packageModel = new PackageModel();

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            boolean isSuccess = packageModel.deletePackage(id);
            if (isSuccess) {
                out.println("<script>alert('Paket Berhasil Dihapus!')</script>");
            } else {
                out.println("<script>alert('Paket Gagal Dihapus!')</script>");
            }
        } catch (NumberFormatException err) {
            out.println("<script>alert('Input Data Tidak Valid.')</script>");
        } catch (Exception err) {
            err.printStackTrace();
            out.println("<script>alert('Terjadi Kesalahan, Coba Lagi Nanti')</script>");
        }
    %>
    <script>
        location.href = '../view/Package.jsp';
    </script>
</body>
</html>