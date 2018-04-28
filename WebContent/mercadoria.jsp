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

	<div class="modal fade" id="cadastroMercadoria" tabindex="-1">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">Cadastro de Mercadoria</h5>
	                <button type="button" class="close" data-dismiss="modal">
	                    <span>&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	               <form method="post" action="cadastrarmercadoria.jsp">
	                   <div class="form-group">
                           <label>Código</label> 	                   
	                       <input class="form-control" type="text" name="codigo" maxlength="6" required="required">
	                   </div>
	                   <div class="form-group">
	                       <label>Descrição</label>
	                       <textarea rows="2" class="form-control" name="descricao" required="required"></textarea>
	                   </div>
	                   <div class="form-group">
	                       <label>Preço unitário</label>
	                       <div class="input-group">
	                           <div class="input-group-prepend">
	                               <span class="input-group-text">R$</span>
	                           </div>
	                           <input type="number" class="form-control" step="0.01" min="0.01" name="preco" required="required">
	                       </div>
	                   </div>
	                   <button class="btn btn-primary" type="submit">cadastrar mercadoria</button>
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
                        <li class="nav-item active">
                            <a class="nav-link mx-md-2" href="mercadoria.jsp">Mercadorias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-md-2" href="estoque.jsp">Estoque</a>
                        </li>                        
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    
    <section class="mt-4">
        <div class="container">
            <h1 class="h2 mb-3">Mercadorias</h1>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Descrição</th>
                            <th>Preço <span class="d-none d-md-inline">unitário</span></th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        MercadoriaDAO mercadoriaDAO = new MercadoriaDAO();
                        for(Mercadoria mercadoria: mercadoriaDAO.get()) {
                        %>
                        <tr>
                            <td><%=mercadoria.getCodigo() %></td>
                            <td><%=mercadoria.getDescricao() %></td>
                            <td>R$<%=mercadoria.getPrecoUnitario().toString().replace(".", ",") %></td>
                            <td>
                                <a onclick="return confirm('Deseja realmente excluir <%=mercadoria.getDescricao() %>?');" href="excluirmercadoria.jsp?id=<%=mercadoria.getId() %>" class="btn btn-sm btn-danger mb-1">excluir</a>
                                <a href="edicaomercadoria.jsp?id=<%=mercadoria.getId() %>" class="btn btn-sm btn-info mb-1">editar</a>                                
                            </td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
            <button data-toggle="modal" data-target="#cadastroMercadoria" class="btn btn-primary mb-3">cadastrar mercadoria</button>
        </div>
    </section>
    
    <script src="js/jquery-3.2.1.slim.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>