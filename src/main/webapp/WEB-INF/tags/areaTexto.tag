<%@ attribute name="id" required="true" %>
<%@attribute name="name" required="false" %>
<%@attribute name="clas" required="false" %>
<%@attribute name="label" required="false" %>
<%@attribute name="value" required="false" %>
<%@attribute name="rows" required="false" rtexprvalue="2" %>
<div class="form-group">
    <label for="nome">${label}</label>
    <textarea class="form-control ${clas}" id="${id}" rows="${rows}" name="${name}">${value}</textarea>
</div>