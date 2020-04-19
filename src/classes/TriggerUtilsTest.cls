/*********************************************************************************
 *** @ClassName         : TriggerUtilstest
 *** @Author        : marsson
 *** @Created date      : 19/04/2020
 **********************************************************************************/
@IsTest
public with sharing class TriggerUtilsTest {

    @IsTest
    public static void testEqualObjects(){
        List<Contact> contactList = new List<Contact>();
        Map<Id,SObject> initial = new Map<Id,SObject>();
        Map<Id,SObject> finalobj = new Map<Id,SObject>();

        for(Integer i=0; i<10; i++){
            contactList.add(new Contact(LastName='Test', FirstName ='Name '+i));
        }
        insert contactList;

        for(Integer i=0; i<5; i++){
            Integer inteiro =1;
            Id anId='0030p000003knt7AA'+String.valueOf(i);
            initial.put(anId,contactList[i]);
            finalobj.put(anId,contactList[9-i]);
            inteiro++;

        }
        List<SObject> result;
        Test.startTest();
        result= TriggerUtils.getChangedObjectsinTriggerbyFieldApiName(initial,finalobj,new List<String> {'LastName'});
        Test.stopTest();

        System.assertEquals(result.size(),0);



    }

    @IsTest
    public static void testNotEqualObjects(){
        List<Contact> contactList = new List<Contact>();
        Map<Id,SObject> initial = new Map<Id,SObject>();
        Map<Id,SObject> finalobj = new Map<Id,SObject>();

        for(Integer i=0; i<10; i++){
            contactList.add(new Contact(LastName='Test', FirstName ='Name '+i));
        }
        insert contactList;

        for(Integer i=0; i<5; i++){
            Integer inteiro =1;
            Id anId='0030p000003knt7AA'+String.valueOf(i);
            initial.put(anId,contactList[i]);
            finalobj.put(anId,contactList[9-i]);
            inteiro++;

        }
        List<SObject> result;
        Test.startTest();
        result= TriggerUtils.getChangedObjectsinTriggerbyFieldApiName(initial,finalobj,new List<String> {'LastName','FirstName'});
        Test.stopTest();

        System.assertNotEquals(result.size(),0);



    }

    @IsTest
    public static void testERROR(){
        List<Contact> contactList = new List<Contact>();
        Map<Id,SObject> initial = new Map<Id,SObject>();
        Map<Id,SObject> finalobj = new Map<Id,SObject>();

        for(Integer i=0; i<10; i++){
            contactList.add(new Contact(LastName='Test', FirstName ='Name '+i));
        }
        insert contactList;

        for(Integer i=0; i<5; i++){
            Integer inteiro =1;
            Id anId='0030p000003knt7AA'+String.valueOf(i);
            initial.put(anId,contactList[i]);
            finalobj.put(anId,contactList[9-i]);
            inteiro++;

        }
        Integer flag=0;
        List<SObject> result;
        Test.startTest();
        try {
            result = TriggerUtils.getChangedObjectsinTriggerbyFieldApiName(initial, finalobj, new List<String>{
                    'LastName', 'FirstName', 'wkydgiygfq'
            });
        }catch(System.SObjectException e){
            flag =1;
        }
        Test.stopTest();

        System.assertEquals(flag,1);
    }


}
