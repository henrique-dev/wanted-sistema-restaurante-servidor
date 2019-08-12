<%@ attribute name="id" required="true" %>
<%@attribute name="name" required="false" %>
<%@attribute name="clas" required="false" %>
<%@attribute name="label" required="false" %>
<%@attribute name="value" required="false" %>
<%@attribute name="type" required="false" %>
<%@attribute name="icon" required="false" %>
<div class="form-group">
    <label for="${id}">&nbsp;</label>
    <button type="${type}" id="${id}" class="${clas}">
        <span class="icon text-white-50">
            <i class="${icon}"></i>
        </span>
        <span class="text">${label}</span>
    </button>
</div>