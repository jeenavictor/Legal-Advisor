
<%@include file="connections.jsp" %>


<%@page import="java.io.FileOutputStream"%>

<%@page import="org.apache.commons.fileupload.util.Streams"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.fileupload.FileItemStream"%>
<%@page import="org.apache.commons.fileupload.FileItemIterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>



<%
String cid=request.getParameter("cid");

    ServletFileUpload upload=new ServletFileUpload();
    FileItemIterator iter=null;
    String ftitle = "";
         
    String file="";
    

    iter=upload.getItemIterator(request);
    while(iter.hasNext()){
        FileItemStream item=iter.next();
        String nam=item.getFieldName();
        InputStream stream=item.openStream();
        if(item.isFormField()){
            String str=Streams.asString(stream);
            if(nam.equals("ftitle")){
                ftitle=str;
            }
           
            else if(nam.equals("cid")){
                cid=str;
            }
            
            
        
        }
        else if(item.getName()!=""){ 
            if(nam.equals("image"))
            {
            File f=new File("C:\\Users\\divya\\Downloads\\legal_advisor\\legal_advisor\\web\\imgs\\"+item.getName().substring(item.getName().lastIndexOf("\\") + 1));
            file=item.getName().substring(item.getName().lastIndexOf("\\") + 1);
            if(!f.exists())
            {
                f.createNewFile();
            }
            FileOutputStream fos=new FileOutputStream(f);
            int ch;
            while((ch=stream.read())!=-1)
            {
                fos.write(ch);
            }
            }
         
            }                
    }
//    String sid=session.getAttribute("sid").toString();
   st1.executeUpdate("insert into case_files values(null,'"+ftitle+"','"+cid+"','"+file+"')");

//           response.sendRedirect("admin_manage_product.jsp");
          %>
   <script>
       alert("Added successfully");
       window.location="adv_home.jsp";
   </script>
<%



%>