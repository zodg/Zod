/**
 * Created by Gubki on 7/20/2022.
 */

public inherited sharing class Accounts extends fflib_SObjectDomain {

        public Accounts(List<Account> acctRecords){
            super(acctRecords);
        }

    public class Constructor implements fflib_SobjectDomain.IConstructable{
        public fflib_SObjectDomain construct(List<SObject> sObjectList){
            return new Accounts(sObjectList);
        }

    }

    }
