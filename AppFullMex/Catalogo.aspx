<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="AppFullMex.Catalogo" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>TDR | TI APPS</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
     <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"></script>--%>
    <script type="text/javascript" src='https://cdn.jsdelivr.net/sweetalert2/6.3.8/sweetalert2.min.js'> </script>
        <link rel="stylesheet" href='https://cdn.jsdelivr.net/sweetalert2/6.3.8/sweetalert2.min.css'
            media="screen" />
    <script src="https://kit.fontawesome.com/789a3ce2b4.js" crossorigin="anonymous"></script>
<script>
    $(function () {
        $("#datepicker").datepicker(
            {
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy'
            });
    });
</script>
    <script>
        $(function () {
            $("#datepicker2").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'mm/dd/yy'
                });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('.open-menu-btn').on('click', function () {
                if ($('body').hasClass('closed-menu')) {
                    $('body').removeClass('closed-menu');
                } else $('body').addClass('closed-menu');
            });
        });
    </script>
    
   
<style>
        .mitabla {
            width :100%
        }
        ::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px grey; 
  border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
 background: grey;
  border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background-image: linear-gradient(to bottom right, #00315f,#f7be31 );
}

        body {
            margin: 0;
            background: #000000;
            font-family: Arial;
        }

        nav {
            position: fixed;
            width: 100%;
            max-width: 300px;
            bottom: 0;
            top: 0;
            display: block;
            min-height: 300px;
            height: 100%;
            color: #fff;
            opacity: 0.8;
            transition: all 300ms;
            -moz-transition: all 300ms;
            -webkit-transition: all 300ms;
        }

            nav .vertical-menu hr {
                opacity: 0.1;
                border-width: 0.5px;
            }

            nav ul {
                width: 90%;
                padding-inline-start: 0;
                margin: 10px;
                height: calc(100% - 20px);
            }

            nav .vertical-menu-logo {
                padding: 10px;
                font-size: 1.3em;
                position: relative
            }

                nav .vertical-menu-logo .open-menu-btn {
                    width: 30px;
                    height: max-content;
                    position: absolute;
                    display: block;
                    right: 20px;
                    top: 0;
                    bottom: 0;
                    margin: auto;
                    cursor: pointer;
                }

                    nav .vertical-menu-logo .open-menu-btn hr {
                        margin: 5px 0
                    }

            nav li {
                list-style: none;
                padding: 10px 10px;
                cursor: pointer;
            }

                /*nav li:hover {
                    -webkit-transition-delay:0s;
                   -webkit-transition-duration:0.5s;
                   -webkit-transition-property:all;
                   -webkit-transition-timing-function:ease;
                   background-color:#95a5a6;
                   border-start-end-radius:10px !important;
                }*/

                .stiloli:hover {
                     -webkit-transition-delay:0s;
                   -webkit-transition-duration:0.5s;
                   -webkit-transition-property:all;
                   -webkit-transition-timing-function:ease;
                   background-color:#95a5a6;
                   border-start-end-radius:10px !important;
                }
                .stilolic:hover {
                    -webkit-transition-delay:0s;
                   -webkit-transition-duration:0.5s;
                   -webkit-transition-property:all;
                   -webkit-transition-timing-function:ease;
                     transform: scale(1.5);
                }

                nav li#user-info {
                    position: absolute;
                    bottom: 0;
                    width: 80%;
                }

                    nav li#user-info > span {
                        display: block;
                        float: right;
                        font-size: 0.9em;
                        position: relative;
                        opacity: 0.6;
                    }

                        nav li#user-info > span:after {
                            content: '';
                            width: 12px;
                            height: 12px;
                            display: block;
                            position: absolute;
                            background: #13ff13;
                            left: -20px;
                            top: 0;
                            bottom: 0;
                            margin: auto;
                            border-radius: 50%;
                        }

        .content-wrapper {
            width: calc(100% - 300px);
            height: 100%;
            position: fixed;
            background: #fff;
            left: 300px;
            padding: 20px;
            
        }

        .closed-menu .content-wrapper {
            width: 100%;
            left: 50px;
        }

        .content-wrapper {
            transition: all 300ms;
        }

        .vertical-menu-wrapper .vertical-menu-logo div {
            transition: all 100ms;
        }

        .closed-menu .vertical-menu-wrapper .vertical-menu-logo div {
            margin-left: -100px;
        }

        .vertical-menu-wrapper .vertical-menu-logo .open-menu-btn {
            transition: all 300ms;
        }

        .closed-menu .vertical-menu-wrapper .vertical-menu-logo .open-menu-btn {
            left: 7px;
            right: 100%;
        }

        .closed-menu .vertical-menu-wrapper ul, .closed-menu .vertical-menu-wrapper hr {
            margin-left: -300px;
        }

        .vertical-menu-wrapper ul, .vertical-menu-wrapper hr {
            transition: all 100ms;
        }

        .content-wrapper {
            background: #ebebeb;
        }
        .tstyle{
            padding:20px !important;
            color:red !important;
        }

        .content {
            width: 100%;
            min-height: 90%;
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            z-index: 1900;
        }
        #myProgress {
  width: 100%;
  background-color: #ddd;
}

