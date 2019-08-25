<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="id" required="true" %>
<%@attribute name="name" required="false" %>
<%@attribute name="label" required="false" %>
<%@attribute name="value" required="false" %>
<%@attribute name="data" required="false" type="java.util.ArrayList" %>
<%@attribute name="data_to_not_include" required="false" type="java.util.Set" %>
<div class="form-group">
    <label for="${id}">${label}</label>
    <select class="form-control" id="${id}" name="${name}">
        <c:forEach items="${data}" var="i">
            <c:set var="existe" value="false"/>
            <c:forEach items="${data_to_not_include}" var="in">
                <c:if test="${in.id == i.id}">
                    <c:set var="existe" value="true"/>
                </c:if>
            </c:forEach>
            <c:if test="${existe == false}">
                <option data-id="${i.id}" data-nome="${i.descricao}" value="${i.id}">${i.descricao}</option>
            </c:if>            
        </c:forEach>
    </select>
</div>