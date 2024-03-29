<%-- 
    Document   : index
    Created on : 7 de abr. de 2023, 19:14:44
    Author     : Alex
--%>

<%@page contentType="text/html; utf-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset ="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, 
              shrink-to-fit=no">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/nav.css" type="text/css">
        <link rel="stylesheet" href="webfonts/css/all.css" type="text/css">
        <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" type="text/css">
        <title>Listar Serviços</title>
    </head>
    <body>
        
        <div id="container">
            <div id="header">
                <jsp:include page="template/banner.jsp"></jsp:include>
            </div>
            <div id="menu">
                <jsp:include page="template/menu.jsp"></jsp:include>
            </div>
            <div id="conteudo">
                <div class="col-12">
                    <h3 class="text-center mt-5 text-primary text" style="padding-top: 90px">Listagem de Serviços</h3>
                    <div class="col-12" style="padding-bottom: 15px">
                        <a href="cadastrarServico.jsp"
                           class="btn btn-primary btn-md"
                           role="button">
                           Cadastrar Serviço&nbsp;
                           <i class="fa-solid fa-floppy-disk"></i>
                            
                        </a>
                    </div>
                    <div class="container">
                        <table class="table table-hover table-responsive-md"
                               id="listarServicos">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nome</th>
                                    <th>Descrição</th>
                                    <th>Preço</th>
                                    <th>Duração</th>
                                    <th>Status</th>
                                    <th>Ação</th>
                                </tr>
                            </thead>
                            <c:forEach items="${servicos}" var="s">
                            <tbody>
                                <tr>
                                    <td>${s.idServico}</td>
                                    <td>${s.nome}</td>
                                    <td>${s.descricao}</td>
                                    <td>${s.preco}</td>
                                    <td>${s.duracao}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${s.status == 1}">
                                                Ativado
                                            </c:when>
                                            <c:otherwise>
                                                Desativado
                                             </c:otherwise>
                                        </c:choose>
                                   </td>
                                   <td>
                                       <a href="gerenciarServico?acao=alterar&idServico=${s.idServico}"
                                          class="btn btn-primary btn-sm"
                                          role="button">Alterar&nbsp;<i class="fa-solid fa-pen-to-square"></i></a>
                                          
                                          <script type="text/javascript">
                                              function confirmDesativar(id, nome){
                                                  if(confirm('Deseja desativar o Serviço ' + nome + ' ?')){
                                                      location.href="gerenciarServico?acao=desativar&idServico="+id;
                                                  }
                                              }
                                              
                                              function confirmAtivar(id, nome){
                                                  if(confirm('Deseja ativar o Serviço ' + nome + ' ?')){
                                                      location.href="gerenciarServico?acao=ativar&idServico="+id;
                                                  }
                                              }

                                          </script>
                                          <c:choose>
                                              <c:when test="${s.status == 1}">
                                                  <button class="btn btn-danger btn-sm"
                                                          onclick="confirmDesativar('${s.idServico}', '${s.nome}')">
                                                      Desativar&nbsp;
                                                      <i class="fas fa-user fa-user-lock"></i>
                                                  </button>
                                              </c:when>    
                                              <c:otherwise>
                                                  <button class="btn btn-success btn-sm"
                                                          onclick="confirmAtivar('${s.idServico}', '${s.nome}')">
                                                      Ativar&nbsp;
                                                      <i class="fas fa-user-shield"></i>
                                                  </button>
                                              </c:otherwise>
                                              
                                          </c:choose>
                                   </td>
                                </tr>
                                
                            </c:forEach>    
                            </tbody>
                        </table>
                    </div>
                </div><!-- fim da div col-12 -->
               
                
            </div>
            
        </div>
        
        <!-- JQuery.js -->
        <script src="js/jquery-3.6.0.min.js"></script>
        <!-- Popper.js via cdn -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha512-Ua/7Woz9L5O0cwB/aYexmgoaD7lw3dWe9FvXejVdgqu71gRog3oJgjSWQR55fwWx+WKuk8cl7UwA1RS6QCadFA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!--Jquery.dataTables.min.js -->
        <script src="datatables/js/jquery.dataTables.min.js"></script>
        <!--dataTables.bootstrap4.min.js -->
        <script src="datatables/js/dataTables.bootstrap4.min.js"></script>
        <!--<!-- SweetAlert -->
        <script src="js/sweetalert.min.js"></script>
        
        <script type="text/javascript">
             $(document).ready(function () {
                $("#listarServicos").dataTable({
                    "bJQueryUI": true,
                    "lengthMenu": [[5, 10, 20, 25, -1], [5, 10, 20, 25, "Todos"]],
                        "oLanguage": {
                            "sProcessing": "Processando..",
                            "sLengthMenu": "Mostrar _MENU_ registros",
                            "sZeroRecords": "Não foram encontrados resultados",
                            "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                            "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                            "sInfoFiltered": "",
                            "sInfoPostFix": "",
                            "sSearch": "Pesquisar",
                            "sUrl": "",
                        "oPaginate": {
                            "sFirst": "Primeiro",
                            "sPrevious": "Anterior",
                            "sNext": "Próximo",
                            "sLast": "Último"
                            }
                        }
                    });
                }); 
            </script>
    </body>
</html>

