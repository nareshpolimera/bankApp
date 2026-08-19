public class AccountTriggerHandler {
    public static void beforeInsert(List<Account> newAccounts) {
    }

    public static void beforeUpdate(
        List<Account> newAccounts,
        Map<Id, Account> oldAccountsById
    ) {
        System.debug('TEsting PR');
    }
}
