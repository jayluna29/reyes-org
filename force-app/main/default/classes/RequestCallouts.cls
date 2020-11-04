public class RequestCallouts {
 /* public static HttpResponse makePostCallout(Request__c req) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://10.30.3.85:8081/api/customer');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(MulesoftSendRequest.jsonGen(req));
      	system.debug('request body- ' + request.getBody());
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() == 200) {
            System.debug('Customer Data Sent to SAP: ' +
                response.getStatusCode());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }   */     
}