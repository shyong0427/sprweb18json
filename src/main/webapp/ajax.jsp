<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax + Json</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnOk").click(function() {
			$("#showData").html("");
			
			$.ajax({
				type : "get",
				url : "list",
				data : {"name" : "tom"},
				dataType : "json",
				success : function(data) {
					var str = "";
					str += data.name + "<br>";
					str += data.skills[0] + " ";
					str += data.skills[1];

					$("#showData").html(str);S
				},
				error : function(data) {
					$("#showData").text("에러 발생!");
				}
			});
		});
		
		$("#btnOk2").click(function() {
			$("#showData").html("");
			
			$.ajax({
				type : "get",
				url : "list2",
				dataType : "json",
				success : function(data) {
					var str = "<table>";
					var list = data.datas;
					$(list).each(function(index, obj) {
						str += "<tr>";
						str += "<td>" + obj["name"] + "</td>";
						str += "<td>" + obj.age + "</td>";
						str += "</tr>";
					});
					str += "</table>";
					$("#showData").html(str);
				},
				error : function(data) {
					$("#showData").text("에러 발생!");
				}
			});
		});
	});
</script>
</head>
<body>
	json 읽기(ajax)<br>
	<input type="button" value="1개 자료 읽기" id="btnOk"><br>
	<input type="button" value="여러 자료 읽기" id="btnOk2"><br>
	<hr>
	<div id="showData"></div>
</body>
</html>