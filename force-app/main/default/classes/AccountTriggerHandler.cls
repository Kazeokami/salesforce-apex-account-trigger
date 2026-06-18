public class AccountTriggerHandler {
    public static void handleBeforeSave(List<Account> accounts) {
        for (Account a : accounts) {
            if (String.isBlank(a.Industry)) {
                a.Description = 'Industry missing - please review';
            }
        }
    }
}
