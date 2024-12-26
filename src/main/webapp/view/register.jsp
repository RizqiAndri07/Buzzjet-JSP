<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrasi Pengguna</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
        <h2 class="text-2xl font-bold mb-6 text-center">Registrasi Pengguna</h2>
        <form action="../exe/exeRegister.jsp" method="POST" class="flex flex-col gap-4">
            <!-- Input Username -->
            <div class="flex flex-col">
                <label for="username" class="text-gray-700 mb-1">Username</label>
                <input 
                    type="text" 
                    id="username" 
                    name="username" 
                    placeholder="Masukkan username"
                    class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    required
                >
            </div>
            
            <!-- Input Password -->
            <div class="flex flex-col">
                <label for="password" class="text-gray-700 mb-1">Password</label>
                <input 
                    type="password" 
                    id="password" 
                    name="password" 
                    placeholder="Masukkan password"
                    class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    required
                >
            </div>

            <!-- Submit Button -->
            <button 
                type="submit" 
                class="bg-blue-500 text-white rounded-md px-4 py-2 hover:bg-blue-600 transition duration-200 mt-4"
            >
                Daftar
            </button>
        </form>
    </div>
</body>
</html>