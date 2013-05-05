<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java"
	import="net.sf.jasperreports.engine.*,net.sf.jasperreports.engine.export.*"%>
<%@ page import="java.sql.*,java.io.*"%>
<%
String filename = request.getParameter("filename");

String reporttype = request.getParameter("reporttype");

Class.forName("com.ibm.db2.jcc.DB2Driver");

Connection conn = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTDB1","root","root"); 

String path = application.getRealPath("/");

JasperPrint jasperPrint = JasperFillManager.fillReport(path + "/" + filename, null, conn);
;

OutputStream ouputStream = response.getOutputStream();

JRExporter exporter = null;

if( "pdf".equalsIgnoreCase(reporttype) )
{
response.setContentType("application/pdf");
exporter = new JRPdfExporter();
exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
}
else if( "rtf".equalsIgnoreCase(reporttype) )
{
response.setContentType("application/rtf");
response.setHeader("Content-Disposition", "inline; filename=\"file.rtf\"");

exporter = new JRRtfExporter();
exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
}
else if( "html".equalsIgnoreCase(reporttype) )
{
exporter = new JRHtmlExporter();
exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
}
else if( "xls".equalsIgnoreCase(reporttype) )
{
response.setContentType("application/xls");
response.setHeader("Content-Disposition", "inline; filename=\"file.xls\"");

exporter = new JRXlsExporter();
exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
}
else if( "csv".equalsIgnoreCase(reporttype) )
{
response.setContentType("application/csv");
response.setHeader("Content-Disposition", "inline; filename=\"file.csv\"");

exporter = new JRCsvExporter();
exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
}

try
{
exporter.exportReport();
}
catch (JRException e)
{
throw new ServletException(e);
}
finally
{
if (ouputStream != null)
{
try
{
ouputStream.close();
}
catch (IOException ex)
{
}
}
}
%>
