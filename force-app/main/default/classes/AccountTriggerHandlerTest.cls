@isTest
private class AccountTriggerHandlerTest {
    @isTest
    static void blankIndustryGetsDescription() {
        // Arrange
        List<Account> testAccounts = new List<Account>{
            new Account(Name = 'Blank Co'),
            new Account(Name = 'Filled Co', Industry = 'Technology')
        };
        // Act
        Test.startTest();
        insert testAccounts;
        Test.stopTest();
        // Assert
        Account blankCo  = [SELECT Description FROM Account WHERE Name = 'Blank Co' LIMIT 1];
        Account filledCo = [SELECT Description FROM Account WHERE Name = 'Filled Co' LIMIT 1];
        Assert.areEqual('OUTRA COISA PARA TESTE', blankCo.Description, 'Blank-industry account should get the description');
        Assert.areEqual(null, filledCo.Description, 'Filled-industry account should be left untouched');
    }
}
