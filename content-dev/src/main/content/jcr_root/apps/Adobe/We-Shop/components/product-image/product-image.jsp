<%--
	ADOBE CONFIDENTIAL
	__________________

	 Copyright 2013 Adobe Systems Incorporated
	 All Rights Reserved.

	NOTICE:  All information contained herein is, and remains
	the property of Adobe Systems Incorporated and its suppliers,
	if any.  The intellectual and technical concepts contained
	herein are proprietary to Adobe Systems Incorporated and its
	suppliers and are protected by trade secret or copyright law.
	Dissemination of this information or reproduction of this material
	is strictly forbidden unless prior written permission is obtained
	from Adobe Systems Incorporated.
--%><%
%><%@ page session="false"
           import="com.day.cq.commons.Doctype,
                   com.day.cq.wcm.foundation.Image,
                   com.day.cq.wcm.foundation.Placeholder,
                   com.day.cq.wcm.api.components.DropTarget,
                   com.adobe.cq.mobile.angular.data.util.FrameworkContentExporterUtils,
                   org.apache.sling.api.resource.Resource,
				   com.day.cq.wcm.api.WCMMode" %><%
%><%@include file="/libs/foundation/global.jsp"%><%
    Image image = new Image(resource);
    image.setIsInUITouchMode(Placeholder.isAuthoringUIModeTouch(slingRequest));

    //drop target css class = dd prefix + name of the drop target in the edit config
    image.addCssClass(DropTarget.CSS_CLASS_PREFIX + "image");
    image.loadStyleData(currentStyle);
    image.setSelector(".img");
    image.setDoctype(Doctype.fromRequest(request));

    if (!currentDesign.equals(resourceDesign)) {
        image.setSuffix(currentDesign.getId());
    }

	String linkPath = image.get(Image.PN_LINK_URL);
	boolean hasLink = (linkPath != null && linkPath.length() > 0);

	boolean appExport = Boolean.parseBoolean(slingRequest.getParameter("appExport"));

    // Determine the top level app resource
    Resource topLevelAppResource = FrameworkContentExporterUtils.getTopLevelAppResource(currentPage.adaptTo(Resource.class));

	String imageSrc = FrameworkContentExporterUtils.getPathToAsset(topLevelAppResource, request.getContextPath() + image.getSrc(), appExport);
%><%
%><c:set var="wcmMode"><%= WCMMode.fromRequest(request) != WCMMode.DISABLED %></c:set><%
%><c:set var="imageHasContent"><%= image.hasContent() %></c:set><%
%><c:set var="imageHasALink"><%= hasLink %></c:set><%
%><c:set var="imageTag"><%= "<img src='" + xssAPI.encodeForHTMLAttr(imageSrc) +
        "' alt='" + xssAPI.encodeForHTMLAttr(image.getAlt()) + "' title='" +
        xssAPI.encodeForHTMLAttr(image.getTitle()) + "' />" %></c:set><%
%>
<c:choose>
    <c:when test="${wcmMode}">
        <c:choose>
            <c:when test="${imageHasALink}">
                <a ng-click="go('<%= request.getContextPath() %><%= xssAPI.getValidHref(linkPath) %>')" x-cq-linkchecker="skip">
                    <% image.draw(out); %>
                </a>
            </c:when>
            <c:otherwise>
                <% image.draw(out); %>
            </c:otherwise>
        </c:choose>
        <cq:text property="jcr:description" placeholder="" tagName="small" escapeXml="true"/>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${imageHasALink}">
                <a ng-click="go('<%= request.getContextPath() %><%= xssAPI.getValidHref(linkPath) %>')" x-cq-linkchecker="skip">
                    ${imageTag}
                </a>
            </c:when>
            <c:otherwise>
                ${imageTag}
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
