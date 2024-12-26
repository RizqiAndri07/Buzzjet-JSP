	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="com.buzzjet.PackageModel, com.buzzjet.Package, com.buzzjet.DestinasiModel, com.buzzjet.Destinasi" %>
	<%
	    int id = Integer.parseInt(request.getParameter("id"));
	    PackageModel packageModel = new PackageModel();
	    final Package pkg = packageModel.getAllPackages().stream()
	        .filter(item -> item.getId() == id)
	        .findFirst()
	        .orElse(null);
	
	    DestinasiModel destinasiModel = new DestinasiModel();
	    final Destinasi destinasi = (pkg != null) ? destinasiModel.getAllDestinasi().stream()
	        .filter(d -> d.getId() == pkg.getDestinationId())
	        .findFirst()
	        .orElse(null) : null;
	%>
	<!DOCTYPE html>
	<html lang="id">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Beli Paket</title>
	    <script src="https://cdn.tailwindcss.com"></script>
	    <script>
	        function updateQuantity(increment) {
	            var quantityInput = document.getElementById("quantity");
	            var quantity = parseInt(quantityInput.value);
	            if (isNaN(quantity)) {
	                quantity = 1;
	            }
	            quantity += increment;
	            if (quantity < 1) {
	                quantity = 1;
	            }
	            quantityInput.value = quantity;
	            updateTotal();
	        }
	
	        function updateTotal() {
	            var quantity = parseInt(document.getElementById("quantity").value);
	            var price = parseFloat(document.getElementById("price").value);
	            var total = quantity * price;
	            document.getElementById("totalAmount").innerText = "Total: Rp " + total.toFixed(2);
	        }
	    </script>
	</head>
	<body class="bg-gray-100 flex items-center justify-center min-h-screen">
	
	    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
	        <h2 class="text-2xl font-bold mb-6 text-center">Beli Paket</h2>
	        
	        <% if (pkg != null) { %>
	            <form action="../../exe/exeBuyPackage.jsp" method="POST" class="flex flex-col gap-4">
	                <!-- Hidden ID Field -->
	                <input type="hidden" name="package_id" value="<%= pkg.getId() %>" />
	                <input type="hidden" id="price" name="price" value="<%= pkg.getPrice() %>" />
	                
	                <!-- Detail Paket -->
	                <div class="flex flex-col">
	                    <h3 class="text-xl font-bold mb-2"><%= pkg.getName() %></h3>
	                    <p class="text-gray-700 mb-4"><%= pkg.getDescription() %></p>
	                    <p class="text-gray-900 font-semibold mb-4">Harga: Rp <%= pkg.getPrice() %></p>
	                    <p class="text-gray-700 mb-4">Destinasi: <%= destinasi != null ? destinasi.getName() : "N/A" %></p>
	                </div>
	
	                <!-- Input Quantity -->
	                <div class="flex items-center gap-4">
	                    <button type="button" onclick="updateQuantity(-1)" class="bg-gray-300 text-gray-700 rounded-md px-4 py-2">-</button>
	                    <input 
	                        type="number" 
	                        id="quantity" 
	                        name="quantity" 
	                        value="1" 
	                        min="1"
	                        class="border border-gray-300 rounded-md px-3 py-2 text-center w-16"
	                        oninput="updateTotal()"
	                        required
	                    >
	                    <button type="button" onclick="updateQuantity(1)" class="bg-gray-300 text-gray-700 rounded-md px-4 py-2">+</button>
	                </div>
	
	                <!-- Total Amount -->
	                <div class="text-gray-900 font-semibold mt-4" id="totalAmount">Total: Rp <%= pkg.getPrice() %></div>
	
	                <!-- Submit Button -->
	                <button 
	                    type="submit" 
	                    class="bg-blue-500 text-white rounded-md px-4 py-2 hover:bg-blue-600 transition duration-200 mt-4"
	                >
	                    Beli
	                </button>
	            </form>
	        <% } else { %>
	            <p class="text-center text-red-500 font-semibold">Paket Tidak Ada</p>
	            <div class="text-center mt-4">
	                <a href="../view/Home.jsp" 
	                   class="text-blue-500 hover:underline"
	                >
	                    Kembali ke daftar paket
	                </a>
	            </div>
	        <% } %>
	    </div>
	
	</body>
	</html>