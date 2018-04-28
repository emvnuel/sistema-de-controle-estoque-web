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
Long id = Long.parseLong(request.getParameter("id"));
String descricao = request.getParameter("descricao");
BigDecimal precoUnitario = new BigDecimal(request.getParameter("preco"));

MercadoriaDAO mercadoriaDAO = new MercadoriaDAO();
Mercadoria mercadoriaEdicao = mercadoriaDAO.get(id);

mercadoriaEdicao.setDescricao(descricao);
mercadoriaEdicao.setPrecoUnitario(precoUnitario);

mercadoriaDAO.atualizar(mercadoriaEdicao);
%>

<div class="container mt-2">
    <div class="row">
        <div class="col-lg-10 mx-auto">
           <div class="alert alert-success text-center" role="alert">
              Mercadoria editada com sucesso! <a href="mercadoria.jsp">Voltar a página de mercadorias.</a>
          </div>
        </div>
    </div>
</div>
</body>
</html>