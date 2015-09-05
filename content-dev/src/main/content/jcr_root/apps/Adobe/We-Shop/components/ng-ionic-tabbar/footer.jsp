<%@page session="false"
	    import="com.day.cq.wcm.api.WCMMode,
	            com.adobe.cq.mobile.angular.data.util.FrameworkContentExporterUtils" %><%
%><%@include file="/libs/foundation/global.jsp" %><%
%>
<ion-tabs class="tabs-stable tabs-icon-only">

  <ion-tab title="Home" icon-on="ion-ios-home" icon-off="ion-ios-home-outline" ng-click="go('/content/phonegap/We-Shop/en/home', 'Home')">
    <!-- Tab 1 content -->
  </ion-tab>

  <ion-tab title="Nearby" icon-on="ion-ios-location" icon-off="ion-ios-location-outline" ng-click="go('/content/phonegap/We-Shop/en/nearby', 'Nearby')">
    <!-- Tab 2 content -->
  </ion-tab>

  <ion-tab title="Scanner" icon-on="ion-ios-barcode" icon-off="ion-ios-barcode-outline" ng-click="go('/content/phonegap/We-Shop/en/scanner', 'Scanner')">
    <!-- Tab 3 content -->
  </ion-tab>

</ion-tabs>
