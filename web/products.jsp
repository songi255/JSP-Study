<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-11
  Time: 오후 5:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
<html>
<head>
    <link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <title>상품 목록</title>
</head>
<body>
    <jsp:include page="menu.jsp" />
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">상품 목록</h1>
        </div>
    </div>
    <%
        ProductRepository dao = ProductRepository.getInstance();
        ArrayList<Product> listOfProducts = dao.getAllProducts();
    %>
    <div class="container">
        <div class="row" align="center">
            <%
                for (int i = 0; i < listOfProducts.size(); i++) {
                    Product product = listOfProducts.get(i);
            %>
            <div class="col-md-4">
                <h3><%=product.getPname()%></h3>
                <p><%=product.getDescription()%></p>
                <p><%=product.getUnitPrice()%>원</p>
                <p><a href="./product.jsp?id=<%=product.getProductID()%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a></p>
            </div>
            <%
                }
            %>
        </div>
        <hr>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
