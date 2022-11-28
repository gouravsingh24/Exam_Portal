<%@page import="com.wipro.bean.Login"%>
<%

Login lg1 = (Login)session.getAttribute("current_user");


	
%>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	
	<div class = "container">
	
		  <a class="navbar-brand" href="index.jsp">GRE Exam Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
     
     
    </ul>
    
    
   <ul class = "navbar-nav ml-auto">
   
  		 <%
  		 
  		 	//Conditional rendering
  		 	
  		 	if(lg1==null){
  		 		
  		 		%>
  		 		<li class="nav-item active">
  	        	<a class="nav-link" href="login.jsp">Login</a>
  	      </li>
  	      
  	      <li class="nav-item active">
  	        	<a class="nav-link" href="register.jsp">Register</a>
  	      </li><% 
  		 	}else{
  		 		%>
  		 	
  		 	
  		 	
  		 		<li class="nav-item active">
  	        	<a class="nav-link" href="#!"><%=lg1.getName()%></a>
  	      </li>
  	     
  	      <li class="nav-item active">
  	        	<a class="nav-link"  href="LogoutServlet">Logout</a>
  	      </li>
  		 	
  		 	<% }
  		 
  		 %>
   
   		
      
   </ul>
   
   
   
  </div>
	
	</div>
	
</nav>