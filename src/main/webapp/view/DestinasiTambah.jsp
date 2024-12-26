<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Form Destinasi</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

	<div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
		<a href="./Destinasi.jsp"
			class="absolute top-4 left-4 flex items-center text-gray-700 hover:text-gray-900 transition duration-200">
			<svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor"
				viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round"
					stroke-width="2" d="M15 19l-7-7 7-7"></path>
        </svg> Back
		</a>

		<h2 class="text-2xl font-bold mb-6 text-center">Form Destinasi</h2>

		<form action="../exe/exeDestinasiTambah.jsp" method="POST"
			class="flex flex-col gap-4">
			<!-- Input Name -->
			<div class="flex flex-col">
				<label for="name" class="text-gray-700 mb-1">Nama Destinasi</label>
				<input type="text" id="name" name="nama"
					placeholder="Masukkan nama destinasi"
					class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
					required>
			</div>

			<!-- Input Description -->
			<div class="flex flex-col">
				<label for="description" class="text-gray-700 mb-1">Deskripsi</label>
				<textarea id="description" name="deskripsi" rows="2"
					placeholder="Masukkan deskripsi destinasi"
					class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
					required></textarea>
			</div>

			<!-- Submit Button -->
			<button type="submit"
				class="bg-blue-500 text-white rounded-md px-4 py-2 hover:bg-blue-600 transition duration-200">
				Simpan</button>
		</form>
	</div>

</body>
</html>
