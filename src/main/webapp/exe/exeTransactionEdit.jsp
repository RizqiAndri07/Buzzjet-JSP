<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.buzzjet.TransactionModel, com.buzzjet.Transaction" %>
<%@ page import="java.io.StringWriter, java.io.PrintWriter" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proses Pembaruan Transaksi</title>
</head>
<body>
    <%
        TransactionModel transactionModel = new TransactionModel();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            double totalAmount = quantity * price;

            // Ambil transaksi yang ada untuk mendapatkan tanggal transaksi
            Transaction existingTransaction = transactionModel.getAllTransactions().stream()
                .filter(t -> t.getId() == id)
                .findFirst()
                .orElse(null);

            if (existingTransaction == null) {
                throw new Exception("Transaksi tidak ditemukan.");
            }

            Transaction transaction = new Transaction();
            transaction.setId(id);
            transaction.setUserId(existingTransaction.getUserId());
            transaction.setPackageId(existingTransaction.getPackageId());
            transaction.setTransactionDate(existingTransaction.getTransactionDate()); // Set tanggal transaksi yang ada
            transaction.setQuantity(quantity);
            transaction.setTotalAmount(totalAmount);

            boolean isSuccess = transactionModel.updateTransaction(transaction);
            if (isSuccess) {
                out.println("<script>alert('Transaksi Berhasil Diperbarui!')</script>");
            } else {
                out.println("<script>alert('Transaksi Gagal Diperbarui!')</script>");
            }
        } catch (NumberFormatException err) {
            out.println("<script>alert('Input Data Tidak Valid.')</script>");
            StringWriter sw = new StringWriter();
            err.printStackTrace(new PrintWriter(sw));
            out.println("<pre>" + sw.toString() + "</pre>");
        } catch (SQLException err) {
            out.println("<script>alert('Kesalahan SQL: " + err.getMessage() + "')</script>");
            StringWriter sw = new StringWriter();
            err.printStackTrace(new PrintWriter(sw));
            out.println("<pre>" + sw.toString() + "</pre>");
        } catch (Exception err) {
            out.println("<script>alert('Terjadi Kesalahan: " + err.getMessage() + "')</script>");
            StringWriter sw = new StringWriter();
            err.printStackTrace(new PrintWriter(sw));
            out.println("<pre>" + sw.toString() + "</pre>");
        }
    %>
    <script>
        location.href = '../view/user/Transactions.jsp';
    </script>
</body>
</html>