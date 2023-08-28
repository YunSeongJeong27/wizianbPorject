<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.wizian.admission.wizianb.dto.UserAccountDto" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
    String loginEmail = "";
    String id = "";

    if (principal instanceof UserAccountDto) {
        loginEmail = ((UserAccountDto)principal).getMember().getLoginId();
        id = ((UserAccountDto)principal).getMember().getMemId();

        pageContext.setAttribute("loginEmail", loginEmail);
        pageContext.setAttribute("id", id);

    }

%>