<%@page import="java.math.BigDecimal"%>
<%@page import="br.edu.ifba.model.Mercadoria"%>
<%@page import="br.edu.ifba.dao.MercadoriaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sistema de Controle de Estoque</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String codigo = request.getParameter("codigo");
String descricao = request.getParameter("descricao");
BigDecimal precoUnitario = new BigDecimal(request.getParameter("preco"));

Mercadoria mercadoria = new Mercadoria();
mercadoria.setCodigo(codigo);
mercadoria.setDescricao(descricao);
mercadoria.setPrecoUnitario(precoUnitario);

MercadoriaDAO mercadoriaDAO = new MercadoriaDAO();
mercadoriaDAO.adicionar(mercadoria);
%>
<div class="container mt-2">
    <div class="row">
        <div class="col-lg-10 mx-auto">
	       <div class="alert alert-success text-center" role="alert">
		      Mercadoria cadastrada com sucesso! <a href="mercadoria.jsp">Voltar a página de mercadorias.</a>
		  </div>
        </div>
    </div>
</div>

</body>
</html>