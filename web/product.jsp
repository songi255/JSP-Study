<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-11
  Time: 오후 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <title>상품 상세 정보</title>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">상품 정보</h1>
        </div>
    </div>
    <%
        String id = request.getParameter("id");
        ProductRepository dao = ProductRepository.getInstance();
        Product product = dao.getProductById(id);
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h3><%=product.getPname()%></h3>
                <p><%=product.getDescription()%></p>
                <p> <b>상품 코드 : <span class="badge badge-danger">
                    <%=product.getProductID()%></span></b> </p>
                <p> <b>제조사</b> : <%=product.getManufacturer()%></p>
                <p> <b>분류</b> : <%=product.getCategory()%></p>
                <p> <b>재고 수</b> : <%=product.getUnitsInStock()%></p>
                <h4><%=product.getUnitPrice()%>원</h4>
                <p><a href="./products.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a></p>
            </div>
        </div>
        <hr>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
