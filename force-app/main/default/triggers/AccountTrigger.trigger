trigger AccountTrigger on Account(before insert, before update) {
    if (Trigger.isInsert) {
        AccountTriggerHandler.beforeInsert(Trigger.new);
    } else if (Trigger.isUpdate) {
        AccountTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
    }
}
