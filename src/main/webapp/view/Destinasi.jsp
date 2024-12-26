<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<div class="flex w-full bg-slate-400 justify-center gap-x-8 py-4 ">
		<a href="./view/Destinasi.jsp">Destinasi</a> <a
			href="./view/daftarSupplier.jsp">Supplier</a> <a
			href="./view/daftarTransaksi.jsp">Transaksi</a>
	</div>
	<section
		class="w-full flex flex-col justify-center items-center my-6 px-4">
		<%@ page import="com.buzzjet.*"%>
		<%
    String role = (String) session.getAttribute("role");
    %>

		<!-- Tombol Tambah Barang -->
		<div class="w-full flex justify-end mb-4">
			<% if (role != null) { %>
			<a href="./DestinasiTambah.jsp"
				class="bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-4 rounded-md transition duration-200">
				+ Tambah Destinasi </a>
			<% } %>
		</div>

		<!-- Tabel Destinasi -->
		<div class="w-full overflow-x-auto">
			<table
				class="w-full border-collapse border border-gray-300 shadow-md rounded-lg">
				<!-- Header Tabel -->
				<thead>
					<tr class="bg-gray-100 text-gray-700">
						<th class="border border-gray-300 px-4 py-2">No</th>
						<th class="border border-gray-300 px-4 py-2">Nama Destinasi</th>
						<th class="border border-gray-300 px-4 py-2">Deskripsi</th>
						<% if (role != null) { %>
						<th class="border border-gray-300 px-4 py-2">Aksi</th>
						<% } %>
					</tr>
				</thead>
				<!-- Isi Tabel -->
				<tbody>
					<%
                DestinasiModel destinasiModel = new DestinasiModel();
                int countBarang = destinasiModel.getAllDestinasi().size();
                int no = 0;
                for (int i = 0; i < countBarang; i++) {
                %>
					<tr class="hover:bg-gray-50 even:bg-gray-50">
						<td class="border border-gray-300 px-4 py-2 text-center"><%= ++no %></td>
						<td class="border border-gray-300 px-4 py-2"><%= destinasiModel.getAllDestinasi().get(i).getName() %></td>
						<td class="border border-gray-300 px-4 py-2"><%= destinasiModel.getAllDestinasi().get(i).getDescription() %></td>
						<% if (role != null) { %>
						<td class="border border-gray-300 px-4 py-2 text-center"><a
							href="./DestinasiEdit.jsp?id=<%= destinasiModel.getAllDestinasi().get(i).getId() %>"
							class="text-blue-500 hover:underline mr-2"> Edit </a> <a
							href="../exe/exeDestinasiDelete.jsp?id=<%= destinasiModel.getAllDestinasi().get(i).getId() %>"
							class="text-red-500 hover:underline"> Hapus </a></td>
						<% } %>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</section>

</body>
</html>