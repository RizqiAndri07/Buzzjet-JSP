<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.buzzjet.TransactionModel, com.buzzjet.Transaction, com.buzzjet.PackageModel, com.buzzjet.Package"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daftar Transaksi</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<div class="flex w-full bg-slate-400 justify-center gap-x-8 py-4">
		<a href="./Home.jsp"
			class="text-white font-medium hover:text-gray-200 transition duration-200">Home</a>
		<a href="./Transactions.jsp"
			class="text-white font-medium hover:text-gray-200 transition duration-200">Transaksi</a>
		<a href="../../exe/exeLogout.jsp"
			class="text-white font-medium hover:text-gray-200 transition duration-200">Logout</a>
	</div>
	<section
		class="w-full flex flex-col justify-center items-center my-6 px-4">
		<h2 class="text-2xl font-bold mb-6">Daftar Transaksi</h2>
		<div class="w-full max-w-4xl">
			<%
                Integer userId = (Integer) session.getAttribute("userId");
                if (userId == null) {
                    response.sendRedirect("../login.jsp");
                    return;
                }

                TransactionModel transactionModel = new TransactionModel();
                PackageModel packageModel = new PackageModel();
                int no = 0;
                for (Transaction transaction : transactionModel.getAllTransactions()) {
                    if (transaction.getUserId() == userId) {
                        Package pkg = packageModel.getAllPackages().stream()
                            .filter(p -> p.getId() == transaction.getPackageId())
                            .findFirst()
                            .orElse(null);
            %>
			<div class="bg-white p-6 rounded-lg shadow-md mb-4">
				<h3 class="text-xl font-bold mb-2">
					Transaksi
					<%= ++no %></h3>
				<p class="text-gray-700 mb-2">
					Nama Paket:
					<%= pkg != null ? pkg.getName() : "N/A" %></p>
				<p class="text-gray-700 mb-2">
					Jumlah:
					<%= transaction.getQuantity() %></p>
				<p class="text-gray-700 mb-2">
					Total: Rp
					<%= transaction.getTotalAmount() %></p>
				<div class="flex gap-4">
					<a href="./TransactionEdit.jsp?id=<%= transaction.getId() %>"
						class="bg-blue-500 text-white rounded-md px-4 py-2 hover:bg-blue-600 transition duration-200">
						Edit </a> <a
						href="../../exe/exeTransactionDelete.jsp?id=<%= transaction.getId() %>"
						class="bg-red-500 text-white rounded-md px-4 py-2 hover:bg-red-600 transition duration-200">
						Cancel </a>
				</div>
			</div>
			<%
                    }
                }
            %>
		</div>
	</section>
</body>
</html>