#myBar {
  width: 1%;
  height: 30px;
  background-color: #04AA6D;
}
#myBar2 {
  width: 1%;
  height: 30px;
  background-color: #f7be31;
}
#divLoading {
    -moz-animation: cssAnimation 0s ease-in 3s forwards;
    /* Firefox */
    -webkit-animation: cssAnimation 0s ease-in 3s forwards;
    /* Safari and Chrome */
    -o-animation: cssAnimation 0s ease-in 3s forwards;
    /* Opera */
    animation: cssAnimation 0s ease-in 3s forwards;
    -webkit-animation-fill-mode: forwards;
    animation-fill-mode: forwards;
}
@keyframes cssAnimation {
    to {
        width:0;
        height:0;
        overflow:hidden;
    }
}
@-webkit-keyframes cssAnimation {
    to {
        width:0;
        height:0;
        visibility:hidden;
    }
}
#<%=UpdatePanel1.ClientID %> {width:100%;}
            
    </style>
</head>
<body>
     <nav class="vertical-menu-wrapper overflow-auto">
        <div class="vertical-menu-logo">
            <ul class="vertical-menu">
             <li>

                <img class="img-fluid" src="Models/logo.png" />
                

            </li></ul>
            <span class="open-menu-btn"><hr style="background-color:gray"><hr style="background-color:gray"><hr style="background-color:gray"></span>
        </div>
        <ul class="vertical-menu">
             <li>

                <b class="nav-link text-light" style="font-size:25px !important; text-align:center !important">FuelMex</b>
                

            </li>
            <li>
                <a href="Catalogo.aspx" class="nav-link">
                <b class="nav-link text-light" style="font-size:15px !important; text-align:center !important;color:#ffc107 !important">Catálogo</b>
                </a>

            </li>
             <li>
                 <a href="FuelMex.aspx" class="nav-link">
                <b class="nav-link text-light" style="font-size:15px !important; text-align:center !important;">Generar monto</b>
                </a>

            </li>
            <li style="text-light;text-align:center !important;" class="mt-5"><small>2023 Copyright <br /> &copy; TDR Transportes</small></li>
        </ul>
       
    </nav>
 <div class="content-wrapper" style="overflow:scroll">
       
        <div class="content shadow-lg">
              <form id="form1" runat="server">
                   <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1919919289">
        </asp:ScriptManager>
                  
         <div class="container-fluid mt-4">
                 <div class="card" runat="server" id="card1">
                  <div class="card-header">
                    <b>FuelMex | Catálogo de registro</b>
                      <%--<div runat="server" id="dynamic" class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                        <span id="current-progress"></span>
                      </div>--%>
                      </div>
                  <div class="card-body">
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="Billto"><b>Billto</b></label>
                                    <asp:TextBox ID="Billto" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFielValidator" ControlToValidate="Billto" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">* Campo requerido</asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="datepicker"><b>Fecha Inicial</b></label>
                                    <asp:TextBox ID="datepicker" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFielValidator" ControlToValidate="datepicker" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">* Campo requerido</asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="datepicker2"><b>Fecha Final</b></label>
                                    <asp:TextBox ID="datepicker2" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFielValidator" ControlToValidate="datepicker2" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">* Campo requerido</asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="PrecioBase"><b>Precio Base</b></label>
                                    <asp:TextBox ID="PrecioBase" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFielValidator" ControlToValidate="PrecioBase" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">* Campo requerido</asp:RequiredFieldValidator>
                        </div>
                         <div class="form-group col-md-4">
                            <label for="CRE"><b>CRE</b></label>
                                    <asp:TextBox ID="CRE" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFielValidator" ControlToValidate="CRE" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">* Campo requerido</asp:RequiredFieldValidator>
                        </div>
                         <div class="form-group col-md-4">
                            <label for="Rendimiento"><b>Rendimiento</b></label>
                                    <asp:TextBox ID="Rendimiento" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFielValidator" ControlToValidate="Rendimiento" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">* Campo requerido</asp:RequiredFieldValidator>
                        </div>
                       
                       
                        <div class="col-sm-12">
                            <div class="form-row">
                                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                                <div style="width: 100%;">
                                
                                <div class="form-group col-sm-12">
                                  <asp:Button ID="Button1" runat="server" Text="Registrar" CssClass="btn btn-block btn-success mt-4" OnClick="Button1_Click" />
                                </div>
                                    </div>
                            </div>
                        </div>
                            <div class="col-sm-12">
                                <div class="form-row">
                                     <div class="form-group col-sm-12" style="text-align:center">
                                          
                                         <asp:UpdateProgress ID="UpdWaitImage" runat="server"  DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel1">
                                         <ProgressTemplate>
                                            <asp:Image ID="imgProgress" ImageUrl="Models/load-37_256.gif" runat="server" />
                                                <br />
                                             <br />
                                             <h1>Procesando ...</h1>
                                             <h3>¡Espere por favor!</h3>
                                        </ProgressTemplate>
                                        </asp:UpdateProgress>     
                                     </div>
                                </div>
                            </div>
                              </ContentTemplate>
                           </asp:UpdatePanel>

                        
                        
                               
                               
                        <hr />
                        
                                
                                <asp:HiddenField ID="Rcartaporte"  runat="server"></asp:HiddenField>
                        <asp:HiddenField ID="HiddenField1"  runat="server"></asp:HiddenField>   
                         <asp:HiddenField ID="TotalMerca"  runat="server"></asp:HiddenField>
                        <asp:HiddenField ID="Contador"  runat="server"></asp:HiddenField>

                            
                            
                        

                    </div>
                      
                   
                  </div>

                </div>
             <br />
             
              <br />
             <br />
                      
             <div class="card" runat="server" id="card2">
                  <div class="card-header  bg-success">

                    <b style="color:white">FuelMex | Catálogo</b>
                  </div>
                  <div class="card-body">
                    <div class="row">
                        
                        <div class="col-sm-12">
                                   
                                    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                                        <ContentTemplate>
                                            
                                            <center>
                                           

                                          
          
                                           
                                             <asp:Table id="tablaStops" class="table table-sm table-striped text-center mt-4" Style="width:90%; padding:10px" runat="server" Font-Names="ARIAL">
                                                <asp:TableRow>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <b>#</b>
                                                    </asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <b>Billto</b>
                                                    </asp:TableCell><asp:TableCell HorizontalAlign="Center">
                                                        <b>Fecha Inicial</b>
                                                    </asp:TableCell><asp:TableCell HorizontalAlign="Center">
                                                        <b>Fecha Final</b>
                                                    </asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <b>Precio Base</b>
                                                    </asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <b>CRE</b>
                                                    </asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <b>Rendimiento</b>
                                                    </asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <b>Factor</b>
                                                    </asp:TableCell>
                                                </asp:TableRow>

                                            </asp:Table>
                         </center>   
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                    </div>
                      
                   
                  </div>

                </div>
                          
        </div>
                     </div>

     </div>
        <div>
            
            <br />
            <br />
           
        </div>
        <br />
        <div>
            <asp:Label ID="lblrespuesta" runat="server"></asp:Label>
        </div>
        
    </form>
            
        </div>
       
    </div>
</body>
</html>
