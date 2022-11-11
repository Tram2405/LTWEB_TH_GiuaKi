<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="baotram.dao.DanhMucDAO"%>
<%@page import="baotram.model.DanhMuc"%>
<%@page import="baotram.dao.HangDAO"%>
<%@page import="baotram.model.Hang"%>
<%@page import="baotram.dao.SanPhamDAO"%>
<%@page import="baotram.model.SanPham"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<style >

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<%
		String name = request.getParameter("name");
	
		String danhMucId = request.getParameter("danhMucId");
		DanhMuc dm = new DanhMucDAO().getDanhMucDetail(danhMucId);
		
		String hangId = request.getParameter("hangId");
		Hang h = new HangDAO().getHangDetail(hangId);
		
		String sanPhamId = request.getParameter("sanPhamId");
		SanPham sp = new SanPhamDAO().getSanPhamDetail(sanPhamId);
    %>
	<div class="container">
	    <caption class="my-caption">My Cart</caption>
		<table class="table table-bordered">
		  <tbody>
		    <tr>
		      <th>Processor</th>
		      <th>Accessories</th>
		      
		    </tr>
		    <tr>
		      <td><%=name%></td>
		      <td><%=dm.getTenDM()%> - <%=h.getTenHang()%> - <%=sp.getTenSP()%></td>
		    </tr>
		  </tbody>
		  
		</table>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>