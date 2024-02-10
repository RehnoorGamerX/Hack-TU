<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="bootstrap-4.6.2-dist/js/popper.min.js" type="text/javascript"></script>
    <srcipt src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></srcipt>
    <script src="bootstrap-4.6.2-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="bootstrap-4.6.2-dist/js/jquery-3.7.1-min.js" type="text/javascript"></script>
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link href="bootstrap-4.6.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        
        <script src="bootstrap-4.6.2-dist/js/bootstrap.js" type="text/javascript"></script>
        <style>
            *
            {
                margin:0px;
                padding:0px;
                box-sizing: border-box;
                font-family: 'Gill Sans','Gill Sans MT',Calibri,'Trubuchet MS',sans-serif;
            }
            #particles-js
            {
                width:100%;
                height:100vh;
                
            }
            h1
            {
                position:absolute;
                top:50%;
                left:50%;
                transform: translate(-50%,-50%);
                font-size: 80px;
                color:white;
            }
        </style>
       
    </head>
    <body style="background-color: #36454F;">
        
        
            <%
                HashMap<String,ArrayList<String>> data = new HashMap<>();
                ArrayList<String> str;
                try{
                Class.forName("com.mysql.jdbc.Driver");
             System.out.println("Driver Loading Done");
             
             Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rehnoor","root","1234");
             System.out.println("Connection Done");
                
             Statement stmt = conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_SENSITIVE,java.sql.ResultSet.CONCUR_UPDATABLE);
             System.out.println("Statement Done");
             
             java.sql.ResultSet rs = stmt.executeQuery("select destination,location from tms");
             System.out.println("Result Set Created");
                 while(rs.next())
                 {
                    String l=rs.getString("location");
                    String d=rs.getString("destination");
                    
                    if(data.containsKey(l))
                    {
                    data.get(l).add(d);
                    }
                else
                {
                str  = new ArrayList();
                str.add(d);
                
                data.put(l,str);
                }
                 }
}
catch(Exception ex)
{
ex.printStackTrace();
}

for(String str3: data.keySet())
{
for(String str4:data.get(str3))
{
System.out.println(str4+" ");
                }
                }
             %>
               
        <div id="particles-js" class="container">
            <div class="row">
                <div class="col-sm-12 jumbotron" style="background-color: red; text-align: center">
                    <h1 style="color: white;">List of Passengers</h1>
                </div>
            </div>
            <!-- Example single danger button -->
            
            
<%           
for(String str2:data.keySet())
{
%>

<div class="btn-group">
  <button type="button" class="btn btn-danger dropdown-toggle" style="background-color: red; margin-right:20px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <%=str2%>
  </button>
  <div class="dropdown-menu">
      <%
for(String str3:data.get(str2))
    {
    %>
    <a class="dropdown-item" href="#"><%=str3%></a>
    <%
    }
%>
  </div>
</div>
<%
  }
%>
            
        </div>

            <script src="bootstrap-4.6.2-dist/js/particles.js" type="text/javascript"></script>
        <script src="bootstrap-4.6.2-dist/js/app.js" type="text/javascript"></script>
        
    </body>
        
    </body>
</html>
