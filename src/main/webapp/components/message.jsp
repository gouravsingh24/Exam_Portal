
<%
String msg = (String) session.getAttribute("message");
String msg2 = (String) session.getAttribute("messages");
if (msg != null) {
%>

<div class="alert alert-success alert-dismissible fade show"
	role="alert">
	<strong><%=msg%></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>

<%
}

else if(msg2!=null){
%>


<div class="alert alert-warning alert-dismissible fade show"
	role="alert">
	<strong><%=msg2 %></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>


<%
}
session.removeAttribute("message");
session.removeAttribute("messages");
%>
