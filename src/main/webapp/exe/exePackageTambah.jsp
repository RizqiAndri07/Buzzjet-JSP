<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.buzzjet.PackageModel, com.buzzjet.Package" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        PackageModel packageModel = new PackageModel();

        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int destinationId = Integer.parseInt(request.getParameter("destination_id"));

            Package pkg = new Package();
            pkg.setName(name);
            pkg.setDescription(description);
            pkg.setPrice(price);
            pkg.setDestinationId(destinationId);

            boolean isSuccess = packageModel.insertPackage(pkg);
            if (isSuccess) {
                out.println("<script>alert('Paket Berhasil Ditambahkan!')</script>");
            } else {
                out.println("<script>alert('Paket Gagal Ditambahkan!')</script>");
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