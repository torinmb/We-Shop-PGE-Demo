

<%@page session="false"
	    import="com.day.cq.wcm.api.WCMMode,
	            com.adobe.cq.mobile.angular.data.util.FrameworkContentExporterUtils" %><%
%><%@include file="/libs/foundation/global.jsp" %><%
%>
<div class="list">

    <a class="item item-button-right" ng-click="updateApp()">
        Update
        <button class="button button-positive">
            <i class="icon ion-ios-cloud-download-outline"></i>
        </button>
    </a>

    <a class="item item-button-right" ng-click="go('/content/phonegap/We-Shop/en/settings', 'Settings')">
        Settings
        <button class="button button-positive">
            <i class="icon ion-ios-gear-outline"></i>
        </button>
    </a>
</div>
