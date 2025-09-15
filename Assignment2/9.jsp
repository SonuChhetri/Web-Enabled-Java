<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html><body>
  <c:set var="items" value="${{'apple','banana','cherry'}}"/>
  <h3>forEach demo</h3>
  <ul>
    <c:forEach var="it" items="${items}">
      <li>${it}</li>
    </c:forEach>
  </ul>

  <h3>choose/when/otherwise demo</h3>
  <c:set var="score" value="75" />
  <c:choose>
    <c:when test="${score >= 90}">Grade A</c:when>
    <c:when test="${score >= 75}">Grade B</c:when>
    <c:otherwise>Grade C</c:otherwise>
  </c:choose>

  <h3>if / out / set / redirect</h3>
  <c:if test="${score >= 50}">
    <p>Pass</p>
  </c:if>
  <c:set var="x" value="${3+4}" />
  <p>x = ${x}</p>
</body></html>
