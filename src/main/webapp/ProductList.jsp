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
<title>product selection</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
    
    
	<%
		ArrayList<DanhMuc> danhMucList = new DanhMucDAO().getDanhMucList();
	
		String danhMucId = request.getParameter("danhMucId");
		ArrayList<Hang> hangList = new HangDAO().getHangList(danhMucId);
		
		String hangId = request.getParameter("hangId");
		ArrayList<SanPham> sanPhamList = new SanPhamDAO().getSanPhamList(hangId);
    %>
	<h1>Processor</h1>
	<form id="infoForm" NAME="information" method="get" action="ProductList.jsp">
		<input name="name" type="radio" value="Celeron+D" />Celeron D<br>
		<input name="name" type="radio" value="Pentium+VI" />Pentium IV <br>
		<input name="name" type="radio" value="Pentium+D" />Pentium D <br>
	<h1>Accessories</h1>
       	<input type="checkbox" id="monitor" checked> Monitor <br>
       	<select name="danhMucId" multiple id="danhMucId">
       		<%
                for (DanhMuc dm : danhMucList) {
                	String isSelected = danhMucId != null && dm.getIdDanhMuc() == Integer.parseInt(danhMucId) ? "selected" : "";
            %>
            	<option value="<%=dm.getIdDanhMuc()%>" <%=isSelected%>><%=dm.getTenDM()%></option>
            <% 
                }
		   	
            %>
       	</select>
       	<%
       		if (danhMucId != null) {
       	
       	%>
	       	<select name="hangId" multiple id="hangId">
	       		<%
	                for (Hang h : hangList) {
	                	String isSelected = hangId != null && h.getIdHang() == Integer.parseInt(hangId) ? "selected" : "";
	            %>
	            	<option value="<%=h.getIdHang()%>" <%=isSelected%>><%=h.getTenHang()%></option>
	            <% 
	                }
			   	
	            %>
	       	</select>
       	 <% 
            }
		   	
         %>
      	<br>

	<%
       	if (danhMucId != null && hangId != null) {
       	
    %>
	    <div class="container">
	    	<div class="row">
	    		<%
	                for (SanPham sp : sanPhamList) {
	            %>
	            	<div class="col col-md-3">
						<div class="card">
						  <div class="card-body">
						    <h5 class="card-title"><%=sp.getTenSP()%></h5>
						    <p class="card-text"><%=sp.getGia()%></p>
    						<button
    						   type="button"
    						   class="btn btn-primary purchase"
    						   data-danh-muc-id="<%=danhMucId%>"
    						   data-hang-id="<%=hangId%>"
    						   data-san-pham-id="<%=sp.getIdSanPham()%>"
    						>
    						   PURCHASE
    						</button>
						  </div>
						</div>	            	
	            	</div>
	            <% 
	                }
			   	
	            %>
	    	</div>
	    </div>
    <% 
        }
		   	
    %>
    </form>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	<script>
	
		var formElement = document.getElementById("infoForm");
		var monitorElement = document.getElementById("monitor");
		monitorElement.onchange = function(e) {
			if (e.target.checked) {
				document.getElementById("danhMucId").style.display = 'block';
				document.getElementById("hangId").style.display = 'block';
			} else {
				document.getElementById("danhMucId").style.display = 'none';
				document.getElementById("hangId").style.display = 'none';
			}
		}
		var danhMucElement  = document.getElementById("danhMucId");
		danhMucElement.onchange = function() {
			formElement.submit()
		}
		var hangElement  = document.getElementById("hangId");
		hangElement.onchange = function() {
			formElement.submit()
		}
		document.querySelectorAll(".purchase").forEach(function (item) {
			item.onclick = function(e) {
				e.preventDefault()
				var name = document.querySelector('input[name="name"]:checked')?.value || null;
				window.location.href = "ProductDetail.jsp?name=" + name + "&danhMucId=" + e.target.dataset.danhMucId + "&hangId=" + e.target.dataset.hangId + "&sanPhamId=" + e.target.dataset.sanPhamId
			}
		})
	</script>
</body>
</html>