package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html >\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <title>Tabs</title>\n");
      out.write("  \n");
      out.write("  <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("     \n");
      out.write("    \n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    \n");
      out.write("    <img src=\"https://img.collegepravesh.com/2017/02/PICT-Logo.jpg\" style=\"position:absolute;width:100px;height:100px;top:30px;left:120px\">\n");
      out.write("    <div style=\"border:thin;background: #fff;height: 120px;\">\n");
      out.write("    <center><h1>Pune Institute of Computer Technology</h1></center>\n");
      out.write("    <center><h1>Digital Record Book</h1></center></div>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("  <div class=\"wrapper\" >\n");
      out.write("  <ul class=\"tabs clearfix\" data-tabgroup=\"first-tab-group\">\n");
      out.write("      <li><a href=\"#tab1\" class=\"active\"><b>LOGIN</b></a></li>\n");
      out.write("    <li><a href=\"#tab2\"><b>SIGN UP</b></a></li>\n");
      out.write("    \n");
      out.write("  </ul>\n");
      out.write("  <section id=\"first-tab-group\" class=\"tabgroup\">\n");
      out.write("    <div id=\"tab1\"> \n");
      out.write("      <h2>LOGIN</h2>\n");
      out.write("      <form   name=\"LoginForm\" action=\"Login\" method=\"get\">\n");
      out.write("         <center><p><b>Username : </b><input  type=\"text\" name=\"Username\"><br><br></center>\n");
      out.write("        <center><p><b>Password : </b><input  type=\"password\" name=\"Password\"><br><br></center>\n");
      out.write("        <center><b><input type=\"submit\" value=\"LOG IN\"></b></center>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("       \n");
      out.write("        \n");
      out.write("    </form>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("    <div id=\"tab2\">\n");
      out.write("      <h2>SIGN UP</h2>\n");
      out.write("      <form action=\"Signup\">\n");
      out.write("            <b>First Name : <input type=\"text\" name=\"First_name\"><br><br>\n");
      out.write("            Middle Name : <input type=\"text\" name=\"middle_name\"><br><br>\n");
      out.write("            Last Name : <input type=\"text\" name=\"last_name\"><br><br>\n");
      out.write("            Username : <input type=\"text\" name=\"UserID\"><br><br>\n");
      out.write("            Password : <input type=\"text\" name=\"Password\"><br><br>\n");
      out.write("            <input type=\"submit\" value=\"Create Account\"></b>\n");
      out.write("            </form>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("  </section>\n");
      out.write("</div>\n");
      out.write("  <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>\n");
      out.write("\n");
      out.write("    <script src=\"js/index.js\"></script>\n");
      out.write("   \n");
      out.write("    \n");
      out.write("    \n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("<!--\n");
      out.write("    if (top.location!= self.location) {\n");
      out.write("        top.location = self.location.href\n");
      out.write("                   //or you can use your logout page as\n");
      out.write("                   //top.location='logout.jsp' here...\n");
      out.write("    }\n");
      out.write("//-->\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
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
