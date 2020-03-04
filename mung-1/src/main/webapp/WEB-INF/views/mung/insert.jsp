<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Form</title>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

	<h2>파일업로드</h2>

	<div class="container">
		<form action="/mung/fileinsert" method="post"
			enctype="multipart/form-data">
			<input type="file" name="files">
			<!-- 추가 -->

			<button type="submit" class="btn btn-primary" style="margin:5px;">업로드</button>
		</form>
	</div>
</body>
</html>