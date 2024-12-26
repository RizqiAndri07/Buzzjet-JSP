<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.buzzjet.TransactionModel" %>
<%@ page import="java.io.StringWriter, java.io.PrintWriter" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Penghapusan Transaksi</title>
</head>
<body>
    <%
        TransactionModel transactionModel = new TransactionModel();

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            boolean isSuccess = transactionModel.deleteTransaction(id);
            if (isSuccess) {
                out.println("<script>alert('Transaksi Berhasil Dihapus!')</script>");
            } else {
                out.println("<script>alert('Transaksi Gagal Dihapus!')</script>");
            }
        } catch (NumberFormatException err) {
           err.printStackTrace();
        } 
    %>
    <script>
        location.href = '../view/user/Transactions.jsp';
    </script>
</body>
</html>