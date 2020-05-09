<%-- 
    Document   : dochome
    Created on : 25 Jul, 2017, 11:36:54 AM
    Author     : S7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
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
    <body>
        
    <div id="wrap">

          <!-- HEADER SECTION -->
        <div id="top">

            <nav class="navbar navbar-inverse navbar-fixed-top " style="padding-top: 10px;">
                <a data-original-title="Show/Hide Menu" data-placement="bottom" data-tooltip="tooltip" class="accordion-toggle btn btn-primary btn-sm visible-xs" data-toggle="collapse" href="#menu" id="menu-toggle">
                    <i class="icon-align-justify"></i>
                </a>
                <!-- LOGO SECTION -->
                <header class="navbar-header">

                    <a href="index.jsp" class="navbar-brand">
                    <img src="assets/img/logo.png" alt="" /></a>
                </header>
                <!-- END LOGO SECTION -->
               <ul class="nav navbar-top-links navbar-right">

                    <!-- MESSAGES SECTION -->
                    <ul class="nav navbar-top-links navbar-right">

                    <!-- MESSAGES SECTION -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <span class="label label-success"><label ID="Label2" runat="server" Text="0"></label></span>    <i class="icon-envelope-alt"></i>&nbsp; <i class="icon-chevron-down"></i>
                        </a>


                       <div>
          
            
                           <ItemTemplate><div >
               <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <a href="#">
                                    <div>
                                        <strong style="color: red"><%//# Eval("Name") %></strong>
                                        <span class="pull-right text-muted">
                                            <em>Today</em>
                                        </span>
                                    </div>
                                    <div><%//# Eval("message") %>
                                        <br />
                                        <hr />

                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            
                           
                            <li class="divider"></li>
                            <li>
                                <a class="text-center" href="">
                                    <strong>Read All Messages</strong>
                                    <i class="icon-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                
           
                               </div>
           </ItemTemplate>
            <LayoutTemplate>
              
                    <span runat="server" id="itemPlaceholder" />
                
               
            </LayoutTemplate>
           
        </div>
     


                    </li>
                    <!--END MESSAGES SECTION -->

                    
                   
                    <!--ADMIN SETTINGS SECTIONS -->

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="icon-user "></i>&nbsp; <i class="icon-chevron-down "></i>
                        </a>

                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="dochome.jsp"><i class="icon-user"></i> My Profile </a>
                            </li>
                           
                            <li class="divider"></li>
                            <li><a href="index.jsp?pg=lg"><i class="icon-signout"></i> Logout </a>
                            </li>
                        </ul>

                    </li>
                    <!--END ADMIN SETTINGS -->
                </ul>

            </nav>

        </div>
        <!-- END HEADER SECTION -->



        <!-- MENU SECTION -->
        <div id="left" style="margin-top: 50px;">
            <div class="media user-media well-small">
                <%
                connect hm=new connect();
                hm.read("select * from docreg where mail='"+session.getAttribute("user").toString()+"'");
                if(hm.rs.next())
                {
                %>
             <a class="user-link" href="#">
                 <Image runat="server" ID="im" class="media-object img-thumbnail user-img" alt="User Picture" width="100px" height="100%" src="photo/<%=hm.rs.getString(13)%>"/>
                </a>
                <br />
                <div class="media-body">
                    <h5 class="media-heading">
                        <%=hm.rs.getString(2)%>
                        </h5>
                    <ul class="list-unstyled user-info">
                        
                        <li>
                             <a class="btn btn-success btn-xs btn-circle" style="width: 10px;height: 12px;"></a> Online
                           
                        </li>
                       
                    </ul>
                    <%}%>
                </div>
                <br />
            </div>

            <ul id="menu" class="collapse">

                
                <li class="panel">
                    <a href="index.jsp" >
                        <i class="icon-table"></i> Dash Board
	   
                       
                    </a>                   
                </li>

            
                <li class="panel active">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#component-nav">
                        <i class="icon-tasks"> </i>Doctor Tools    
	   
                        <span class="pull-right">
                          <i class="icon-angle-left"></i>
                        </span>
                       &nbsp; <span class="label label-default">10</span>&nbsp;
                    </a>
                    <ul class="in" id="component-nav">
                       
                        <li class=""><a href="dochome.jsp?pg=mycon"><i class="icon-angle-right"></i>My Cunsulting Time </a></li>
                        <li class=""><a href="dochome.jsp?pg=up"><i class="icon-angle-right"></i>Approve Appointments </a></li>
                         <li class=""><a href="dochome.jsp?pg=fup"><i class="icon-angle-right"></i>My Appointments </a></li>
                      
                        <li class=""><a href="dochome.jsp?pg=prf"><i class="icon-angle-right"></i> Change My Profile </a></li>
                        
                         <li class=""><a href="dochome.jsp?pg=cp"><i class="icon-angle-right"></i>change password</a></li>
                           </ul>
                </li>   
               

                
               
          
                


                

            </ul>

        </div>
        <!--END MENU SECTION -->

        <!--PAGE CONTENT -->
        <div id="content" style="margin-top: 60px;">
           
                <div class="inner">
                    
             
               
                       <div class="row">
        <div class="col-lg-12">
            <div class="box primary">
                <header>
                    <div class="icons"><i class="icon-building"></i></div>
                    <h5>Details</h5>
                    <div class="toolbar">

                        
                    </div>
                </header>
                <div class="body collapse in" id="div1">
                  <%
                 if(request.getAttribute("msg")!=null)
       {
       out.println("<script>alert('"+request.getAttribute("msg")+"');</script>");
       }
                      String pg="";
                  if(request.getParameter("pg")!=null)
                  {
                  pg=request.getParameter("pg");
                  }
                  if(pg.equals("mycon"))
                  {
                  %>
                  <%@include file="mycon.jsp" %>
                    <%
                  }else  if(pg.equals("prf"))
                  {
                  %>
                  <%@include file="detprof.jsp" %>
                   <%
                  }else  if(pg.equals("cp"))
                  {
                  %>
                  <%@include file="changepass.jsp" %>
                    <%}
                  else  if(pg.equals("up"))
                  {
                  %>
                  <%@include file="DoctorViewAppontments.jsp" %>
                    <%}
                   else  if(pg.equals("fup"))
                  {
                  %>
                  <%@include file="DocViewFile.jsp" %>
                    <%}
                    else  if(pg.equals("de"))
                  {
                  %>
                  <%@include file="Images.jsp" %>
                    <%}
                   else  if(pg.equals("viewF"))
                  {
                   
                  %>
                  <%@include file="DocDecode.jsp" %>
                    <%}
                   else  if(pg.equals("vf"))
                  {
                  %>
                  <%@include file="ViewMyFiles.jsp" %>
                    <%}
                  else  if(pg.equals("feed"))
                  {
                  %>
                  <%@include file="DoctorViewFeedback.jsp" %>
                    <%}
                  
                  %>
                    
                 
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
