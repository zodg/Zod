/**
 * Created by Gubki on 7/24/2022.
 */

public with sharing class GitHubOAuthCallout {

    public static void CallGitHubOath() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:GitHub_OAuth' + '/users/zodg/repos');
        req.setMethod('GET');
        req.setHeader('Accept', 'application/json');
        req.setHeader('Content-Type', 'application/json');
        Http http = new Http();
        HttpResponse res = http.send(req);
        System.debug(res.getBody());
    }

}