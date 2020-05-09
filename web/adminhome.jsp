<%-- 
    Document   : adminhome
    Created on : 25 Jul, 2017, 11:38:24 AM
    Author     : S7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
   <head id="Head1" >
 <meta charset="UTF-8" />
    <title>BCORE Admin Dashboard Template | Buttons</title>
     <meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
     <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <!-- GLOBAL STYLES -->
    <!-- GLOBAL STYLES -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/theme.css" />
    <link rel="stylesheet" href="assets/css/MoneAdmin.css" />
    <link rel="stylesheet" href="assets/plugins/Font-Awesome/css/font-awesome.css" />
    <!--END GLOBAL STYLES -->

    <!-- PAGE LEVEL STYLES -->
    <link rel="stylesheet" href="assets/plugins/social-buttons/social-buttons.css" />
    <!-- END PAGE LEVEL  STYLES -->
       <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    </head>
    <body class="padTop53 ">

    
    <div id="wrap">

          <!-- HEADER SECTION -->
        <div id="top">

            <nav class="navbar navbar-inverse navbar-fixed-top " style="padding-top: 10px;">
                <a data-original-title="Show/Hide Menu" data-placement="bottom" data-tooltip="tooltip" class="accordion-toggle btn btn-primary btn-sm visible-xs" data-toggle="collapse" href="#menu" id="menu-toggle">
                    <i class="icon-align-justify"></i>
                </a>
                <!-- LOGO SECTION -->
                <header class="navbar-header">

                    <a href="index.html" class="navbar-brand">
                    <img src="assets/img/logo.png" alt="" /></a>
                </header>
                <!-- END LOGO SECTION -->
                <ul class="nav navbar-top-links navbar-right">

                    <!-- MESSAGES SECTION -->
          
                    <!--END MESSAGES SECTION -->

                    <!--TASK SECTION -->
                  
                    <!--END TASK SECTION -->

        
                    <!-- END ALERTS SECTION -->

                    <!--ADMIN SETTINGS SECTIONS -->

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="icon-user "></i>&nbsp; <i class="icon-chevron-down "></i>
                        </a>

                        <ul class="dropdown-menu dropdown-user">
                           
                            <li><a href="#"><i class="icon-gear"></i> Settings </a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="index.jsp" id="loginLink"><i class="icon-signout"></i> Logout </a>
                            </li>
                        </ul>

                    </li>
                    <!--END ADMIN SETTINGS -->
                </ul>

            </nav>

        </div>
        <!-- END HEADER SECTION -->



        <!-- MENU SECTION -->
       <div id="left">
            <div class="media user-media well-small">
             <a class="user-link" href="#">
                    <img class="media-object img-thumbnail user-img" alt="User Picture" src="assets/img/user.gif" />
                </a>
                <br />
                <div class="media-body">
                    <h5 class="media-heading"> Administrator</h5>
                    <ul class="list-unstyled user-info">
                        
                        <li>
                             <a class="btn btn-success btn-xs btn-circle" style="width: 10px;height: 12px;"></a> Online
                           
                        </li>
                       
                    </ul>
                </div>
                <br />
            </div>

            <ul id="menu" class="collapse">

                
                <li class="panel">
                    <a href="index.html" >
                        <i class="icon-table"></i> Find Your Doctor
	   
                       
                    </a>                   
                </li>

            
                <li class="panel active">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#component-nav">
                        <i class="icon-tasks"> </i> AdminTools    
	   
                        <span class="pull-right">
                          <i class="icon-angle-left"></i>
                        </span>
                       &nbsp; <span class="label label-default">10</span>&nbsp;
                    </a>
                    <ul class="in" id="component-nav">
                       
                        <li class=""><a href="adminhome.jsp?pg=adct"><i class="icon-angle-right"></i>add category </a></li>
                        <li class=""><a href="adminhome.jsp?pg=sbct"><i class="icon-angle-right"></i> add sub category  </a></li>
                        <li class=""><a href="adminhome.jsp?pg=vudc"><i class="icon-angle-right"></i> Approve doctors </a></li>
                         <li class=""><a href="adminhome.jsp?pg=vd"><i class="icon-angle-right"></i> View doctors </a></li>
               
                             </ul>
                </li>   
               

                
               
          
                


                

            </ul>

        </div>
        <!--END MENU SECTION -->

        <!--PAGE CONTENT -->
        <div id="content">
           
                <div class="inner">
                    
             
               
                       <div class="row">
        <div class="col-lg-12">
            <div class="box primary">
                <header>
                    <div class="icons"><i class="icon-building"></i></div>
                    <h5>Details</h5>
                    <div class="toolbar">
                        <button class="btn btn-default btn-sm" data-toggle="collapse" data-target="#div1">Search</button>
                    </div>
                </header>
                <div class="body collapse in" id="div1">
                   <%
                  String pg="";
              if(request.getParameter("pg")!=null)
              {
                  pg=request.getParameter("pg");
              }
              if(pg.equals("adct"))
              {
              %>
              <%@include file="addcat.jsp" %>
                    <%
              }else if(pg.equals("sbct"))
              {
              %>
              <%@include file="subcat.jsp" %>
                  
               <%
              }else if(pg.equals("vudc"))
              {
              %>
              <%@include file="viewdoc.jsp" %>
              <%
              }
              else if(pg.equals("vd"))
              {
              %>
              <%@include file="AdminViewDoctors.jsp" %>
              <%
              }%>

                  
                   
                   
                </div>
            </div>
        </div>


              


      
       






        
        
  </div>
               
                        </div>
                                       
                   
                     

                    
                    </div>              
             <!--END PAGE CONTENT -->            
                 </div>    
    <!--END MAIN WRAPPER -->
   <!-- FOOTER -->
    <div id="footer">
        <p>&copy;  binarytheme &nbsp;2014 &nbsp;</p>
    </div>
    <!--END FOOTER -->
     <!-- GLOBAL SCRIPTS -->
    <script src="assets/plugins/jquery-2.0.3.min.js"></script>
     <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <div>

    </div>
  
</body>
</html>
