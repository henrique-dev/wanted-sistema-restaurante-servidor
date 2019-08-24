<%@ attribute name="id" required="false" %>
<%@attribute name="clas" required="false" %>
<%@attribute name="label" required="false" %>
<%@attribute name="icon" required="false" %>
<%@attribute name="link" required="false" %>
<a href="${link}" id="${id}" class="${clas}">
    <span class="icon text-white-50">
        <i class="${icon}"></i>
    </span>
    <span class="text">${label}</span>
</a>