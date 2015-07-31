<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="distributore.controller.Distributore,
		java.util.List, 
		java.util.ArrayList,
		distributore.bean.Tessera,
		java.util.Iterator"
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="/DistributoreWeb/style/style.css" />
	<title>Visualizza Bevanda</title>
</head>
<body>
	<h3 style="padding-left:450px;">
	**********************************<br>
	VISUALIZZA LE TESSERE CARICATE<br>
	**********************************
	</h3>
	<div id="contenitore">
		<div id="menu">
			<menu>
				<li><a href="/DistributoreWeb/pages/gestioneTessere/aggiungiTessera.jsp">Aggiungi Tessera</a></li>
				<li><a href="/DistributoreWeb/Distributore?scelta=2">Visualizza Tessere</a></li>
				<li><a class="indietro" href="/DistributoreWeb">Menù principale</a></li>
			</menu>
		</div>
		<div id="content">
			<h1 style="text-align: center;">Tessere Caricate</h1>
			<table>
				<tr>
					<th> CREDITO </th>
					<th> CODICE </th>
				</tr>
					
				<%
					@SuppressWarnings("unchecked")
					List<Tessera> TessereDisp = (ArrayList<Tessera>) request.getAttribute("listaTessere"); //CAST PESANTE MA NECESSARIO
					Iterator<Tessera> it = TessereDisp.iterator();
					Tessera t = new Tessera();
					while(it.hasNext()) {
						t = it.next();
				%>
					<tr>
						<td><%=t.getCredito() %></td>
						<td><%=t.getCodice() %></td>
					</tr>
				<%
					}	
				%>
			</table>
		</div>
	</div>
</body>
</html>