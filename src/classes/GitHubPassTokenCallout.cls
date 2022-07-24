/**
 * Created by Gubki on 7/24/2022.
 */

public with sharing class GitHubPassTokenCallout {

    public static void CallGitHub() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:GitHub_Authorization_Flow/users/zodg/repos');
        req.setMethod('GET');
        req.setHeader('Accept', 'application/json');
        req.setHeader('Content-Type', 'application/json');
        Http http = new Http();
        HttpResponse res = http.send(req);
        System.debug(res.getBody());
    }

}