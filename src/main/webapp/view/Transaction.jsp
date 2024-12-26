<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.buzzjet.TransactionModel, com.buzzjet.Transaction, com.buzzjet.PackageModel, com.buzzjet.Package, com.buzzjet.UserModel, com.buzzjet.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daftar Transaksi</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<div class="flex w-full bg-slate-400 justify-center gap-x-8 py-4">
		<a href="./Destinasi.jsp"
			class="text-white font-medium hover:text-gray-200 transition duration-200">Destinasi</a>
		<a href="./Package.jsp"
			class="text-white font-medium hover:text-gray-200 transition duration-200">Paket</a>
		<a href="./Transaction.jsp"
			class="text-white font-medium hover:text-gray-200 transition duration-200">Transaksi</a>
		<a href="../exe/exeLogout.jsp"
			class="text-white font-medium hover:text-gray-200 transition duration-200">Logout</a>
	</div>
	<section
		class="w-full flex flex-col justify-center items-center my-6 px-4">
		<h2 class="text-2xl font-bold mb-6">Daftar Transaksi</h2>
		<div class="w-full overflow-x-auto">
			<table
				class="w-full border-collapse border border-gray-300 shadow-md rounded-lg">
				<!-- Header Tabel -->
				<thead>
					<tr class="bg-gray-100 text-gray-700">
						<th class="border border-gray-300 px-4 py-2">No</th>
						<th class="border border-gray-300 px-4 py-2">Nama User</th>
						<th class="border border-gray-300 px-4 py-2">Nama Paket</th>
						<th class="border border-gray-300 px-4 py-2">Tanggal
							Transaksi</th>
						<th class="border border-gray-300 px-4 py-2">Jumlah</th>
						<th class="border border-gray-300 px-4 py-2">Total</th>
					</tr>
				</thead>
				<!-- Isi Tabel -->
				<tbody>
					<%
					TransactionModel transactionModel = new TransactionModel();
					PackageModel packageModel = new PackageModel();
					UserModel userModel = new UserModel();
					int no = 0;
					for (Transaction transaction : transactionModel.getAllTransactions()) {
						Package pkg = packageModel.getAllPackages().stream().filter(p -> p.getId() == transaction.getPackageId())
						.findFirst().orElse(null);
						User user = userModel.getAllUsers().stream().filter(u -> u.getId() == transaction.getUserId()).findFirst()
						.orElse(null);
					%>
					<tr class="hover:bg-gray-50 even:bg-gray-50">
						<td class="border border-gray-300 px-4 py-2 text-center"><%=++no%></td>
						<td class="border border-gray-300 px-4 py-2"><%=user != null ? user.getUsername() : "N/A"%></td>
						<td class="border border-gray-300 px-4 py-2"><%=pkg != null ? pkg.getName() : "N/A"%></td>
						<td class="border border-gray-300 px-4 py-2"><%=transaction.getTransactionDate()%></td>
						<td class="border border-gray-300 px-4 py-2"><%=transaction.getQuantity()%></td>
						<td class="border border-gray-300 px-4 py-2"><%=transaction.getTotalAmount()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>