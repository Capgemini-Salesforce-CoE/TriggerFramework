/*********************************************************************************
 *** @ClassName         : TriggerUtils
 *** @Author            : marsson
 *** @Created date      : 19/04/2020
 **********************************************************************************/


public with sharing class TriggerUtils{

    /*********************************************************************************
 *** @MethodName        : getChangedObjectsinTriggeronAnyField
 *** @description       : Returns a list of changed objects
 *** @Author            : marsson
 *** @return            : List of SObjects that were actually changed
 *** @Created date      : 19/04/2020

 **********************************************************************************/
    public static List<SObject> getChangedObjectsinTriggerbyFieldApiName(Map<Id,SObject> oldValues,Map<Id,SObject> newValues, List<String> fields){
        Set<SObject> setOfChangedObjects = new Set<SObject>();
        for (Id anId : oldValues.keySet()){
            for(String fiedName :fields){

                if(oldValues.get(anId).get(fiedName) != newValues.get(anId).get(fiedName)){
                    setOfChangedObjects.add(newValues.get(anId));
                    continue;
                }
            }

        }

        return new List<SObject>(setOfChangedObjects);
    }

}