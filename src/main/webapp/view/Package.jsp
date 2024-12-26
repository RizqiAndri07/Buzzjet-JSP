<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daftar Paket</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<div
		class="flex w-full bg-slate-400 justify-center gap-x-8 py-4 shadow-md">
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
		<%@ page import="com.buzzjet.*"%>
		<%
		String role = (String) session.getAttribute("role");
		if (role == null || !role.equals("admin")) {
			response.sendRedirect("../login.jsp");
			return;
		}
		%>

		<!-- Tombol Tambah Paket -->
		<div class="w-full flex justify-end mb-4">
			<a href="./PackageTambah.jsp"
				class="bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-4 rounded-md transition duration-200">
				+ Tambah Paket </a>
		</div>

		<!-- Tabel Paket -->
		<div class="w-full overflow-x-auto">
			<table
				class="w-full border-collapse border border-gray-300 shadow-md rounded-lg">
				<!-- Header Tabel -->
				<thead>
					<tr class="bg-gray-100 text-gray-700">
						<th class="border border-gray-300 px-4 py-2">No</th>
						<th class="border border-gray-300 px-4 py-2">Nama Paket</th>
						<th class="border border-gray-300 px-4 py-2">Deskripsi</th>
						<th class="border border-gray-300 px-4 py-2">Harga</th>
						<th class="border border-gray-300 px-4 py-2">Destinasi</th>
						<th class="border border-gray-300 px-4 py-2">Aksi</th>
					</tr>
				</thead>
				<!-- Isi Tabel -->
				<tbody>
					<%
					PackageModel packageModel = new PackageModel();
					DestinasiModel destinasiModel = new DestinasiModel();
					int countPackage = packageModel.getAllPackages().size();
					int no = 0;
					for (int i = 0; i < countPackage; i++) {
						com.buzzjet.Package pkg = packageModel.getAllPackages().get(i);
						Destinasi destinasi = destinasiModel.getAllDestinasi().stream().filter(d -> d.getId() == pkg.getDestinationId())
						.findFirst().orElse(null);
					%>
					<tr class="hover:bg-gray-50 even:bg-gray-50">
						<td class="border border-gray-300 px-4 py-2 text-center"><%=++no%></td>
						<td class="border border-gray-300 px-4 py-2"><%=pkg.getName()%></td>
						<td class="border border-gray-300 px-4 py-2"><%=pkg.getDescription()%></td>
						<td class="border border-gray-300 px-4 py-2"><%=pkg.getPrice()%></td>
						<td class="border border-gray-300 px-4 py-2"><%=destinasi != null ? destinasi.getName() : "N/A"%></td>
						<td class="border border-gray-300 px-4 py-2 text-center">
						<a
							href="./PackageEdit.jsp?id=<%=pkg.getId()%>"
							class="text-blue-500 hover:underline mr-2">Edit</a> 
							<a
							href="../exe/exePackageDelete.jsp?id=<%=pkg.getId()%>"
							class="text-red-500 hover:underline">Hapus</a>
							</td>
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