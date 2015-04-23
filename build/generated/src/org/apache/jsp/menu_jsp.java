package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Jeopardy</title>\n");
      out.write("        <!--<link type=\"text/css\" rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/document_css.css\" />-->\n");
      out.write("        <style>\n");
      out.write("            #bienvenida , #seleccion{\n");
      out.write("                color: #FFFFFF;\n");
      out.write("                font-family:Arial;\n");
      out.write("                font-size: 20px;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #table_menu{\n");
      out.write("               margin: 0px auto;\n");
      out.write("               text-align: center;\n");
      out.write("              \n");
      out.write("            }\n");
      out.write("            td{\n");
      out.write("                padding: 30px;\n");
      out.write("            }\n");
      out.write("            body{\n");
      out.write("                background: #060CE9;\n");
      out.write("            }\n");
      out.write("/*            #click_button{\n");
      out.write("                width:500px;\n");
      out.write("                background: #FFFFFF; \n");
      out.write("                padding: 8px 14px 10px; \n");
      out.write("                border:3px solid #000000; \n");
      out.write("                cursor:pointer; \n");
      out.write("                font-family:Oswald, sans-serif; \n");
      out.write("                letter-spacing:.1em;\n");
      out.write("                text-shadow: 0 -1px 0px rgba(0, 0, 0, 0.3); \n");
      out.write("                color: #000000;\n");
      out.write("                border-radius: 10px; \n");
      out.write("            }*/\n");
      out.write("            \n");
      out.write("            #click_button {\n");
      out.write("                position: relative;\n");
      out.write("                color: #FFFFFF;\n");
      out.write("                text-decoration: none;\n");
      out.write("                background-color: red;\n");
      out.write("                font-family: Arial;\n");
      out.write("                font-weight: 300;\n");
      out.write("                font-size: 5px;\n");
      out.write("                display: block;\n");
      out.write("                padding: 4px;\n");
      out.write("                margin: 100px auto;\n");
      out.write("                width: 160px;\n");
      out.write("                text-align: center;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #click_button:active {\n");
      out.write("                position: relative;\n");
      out.write("                top: 6px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1 id=\"bienvenida\">Bienvenido a Jeopardy!</h1>\n");
      out.write("        <h2 id=\"seleccion\">Favor de seleccionar una de las siguientes opciones</h2>\n");
      out.write("        <table id=\"table_menu\">\n");
      out.write("            <tr id=\"table_row\">\n");
      out.write("                <td>\n");
      out.write("                    <button id=\"click_button\" type=\"button\">Crear Juego</button>\n");
      out.write("                </td>                   \n");
      out.write("                <td>\n");
      out.write("                    <button id=\"click_button\" type=\"button\">Modificar Juegos</button>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr id=\"table_row\">\n");
      out.write("                <td>\n");
      out.write("                    <button id=\"click_button\" type=\"button\">Nueva Categoria</button>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <button id=\"click_button\" type=\"button\">Nueva Pista</button>\n");
      out.write("                </td>  \n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            <tr id=\"table_row\">\n");
      out.write("                <td>\n");
      out.write("                    <button id=\"click_button\" type=\"button\">Editar Categorias</button>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <button id=\"click_button\" type=\"button\">Editar Pistas</button>\n");
      out.write("                </td>  \n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            <tr id=\"table_row\">\n");
      out.write("                <td colspan=\"2\">\n");
      out.write("                    <button id=\"click_button\" type=\"button\">Ver Resultados</button>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
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
