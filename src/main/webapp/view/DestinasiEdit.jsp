<%@ page import="com.buzzjet.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    DestinasiModel destinasiModel = new DestinasiModel();
    Destinasi destinasi = null;
    
    for (Destinasi item : destinasiModel.getAllDestinasi()) {
        if (item.getId() == id) {
            destinasi = item;
            break;
        }
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Destinasi</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
        <h2 class="text-2xl font-bold mb-6 text-center">Edit Destinasi</h2>
        
        <% if (destinasi != null) { %>
            <form action="../exe/exeDestinasiEdit.jsp" method="POST" class="flex flex-col gap-4">
                <!-- Hidden ID Field -->
                <input type="hidden" name="id" value="<%= destinasi.getId() %>" />
                
                <!-- Input Nama Destinasi -->
                <div class="flex flex-col">
                    <label for="nama" class="text-gray-700 mb-1">Nama Destinasi</label>
                    <input 
                        type="text" 
                        id="nama" 
                        name="nama" 
                        value="<%= destinasi.getName() %>" 
                        placeholder="Masukkan nama destinasi"
                        class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                        required
                    >
                </div>
                
                <!-- Input Deskripsi -->
                <div class="flex flex-col">
                    <label for="deskripsi" class="text-gray-700 mb-1">Deskripsi</label>
                    <textarea 
                        id="deskripsi" 
                        name="deskripsi" 
                        rows="4"
                        placeholder="Masukkan deskripsi destinasi"
                        class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                        required
                    ><%= destinasi.getDescription() %></textarea>
                </div>

                <!-- Submit Button -->
                <button 
                    type="submit" 
                    name="submit"
                    class="bg-blue-500 text-white rounded-md px-4 py-2 hover:bg-blue-600 transition duration-200"
                >
                    Simpan
                </button>
            </form>
        <% } else { %>
            <p class="text-center text-red-500 font-semibold">Destinasi Tidak Ada</p>
            <div class="text-center mt-4">
                <a href="../view/Destinasi.jsp" 
                   class="text-blue-500 hover:underline"
                >
                    Kembali ke daftar destinasi
                </a>
            </div>
        <% } %>
    </div>

</body>
</html>
