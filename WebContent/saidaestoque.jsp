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
String codigo = request.getParameter("codigosaida");
Estoque estoqueSelecionado = null;
Integer quantidade = Integer.parseInt(request.getParameter("quantidadesaida"));

EstoqueDAO estoqueDAO = new EstoqueDAO();

for(Estoque estoque: estoqueDAO.get()) {
    if(estoque.getMercadoria().getCodigo().equals(codigo)) {
        estoqueSelecionado = estoque;
    }
}

estoqueDAO.remocaoQuantidade(estoqueSelecionado, quantidade);
%>

<div class="container mt-2">
    <div class="row">
        <div class="col-lg-10 mx-auto">
           <div class="alert alert-success text-center" role="alert">
               Estoque atualizado com sucesso! <a href="estoque.jsp">Voltar a página de estoque.</a>
          </div>
        </div>
    </div>
</div>

</body>
</html>