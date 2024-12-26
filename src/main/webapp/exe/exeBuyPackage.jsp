<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.buzzjet.TransactionModel, com.buzzjet.Transaction" %>
<%@ page import="java.io.StringWriter, java.io.PrintWriter" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Pembelian</title>
</head>
<body>
    <%
        TransactionModel transactionModel = new TransactionModel();

        try {
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                throw new Exception("User ID tidak ditemukan di sesi.");
            }
            String packageIdStr = request.getParameter("package_id");
            String quantityStr = request.getParameter("quantity");
            String priceStr = request.getParameter("price");

            if (packageIdStr == null || quantityStr == null || priceStr == null) {
                throw new Exception("Parameter tidak lengkap.");
            }

            int packageId = Integer.parseInt(packageIdStr);
            int quantity = Integer.parseInt(quantityStr);
            double price = Double.parseDouble(priceStr);
            double totalAmount = quantity * price;
            java.util.Date transactionDate = new java.util.Date();

            Transaction transaction = new Transaction();
            transaction.setUserId(userId);
            transaction.setPackageId(packageId);
            transaction.setTransactionDate(transactionDate);
            transaction.setQuantity(quantity);
            transaction.setTotalAmount(totalAmount);

            boolean isSuccess = transactionModel.insertTransaction(transaction);
            if (isSuccess) {
                out.println("<script>alert('Pembelian Berhasil!')</script>");
            } else {
                out.println("<script>alert('Pembelian Gagal!')</script>");
            }
        } catch (SQLException err) {
        	err.printStackTrace();
        } 
        
    %>
    <script>
        location.href = '../view/user/Transactions.jsp';
    </script>
</body>
</html>