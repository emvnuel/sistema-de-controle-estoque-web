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
    
    <style type="text/css">
        body {
	       background-color: #fcfcfc;
        }
    </style>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");
    Long id = Long.parseLong(request.getParameter("id"));
    MercadoriaDAO mercadoriaDAO = new MercadoriaDAO();
    
    Mercadoria mercadoriaEdicao = mercadoriaDAO.get(id);
    %>
    <section class="mt-4">
        <div class="container">
            <h1 class="h2 text-center my-3">Edição de mercadoria</h1>
            <div class="row">
                <div class="col-md-6 mx-auto">
		            <form method="post" action="editarmercadoria.jsp">
		              <input type="hidden" name="id" value="<%=id%>">
		                <div class="form-group ">
		                   <label>Código</label>                       
		                   <input value="<%=mercadoriaEdicao.getCodigo() %>" class="form-control" type="text" maxlength="6" readonly="readonly">
		               </div>
		               <div class="form-group">
		                   <label>Descrição</label>
		                   <textarea rows="2" class="form-control" name="descricao" required="required"><%=mercadoriaEdicao.getDescricao() %></textarea>
		               </div>
		               <div class="form-group">
		                   <label>Preço unitário</label>
		                   <div class="input-group">
		                       <div class="input-group-prepend">
		                           <span class="input-group-text">R$</span>
		                       </div>
		                       <input value="<%=mercadoriaEdicao.getPrecoUnitario() %>" type="number" class="form-control" step="0.01" min="0.01" name="preco" required="required">
		                   </div>
		               </div>
		               <button class="btn btn-info" type="submit">editar mercadoria</button>
		            </form>
                                
                </div>
            </div>
        </div>
    </section>
</body>
</html>