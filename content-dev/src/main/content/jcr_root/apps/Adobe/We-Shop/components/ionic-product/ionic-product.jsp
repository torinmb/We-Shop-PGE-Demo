<%@ page session="false" %><%
%><%@include file="/libs/foundation/global.jsp"%><%
    String title = properties.get("title", "Title");
	String description = properties.get("description", "Description");
	String price = properties.get("price", "Price");
	int imgCount = properties.get("num-images", 1);
%>
<ion-content padding="true" class="has-header" style="position: relative;">
    <div class="list card">
        <div class="item item-body">
            <div ng-controller="SlideController">

                    <ion-slide-box active-slide="myActiveSlide" show-pager="true" does-continue="true">
                    <%
                    for (int i = 0; i < imgCount; i++) {
                        String includePath = "product-image" + i;
                        %>
                        <ion-slide>
                            <cq:include path="<%= xssAPI.encodeForHTML(includePath) %>" resourceType="mobileapps/components/image" />
                        </ion-slide>
                        <%
                    }
                    %>
                    </ion-slide-box>

            </div>
            <h2><%= xssAPI.encodeForHTML(title) %></h2>
            <h4><%= xssAPI.encodeForHTML(description) %></h4>
            <p><%= xssAPI.encodeForHTML(price) %></p>

        </div>
        <div class="item item-divider item-button-right">
            Checkout
            <button class="button button-light button-icon button-small icon ion-ios-cart-outline"></button>
        </div>
    </div>
</ion-content>