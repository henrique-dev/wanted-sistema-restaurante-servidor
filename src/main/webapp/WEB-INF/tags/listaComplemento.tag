<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="id" required="true" %>
<%@attribute name="name" required="false" %>
<%@attribute name="label" required="false" %>
<%@attribute name="value" required="false" %>
<%@attribute name="data" required="false" type="java.util.ArrayList" %>
<div class="form-group">
    <label for="${id}">${label}</label>
    <select class="form-control" id="${id}" name="${name}">
        <option value="0"></option>
        <c:forEach items="${data}" var="i">
            <option data-id="${i.id}" data-nome="${i.nome}" data-preco="${i.preco}" value="${i.id}">${i.nome}</option>
        </c:forEach>
    </select>
</div>