trigger AccountIndustryTrigger on Account (before insert, before update) {
    AccountTriggerHandler.handleBeforeSave(Trigger.new);
}
