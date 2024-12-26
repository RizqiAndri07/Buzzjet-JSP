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
	<%
	String role = (String) session.getAttribute("role");
	if (role == null || !role.equals("admin")) {
		response.sendRedirect("../login.jsp");
		return;
	}
	%>
	<div
		class="flex w-full bg-slate-400 justify-center gap-x-8 py-4 shadow-md">
		<a href="./Destinasi.jsp"
			class="text-white font-medium hover:text-gray-200 transition duration-200">Destinasi</a>
		<a href="./Package.jsp"
			class="text-white font-medium hover:text-gray-200 transition duration-200">Paket</a>
		<a href="./daftarTransaksi.jsp"
			class="text-white font-medium hover:text-gray-200 transition duration-200">Transaksi</a>
		<a href="../exe/exeLogout.jsp"
			class="text-white font-medium hover:text-gray-200 transition duration-200">Logout</a>
	</div>
	<section
		class="w-full flex flex-col justify-center items-center my-6 px-4">
		<%@ page import="com.buzzjet.*"%>


		<!-- Tombol Tambah Barang -->
		<div class="w-full flex justify-end mb-4">
			<a href="./DestinasiTambah.jsp"
				class="bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-4 rounded-md transition duration-200">
				Tambah Destinasi </a>
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

						<th class="border border-gray-300 px-4 py-2">Aksi</th>

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
						<td class="border border-gray-300 px-4 py-2 text-center"><%=++no%></td>
						<td class="border border-gray-300 px-4 py-2"><%=destinasiModel.getAllDestinasi().get(i).getName()%></td>
						<td class="border border-gray-300 px-4 py-2"><%=destinasiModel.getAllDestinasi().get(i).getDescription()%></td>
						<%
						if (role != null) {
						%>
						<td class="border border-gray-300 px-4 py-2 text-center"><a
							href="./DestinasiEdit.jsp?id=<%=destinasiModel.getAllDestinasi().get(i).getId()%>"
							class="text-blue-500 hover:underline mr-2"> Edit </a> <a
							href="../exe/exeDestinasiDelete.jsp?id=<%=destinasiModel.getAllDestinasi().get(i).getId()%>"
							class="text-red-500 hover:underline"> Hapus </a></td>
						<%
						}
						%>
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