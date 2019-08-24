<%@ attribute name="id" required="true" %>
<%@attribute name="name" required="false" %>
<%@attribute name="clas" required="false" %>
<%@attribute name="label" required="false" %>
<%@attribute name="value" required="false" %>
<div class="form-group">
    <label for="nome">${label}</label>
    <input type="number" min="0" step="any" class="form-control ${clas}" id="${id}" name="${name}" value="${value}">
</div>