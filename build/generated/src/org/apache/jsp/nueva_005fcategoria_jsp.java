package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class nueva_005fcategoria_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <!--se incluye el header.jsp en donde se agregan todos los css y js-->\n");
      out.write("    ");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <style>\n");
      out.write("            #categoria{\n");
      out.write("                size:35px;\n");
      out.write("                font-size: 50px;\n");
      out.write("                width: 500px;\n");
      out.write("                padding-top: 100px;\n");
      out.write("                margin: 0px auto;\n");
      out.write("            }\n");
      out.write("            #align{\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            #bienvenida , #seleccion{\n");
      out.write("                color: #FFFFFF;\n");
      out.write("                font-family:Arial;\n");
      out.write("                font-size: 20px;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("             body{\n");
      out.write("                background: #060CE9;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            #table_menu{\n");
      out.write("               margin: 0px auto;\n");
      out.write("               text-align: center;\n");
      out.write("              \n");
      out.write("            }\n");
      out.write("            td{\n");
      out.write("                padding: 30px;\n");
      out.write("            }\n");
      out.write("            #click_button{\n");
      out.write("                width:500px;\n");
      out.write("                background: #FFFFFF; \n");
      out.write("                padding: 8px 14px 10px; \n");
      out.write("                border:3px solid #000000; \n");
      out.write("                cursor:pointer; \n");
      out.write("                font-family:sans-serif; \n");
      out.write("                letter-spacing:1px;\n");
      out.write("                text-shadow: 0 -1px 0px rgba(0, 0, 0, 0.3); \n");
      out.write("                color: #000000;\n");
      out.write("                border-radius: 10px; \n");
      out.write("                \n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!--input de la nueva categoria que quiere ingresar el usuario-->\n");
      out.write("        <!--se agrega un div que alinea todos los elementos en el centro para \n");
      out.write("        facilitar que los elementos se tengan que alinear uno por uno-->\n");
      out.write("        <div id='align'>\n");
      out.write("            <h1 id='bienvenida'>Bienvenido a creacion de categoria</h1>\n");
      out.write("            <h2 id='seleccion'>Cual sera el nombre de tu nueva categoria?</h2>\n");
      out.write("            <form>\n");
      out.write("                <table id='table_menu'>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><input type='text' id='categoria'/></td>\n");
      out.write("                    </tr> \n");
      out.write("                    <tr>\n");
      out.write("                        <td><input id='click_button' type=\"submit\" value='Crear'/></td> \n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
