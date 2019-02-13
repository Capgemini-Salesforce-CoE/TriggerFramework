/**
 * Created by marcelowork on 13/02/19.
 */

public with sharing class TriggerHandlerHelper {
/*
This method will only be tested if a test actually passes the context.
No auto covery for this :(
 */
    public static String createContextString(){
        String timming='before';
        String operation = 'insert';

        if(Trigger.isAfter){
            timming='after';
        }

        if(Trigger.isUpdate){
            operation='update';
        }

        if(Trigger.isUndelete){
            operation='undelete';
        }
        return timming + ' '+operation;

    }

    public static final Map <String, TriggerHandler.TriggerContext> CONTEXTBYCONTEXTNAME = new Map<String,TriggerHandler.TriggerContext>{
            'before insert'=>TriggerHandler.TriggerContext.BEFORE_INSERT,
            'before update'=>TriggerHandler.TriggerContext.BEFORE_UPDATE,
            'before delete'=>TriggerHandler.TriggerContext.BEFORE_DELETE,
            'after insert'=>TriggerHandler.TriggerContext.AFTER_INSERT,
            'after update'=>TriggerHandler.TriggerContext.AFTER_UPDATE,
            'after delete'=>TriggerHandler.TriggerContext.AFTER_DELETE,
            'after undelete'=>TriggerHandler.TriggerContext.AFTER_UNDELETE
    };





}