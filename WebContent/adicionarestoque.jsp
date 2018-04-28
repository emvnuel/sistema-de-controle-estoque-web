<%@page import="br.edu.ifba.dao.MercadoriaDAO"%>
<%@page import="br.edu.ifba.model.Mercadoria"%>
<%@page import="br.edu.ifba.model.Estoque"%>
<%@page import="br.edu.ifba.dao.EstoqueDAO"%>
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
Long idMercadoria = Long.parseLong(request.getParameter("mercadoria"));
Integer quantidade = Integer.parseInt(request.getParameter("quantidade"));

MercadoriaDAO mercadoriaDAO = new MercadoriaDAO();
EstoqueDAO estoqueDAO = new EstoqueDAO();

Mercadoria mercadoria = mercadoriaDAO.get(idMercadoria);
Estoque estoque = new Estoque();
estoque.setMercadoria(mercadoria);
estoque.setQuantidade(quantidade);

estoqueDAO.adicionar(estoque);


%>
<div class="container mt-2">
    <div class="row">
        <div class="col-lg-10 mx-auto">
           <div class="alert alert-success text-center" role="alert">
              Mercadoria adicionada ao estoque com sucesso! <a href="estoque.jsp">Voltar a página de estoque.</a>
          </div>
        </div>
    </div>
</div>

</body>
</html>