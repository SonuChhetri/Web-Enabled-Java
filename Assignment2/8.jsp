<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><body>
  <c:set var="s" value=" HelloWorld "/>
  <p>contains 'World'? ${fn:contains(s,'World')}</p>
  <p>startsWith ' H'? ${fn:startsWith(s,' H')}</p>
  <p>trim: '${fn:trim(s)}'</p>
  <p>length: ${fn:length(s)}</p>

  <c:set var="csv" value="a,b,c"/>
  <p>split and join: ${fn:split(csv,',')[1]}</p> <!-- prints 'b' -->
</body></html>
