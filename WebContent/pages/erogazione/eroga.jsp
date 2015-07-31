<%@page import="distributore.bean.Bevanda"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="distributore.controller.Distributore" 
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="/DistributoreWeb/style/style.css" />
	<title>Effettua erogazione</title>
</head>
<body>
	<h3 style="padding-left:450px;">
	***********************************************<br>
	EFFETTUA UN' EROGAZIONE DAL DISTRIBUTORE<br>
	***********************************************
	</h3>
	<div id="contenitore">
		<div id="menu">
			<menu>
				<li><a href="/DistributoreWeb/pages/erogazione/eroga.jsp">Effettua Erogazione</a></li>
				<li><a href="/DistributoreWeb/pages/erogazione/lattineDisponibili.jsp">Lattine Disponibili</a></li>
				<li><a href="/DistributoreWeb/pages/erogazione/ricaricaTessera.jsp">Ricarica Tessera</a></li>
				<li><a href="/DistributoreWeb/Distributore?scelta=3">Visualizza Distributore</a></li>
				<li><a class="indietro" href="/DistributoreWeb">Menù principale</a></li>
			</menu>
		</div>
		<div id="content">
			<h1>Effettua un' erogazione con il codice Bibita</h1>
			<form method="post" action="/DistributoreWeb/Distributore">
				<label for="codiceTessera">Codice Della Tessera</label> 
					<% 
						if(request.getAttribute("codiceTessera") != null && Float.parseFloat(request.getAttribute("codiceTessera").toString()) != -1) {
					%>	
						<input type="text" name="codiceTessera" value="<%=request.getAttribute("codiceTessera")%>"/>
					<%
						} else if(request.getAttribute("codiceTessera") == null) {
					%>								
						<input type="text" name="codiceTessera" />
					<%
						} else {
					%>
						<input type="text" name="codiceTessera" placeholder="Codice tessera non valido"/>
					<%
						}
					%>
					
				<label for="codiceBevanda">Codice Della Bevanda da erogare</label> 
					<% 
						if(request.getAttribute("codiceBevanda") != null && !request.getAttribute("codiceBevanda").equals("")) {
					%>	
						<input type="text" name="codiceBevanda" value="<%=request.getAttribute("codiceBevanda")%>"/>
					<%
						} else if(request.getAttribute("codiceBevanda") == null) {
					%>								
						<input type="text" name="codiceBevanda" />
					<%
						} else {
					%>
						<input type="text" name="codiceBevanda" placeholder="Codice bevanda non valido"/>
					<%
						}
					%> 
				<input type="hidden" name="scelta" value="5" /> 
				<input type="submit" value="eroga" />
			</form>
			<p>
			<% 				 				
				if(request.getAttribute("esito")!= null && request.getAttribute("esito").equals("SUCCESS")) {
			%>			
				Bevanda ottenuta dalla colonna <%=request.getAttribute("colonnaPrelievo") %>!			
			<% 
				} else if(request.getAttribute("esito") != null ) { 
			%>
				Errore, lattina non erogata!
			<% 
				}
			%>
			</p>
		</div>
	</div>
</body>
</html>