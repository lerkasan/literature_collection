<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function toggle(source) {
		checkboxes = document.getElementsByName('selectedItems');
		for (var i = 0, n = checkboxes.length; i < n; i++) {
			checkboxes[i].checked = source.checked;
		}
	}
</script>
<style>
.tabrow a {
	color: #555;
	text-decoration: none;
}
</style>
<link rel="stylesheet" href="/literature/resources/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search results:</title>
</head>
<body>
	<div align="center">
		<ul class="tabrow">
			<c:choose>
				<c:when test="${not empty searchEngineList}">
					<c:forEach var="engine" items="${searchEngineList}">
						<li
							<c:if test="${engine.name}==${engineName}"><c:out value="class='selected'"/></c:if>>
							<a href="<c:out value='/literature/search/${engine.name}'/>"><c:out
									value="${engine.name}" /></a>
						</li>
					</c:forEach>
				</c:when>
			</c:choose>
		</ul>
	</div>
	<c:choose>
		<c:when
			test="${(empty googleResults) && (empty springerResults) && (empty crossrefResults) && (empty amazonResults)}">
			<p align="center">Nothing found.</p>
		</c:when>
	</c:choose>





	<c:choose>
		<c:when test="${not empty amazonResults}">
			<p align="center">Search results from Amazon:</p>
			<div align="center">
				<form action="save" method="POST">
					<br> <input type="checkbox" onClick="toggle(this)" />&nbsp;&nbsp;Check/Uncheck
					All

					<table width=80%>
						<tr>
							<th></th>
							<th></th>
							<th>Title</th>
							<th>Author</th>
							<th>Publish Date</th>
							<th>Publisher</th>
						</tr>

						<c:set var="i" value="${1}" />
						<c:forEach var="result" items="${amazonResults}">
							<c:set var="i" value="${1}" />
							<tr>
								<td><input type="checkbox" name="selectedItems"
									value="${i}" /></td>
								<td><img width="130"
									src="<c:out value='${result.imageUrl}'/>"></img></td>
								<td><a href="<c:out value='${result.itemUrl}'/>"><c:out
											value="${result.title}" /></a></td>
								<td><c:out value="${result.author}" /></td>
								<td><c:out value="${result.publicationDate}" /></td>
								<td><c:out value="${result.publisher}" /></td>
							</tr>
							<c:set var="i" value="${i + 1}" />
						</c:forEach>
						<tr>
							<td colspan=6 align="right"><input type="submit"
								id="saveItemsButton" value="Save items" /></td>
						</tr>
					</table>
				</form>
			</div>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${not empty googleResults}">
			<p align="center">Search results from Google:</p>

			<div align="center">
				<form action="save" method="POST">
					<br> <input type="checkbox" onClick="toggle(this)" />&nbsp;&nbsp;Check/Uncheck
					All
					<table class="list" id="list">
						<tr>
							<th></th>
							<th>N</th>
							<th>Title</th>
							<th>Author</th>
							<th>Publish Date</th>
						</tr>

						<c:set var="i" value="${1}" />
						<c:forEach var="result" items="${googleResults}">
							<tr>
								<td><input type="checkbox" name="selectedItems"
									value="${i}" /></td>
								<td><c:out value="${i}" /></td>
								<td><a href="<c:out value='${result.link}'/>"><c:out
											value="${result.title}" /></a></td>
								<td><c:forEach var="author" items="${result.authors}">
										<c:out value="${author}" />&nbsp;
								</c:forEach></td>
								<td><c:out value="${result.publishDate}" /></td>
							</tr>
							<c:set var="i" value="${i + 1}" />
						</c:forEach>
						<tr>
							<td colspan=5 align="right"><input type="submit"
								id="saveItemsButton" value="Save items" /></td>
						</tr>
					</table>
				</form>
			</div>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${not empty springerResults}">
			<br>
			<p align="center">Search results from SpringerOpen:</p>
			<div align="center">
				<form action="save" method="POST">
					<br> <input type="checkbox" onClick="toggle(this)" />&nbsp;&nbsp;Check/Uncheck
					All
					<table class="list" id="list">
						<tr>
							<th></th>
							<th>N</th>
							<th>Title</th>
							<th>Publisher</th>
							<th>Published</th>
							<th>ISBN</th>
							<th>ISSN</th>
							<th>DOI</th>
							<th>Volume</th>
							<th>Number</th>
						</tr>
						<c:set var="i" value="${1}" />
						<c:forEach var="result" items="${springerResults}">
							<tr>
								<td><input type="checkbox" name="selectedItems"
									value="${i}" /></td>
								<td><c:out value="${i}" /></td>
								<td><a href="<c:out value='${result.url}'/>"><c:out
											value="${result.title}" /></a></td>
								<td><c:out value="${result.publicationName}" /></td>
								<td><c:out value="${result.publicationDate}" /></td>
								<td><c:out value="${result.isbn}" /></td>
								<td><c:out value="${result.issn}" /></td>
								<td><c:out value="${result.doi}" /></td>
								<td><c:out value="${result.volume}" /></td>
								<td><c:out value="${result.number}" /></td>
							</tr>
							<c:set var="i" value="${i + 1}" />
						</c:forEach>
						<tr>
							<td colspan=10 align="right"><input type="submit"
								id="saveItemsButton" value="Save items" /></td>
						</tr>
					</table>
				</form>
			</div>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${not empty crossrefResults}">
			<br>
			<p align="center">Search results from Crossref:</p>
			<div align="center">
				<form action="save" method="POST">
					<br> <input type="checkbox" onClick="toggle(this)" />&nbsp;&nbsp;Check/Uncheck
					All
					<table class="list" id="list">
						<tr>
							<th></th>
							<th>N</th>
							<th>Title</th>
							<th>Publisher</th>
							<th>Published</th>
							<th>ISBN</th>
							<th>DOI</th>
						</tr>

						<c:set var="i" value="${1}" />
						<c:forEach var="result" items="${crossrefResults}">
							<tr>
								<td><input type="checkbox" name="selectedItems"
									value="${i}" /></td>
								<td><c:out value="${i}" /></td>
								<td><a href="<c:out value='${result.URL}'/>"><c:out
											value="${result.itemTitle}" /></a></td>
								<td><c:out value="${result.publisher}" /></td>
								<td><c:out value="${result.publishDate}" /></td>
								<td><c:out value="${result.isbn}" /></td>
								<td><c:out value="${result.DOI}" /></td>
							</tr>
							<c:set var="i" value="${i + 1}" />
						</c:forEach>
						<tr>
							<td colspan=7 align="right"><input type="submit"
								id="saveItemsButton" value="Save items" /></td>
						</tr>
					</table>
				</form>
			</div>
		</c:when>
	</c:choose>
</body>
</html>