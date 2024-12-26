<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.buzzjet.PackageModel, com.buzzjet.Package, com.buzzjet.DestinasiModel, com.buzzjet.Destinasi"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
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
		<h2 class="text-2xl font-bold mb-6">Daftar Paket</h2>
		<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
			<%
                PackageModel packageModel = new PackageModel();
                DestinasiModel destinasiModel = new DestinasiModel();
                for (Package pkg : packageModel.getAllPackages()) {
                    Destinasi destinasi = destinasiModel.getAllDestinasi().stream()
                        .filter(d -> d.getId() == pkg.getDestinationId())
                        .findFirst()
                        .orElse(null);
            %>
			<div class="bg-white p-6 rounded-lg shadow-md">
				<h3 class="text-xl font-bold mb-2"><%= pkg.getName() %></h3>
				<p class="text-gray-700 mb-4"><%= pkg.getDescription() %></p>
				<p class="text-gray-700 mb-4">
					Destinasi:
					<%= destinasi != null ? destinasi.getName() : "N/A" %></p>
				<p class="text-gray-900 font-semibold mb-4">
					Harga: Rp
					<%= pkg.getPrice() %></p>
				<a href="./BuyPackage.jsp?id=<%= pkg.getId() %>"
					class="bg-blue-500 text-white rounded-md px-4 py-2 hover:bg-blue-600 transition duration-200">
					Buy </a>
			</div>
			<%
                }
            %>
		</div>
	</section>
</body>
</html>