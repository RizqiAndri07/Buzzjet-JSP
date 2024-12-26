<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
	<div
		class="login-container bg-white p-8 rounded-lg shadow-md w-full max-w-sm">
		<h2 class="text-2xl font-bold mb-6 text-center">Login</h2>
		<form action="../exe/exeLogin.jsp" method="post" class="space-y-4">
			<div>
				<label for="username"
					class="block text-sm font-medium text-gray-700">Username:</label> <input
					type="text" id="username" name="username" required
					class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
			</div>
			<div>
				<label for="password"
					class="block text-sm font-medium text-gray-700">Password:</label> <input
					type="password" id="password" name="password" required
					class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
			</div>
			<div>
				<button type="submit"
					class="w-full bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-4 rounded-md transition duration-200">Login</button>
			</div>
		</form>
	</div>
</body>
</html>