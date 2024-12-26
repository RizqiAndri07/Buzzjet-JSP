<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.buzzjet.PackageModel, com.buzzjet.Package, com.buzzjet.DestinasiModel, com.buzzjet.Destinasi" %>
<%
    int id = Integer.parseInt(request.getParameter("id")); 
    PackageModel packageModel = new PackageModel();
    Package pkg = null;

    for (Package item : packageModel.getAllPackages()) {
        if (item.getId() == id) {
            pkg = item;
            break;
        }
    }
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Paket</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
        <a 
        href="./Package.jsp" 
        class="absolute top-4 left-4 flex items-center text-gray-700 hover:text-gray-900 transition duration-200"
    >
        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
        </svg>
        Back
    </a>
        
        <h2 class="text-2xl font-bold mb-6 text-center">Edit Paket</h2>
        
        <% if (pkg != null) { %>
            <form action="../exe/exePackageEdit.jsp" method="POST" class="flex flex-col gap-4">
                <!-- Hidden ID Field -->
                <input type="hidden" name="id" value="<%= pkg.getId() %>" />
                
                <!-- Input Nama Paket -->
                <div class="flex flex-col">
                    <label for="name" class="text-gray-700 mb-1">Nama Paket</label>
                    <input 
                        type="text" 
                        id="name" 
                        name="name" 
                        value="<%= pkg.getName() %>" 
                        placeholder="Masukkan nama paket"
                        class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                        required
                    >
                </div>
                
                <!-- Input Deskripsi -->
                <div class="flex flex-col">
                    <label for="description" class="text-gray-700 mb-1">Deskripsi</label>
                    <textarea 
                        id="description" 
                        name="description" 
                        rows="4"
                        placeholder="Masukkan deskripsi paket"
                        class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                        required
                    ><%= pkg.getDescription() %></textarea>
                </div>

                <!-- Input Harga -->
                <div class="flex flex-col">
                    <label for="price" class="text-gray-700 mb-1">Harga</label>
                    <input 
                        type="number" 
                        id="price" 
                        name="price" 
                        value="<%= pkg.getPrice() %>" 
                        placeholder="Masukkan harga paket"
                        class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                        required
                    >
                </div>

                <!-- Dropdown Destinasi -->
                <div class="flex flex-col">
                    <label for="destination" class="text-gray-700 mb-1">Destinasi</label>
                    <select 
                        id="destination" 
                        name="destination_id" 
                        class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                        required
                    >
                        <option value="" disabled>Pilih destinasi</option>
                        <%
                            DestinasiModel destinasiModel = new DestinasiModel();
                            for (Destinasi destinasi : destinasiModel.getAllDestinasi()) {
                        %>
                        <option value="<%= destinasi.getId() %>" <%= destinasi.getId() == pkg.getDestinationId() ? "selected" : "" %>><%= destinasi.getName() %></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <!-- Submit Button -->
                <button 
                    type="submit" 
                    class="bg-blue-500 text-white rounded-md px-4 py-2 hover:bg-blue-600 transition duration-200"
                >
                    Simpan
                </button>
            </form>
        <% } else { %>
            <p class="text-center text-red-500 font-semibold">Paket Tidak Ada</p>
            <div class="text-center mt-4">
                <a href="../view/Package.jsp" 
                   class="text-blue-500 hover:underline"
                >
                    Kembali ke daftar paket
                </a>
            </div>
        <% } %>
    </div>

</body>
</html>