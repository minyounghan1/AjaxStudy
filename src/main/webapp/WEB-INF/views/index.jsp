<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<div class="container" style="margin-top:10px;">
		<div class="form-group row pull-right">
			<input id="searchInput" class="form-control" type="text" size="20" placeholder="이름" style="display:inline-block;">
		</div>
		<div class="col-xs-2">
			<button id="searchButton" class="btn btn-primary" type="button" style="display:block; margin:0 auto; margin-top:10px; margin-bottom:10px;">검색</button>
		</div>
	</div>
	<table id="userTable" class="table" style="text-align:center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="text-align:center;">이름</th>
				<th style="text-align:center;">나이</th>
				<th style="text-align:center;">성별</th>
				<th style="text-align:center;">이메일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${user}">
				<tr>
					<td>${user.userName}</td>
					<td>${user.userAge}</td>
					<td>${user.userGender}</td>
					<td>${user.userEmail}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script>
	$(document).ready(function() {
	    $("#searchButton").click(function() {
	        var keyword = $("#searchInput").val();
	        $.ajax({
	            type: "GET",
	            url: "/users/details",
	            data: { keyword: keyword },
	            dataType: "json",
	            success: function(response) {
	                var tableBody = ""; // 새로운 테이블 body 생성
	                $.each(response, function(index, user) {
	                    var row = "<tr>" +
	                              "<td>" + user.userName + "</td>" +
	                              "<td>" + user.userAge + "</td>" +
	                              "<td>" + user.userGender + "</td>" +
	                              "<td>" + user.userEmail + "</td>" +
	                              "</tr>";
	                    tableBody += row; // 새로운 행 추가
	                });
	                $("#userTable tbody").html(tableBody); // 테이블 body 업데이트
	            },
	            error: function(xhr, status, error) {
	                console.error("Ajax Error:", status, error);
	            }
	        });
	    });
	});
    
    /* $(document).ready(function() {
        $("#searchButton").click(function() {
            var keyword = $("#searchInput").val();
            $.ajax({
                type: "GET",
                url: "/users/details",
                data: { keyword: keyword },
                dataType: "json", // 서버에서 JSON 형식으로 반환
                success: function(response) {
                    // 기존 테이블의 데이터 삭제
                    $("#userTable tbody").empty();
                    
                    // 검색 결과를 반복하여 테이블에 추가
                    $.each(response, function(index, user) {
                        var row = "<tr>" +
                                  "<td>" + user.userName + "</td>" +
                                  "<td>" + user.userAge + "</td>" +
                                  "<td>" + user.userGender + "</td>" +
                                  "<td>" + user.userEmail + "</td>" +
                                  "</tr>";
                        $("#userTable tbody").append(row); // 테이블에 검색 결과 추가
                    });
                },
                error: function(xhr, status, error) {
                    console.error("Ajax Error:", status, error);
                }
            });
        });
    }); */

</script>
</body>
</html>