package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class tablero_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/header.jsp");
  }

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
      out.write("    ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Jeopardy</title>\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"document_css.css\" />\n");
      out.write("    </head>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("    <body id=\"body_juego\">\n");
      out.write("        <h1 id=\"bienvenida\">Juega Jeopardy!</h1>\n");
      out.write("        <table id='table_juego'>\n");
      out.write("            <tr>\n");
      out.write("                <th id=\"header_juego\">Categoria 1</th>\n");
      out.write("                <th id=\"header_juego\">Categoria 2</th>\n");
      out.write("                <th id=\"header_juego\">Categoria 3</th>\n");
      out.write("                <th id=\"header_juego\">Categoria 4</th>\n");
      out.write("                <th id=\"header_juego\">Categoria 5</th>\n");
      out.write("            </tr>\n");
      out.write("            <tr></tr>\n");
      out.write("            <tr>\n");
      out.write("                <td id=\"juego_valor\">200</td><td id=\"juego_valor\">200</td><td id=\"juego_valor\">200</td><td id=\"juego_valor\">200</td><td id=\"juego_valor\">200</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td id=\"juego_valor\">400</td><td id=\"juego_valor\">400</td><td id=\"juego_valor\">400</td><td id=\"juego_valor\">400</td><td id=\"juego_valor\">400</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td id=\"juego_valor\">600</td><td id=\"juego_valor\">600</td><td id=\"juego_valor\">600</td><td id=\"juego_valor\">600</td><td id=\"juego_valor\">600</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td id=\"juego_valor\">800</td><td id=\"juego_valor\">800</td><td id=\"juego_valor\">800</td><td id=\"juego_valor\">800</td><td id=\"juego_valor\">800</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td id=\"juego_valor\">1000</td><td id=\"juego_valor\">1000</td><td id=\"juego_valor\">1000</td><td id=\"juego_valor\">1000</td><td id=\"juego_valor\">1000</td>\n");
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
