@IsTest
private class AccountTriggerTest {
    @IsTest
    static void handlesBulkInsertAndUpdate() {
        List<Account> accounts = new List<Account>();
        for (Integer index = 0; index < 200; index++) {
            accounts.add(new Account(Name = 'Test Account ' + index));
        }

        Test.startTest();
        insert accounts;

        for (Account account : accounts) {
            account.Name += ' Updated';
        }
        update accounts;
        Test.stopTest();

        List<Account> savedAccounts = [
            SELECT Name
            FROM Account
            WHERE Id IN :accounts
        ];
        System.assertEquals(200, savedAccounts.size());
        for (Account account : savedAccounts) {
            System.assert(account.Name.endsWith(' Updated'));
        }
    }
}
