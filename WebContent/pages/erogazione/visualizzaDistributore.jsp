<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="distributore.controller.Distributore,
		java.util.List, 
		java.util.ArrayList,
		distributore.bean.Colonna,
		java.util.Iterator"
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="/DistributoreWeb/style/style.css" />
	<title>Visualizza Il Distributore</title>
</head>
<body>
	<h3 style="padding-left:450px;">
	*****************************************<br>
	VISUALIZZA IL DISTRIBUTORE COMPLETO<br>
	*****************************************
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
			<h1 style="text-align: center;">Distributore</h1>
			<table>
				<tr>
					<th> NOME </th>
					<th> PREZZO </th>
					<th> CODICE </th>
					<th> LATTINE </th>
				</tr>
					
				<%
					@SuppressWarnings("unchecked")
					List<Colonna> colonnaDisp = (ArrayList<Colonna>) request.getAttribute("listaColonne"); //CAST PESANTE MA NECESSARIO
					Iterator<Colonna> it = colonnaDisp.iterator();
					Colonna c = new Colonna();
					while(it.hasNext()) {
						c = it.next();
				%>
					<tr>
						<td><%=c.getBevanda().getName() %></td>
						<td><%=c.getBevanda().getPrezzo() %></td>
						<td><%=c.getBevanda().getCodice() %></td>
						<td><%=c.getNumLattine() %></td>
					</tr>
				<%
					}	
				%>
			</table>
		</div>
	</div>
</body>
</html>