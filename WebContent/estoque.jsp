<%@page import="java.util.List"%>
<%@page import="br.edu.ifba.dao.EstoqueDAO"%>
<%@page import="br.edu.ifba.model.Mercadoria"%>
<%@page import="br.edu.ifba.model.Estoque"%>
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

    <div class="modal fade" id="adicionarEstoque" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Adição de mercadoria ao estoque</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                   <form method="post" action="adicionarestoque.jsp">
                       <div class="form-group">
                            <label>Mercadoria</label>
                            <select class="form-control" name="mercadoria">
                                <option value="-1">Selecione</option>
                                <%
                                MercadoriaDAO mercadoriaDAO = new MercadoriaDAO();
                                
                                for(Mercadoria mercadoria: mercadoriaDAO.getNaoEstaoNoEstoque()) {                                
                                %>
                                <option value="<%=mercadoria.getId()%>"><%=mercadoria.getCodigo() %> - <%=mercadoria.getDescricao() %></option>
                                <%} %>
                            </select>
                       </div>
                       <div class="form-group">
                            <label>Quantidade</label>
                            <input min="1" step="1" class="form-control" type="number" name="quantidade" required="required">
                       </div>   
                       <button class="btn btn-primary" type="submit">adicionar mercadoria ao estoque</button>
                   </form>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="entradaEstoque" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Entrada de estoque</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                   <form method="post" action="entradaestoque.jsp">
                       <input type="hidden" id="codigoentrada" name="codigoentrada">
                       <div class="form-group">
                           <label>Quantidade de entradas de <span class="estoque-selecionado"></span></label>
                           <input class="form-control" type="number" name="quantidadeentreada" min="1" value="1" required="required">
                       </div>
                       <button class="btn btn-primary" type="submit">atualizar estoque</button>
                   </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="saidaEstoque" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Saída de estoque</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                   <form method="post" action="saidaestoque.jsp">
                    <input type="hidden" id="codigosaida" name="codigosaida">
                       <div class="form-group">
                           <label>Quantidade de saídas de <span class="estoque-selecionado"></span></label>
                           <input class="form-control" type="number" name="quantidadesaida" min="0" value="1" required="required">
                       </div>
                       <button class="btn btn-primary" type="submit">atualizar estoque</button>                   
                   </form>
                </div>
            </div>
        </div>
    </div>
        
    <header>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <span class="navbar-brand mb-0 h1">
                    <img alt="Sistema de Estoque" width="30" height="30" src="img/logo.svg">
                    Sistema de Estoque
                </span>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link mx-md-2" href="mercadoria.jsp">Mercadorias</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link mx-md-2" href="estoque.jsp">Estoque</a>
                        </li>                        
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    
    <section class="mt-4">
        <div class="container">
            <h1 class="h2 mb-3">Estoque</h1>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Cód.</th>
                            <th>Desc.</th>
                            <th>Preço <span class="d-none d-md-inline">unitário</span></th>
                            <th><span class="d-none d-md-inline">Preço</span> total</th>
                            <th>Quantidade</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        EstoqueDAO estoqueDAO = new EstoqueDAO();
                        for(Estoque estoque: estoqueDAO.get()) {
                        %>
                        <tr>
                            <td><%=estoque.getMercadoria().getCodigo() %></td>
                            <td><%=estoque.getMercadoria().getDescricao() %></td>
                            <td>R$<%=estoque.getMercadoria().getPrecoUnitario().toString().replace(".", ",") %></td>
                            <td>R$<%=estoque.getPrecoTotal().toString().replace(".", ",") %></td>
                            <td><%=estoque.getQuantidade() %></td>
                            <td>
                                <button data-toggle="modal" data-target="#entradaEstoque" class="btn btn-sm btn-info mb-1">entrada de estoque</button>
                                <button data-toggle="modal" data-target="#saidaEstoque" class="btn btn-sm btn-danger mb-1">saída de estoque</button>                                                          
                            </td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
            <button data-toggle="modal" data-target="#adicionarEstoque" class="btn btn-primary mb-3">adicionar mercadoria ao estoque</button>
        </div>
    </section>
    
    <script src="js/jquery-3.2.1.slim.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
    $('#entradaEstoque').on('show.bs.modal', function (event) {
    	$('input[name="quantidadeentreada"]')[0].value = 1;
    	var button = $(event.relatedTarget)[0];
        var codigo = button.parentElement.parentElement.children[0].innerHTML;
        var descricao = button.parentElement.parentElement.children[1].innerHTML;
        $('.estoque-selecionado')[0].innerHTML = descricao;  
        $('#codigoentrada')[0].value = codigo;
    });
    
    $('#saidaEstoque').on('show.bs.modal', function (event) {
        $('input[name="quantidadesaida"]')[0].value = 1;
        var button = $(event.relatedTarget)[0];
        var codigo = button.parentElement.parentElement.children[0].innerHTML;
        var descricao = button.parentElement.parentElement.children[1].innerHTML;
        $('.estoque-selecionado')[1].innerHTML = descricao;  
        $('#codigosaida')[0].value = codigo;    	
    });
    </script>
</body>
</html>