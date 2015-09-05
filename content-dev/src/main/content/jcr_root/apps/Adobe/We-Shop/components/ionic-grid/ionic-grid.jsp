<%@ page session="false" %><%
%><%@include file="/libs/foundation/global.jsp"%><%

int rows = properties.get("num-rows", 1);
int col = properties.get("num-columns", 2);
int imageCount = 0;
for (int i = 0; i < rows; i++) {
    %>
    <div class="row">
        <%
		for (int j = 0; j < col; j++) {
            imageCount++;
            String includePath = "product-image" + imageCount;
            %>
            <div class="col">
            <cq:include path="<%= xssAPI.encodeForHTML(includePath) %>" resourceType="Adobe/We-Shop/components/product-image" />
            </div>
            <%
        }
    	%>
    </div>
    <%
}
%>