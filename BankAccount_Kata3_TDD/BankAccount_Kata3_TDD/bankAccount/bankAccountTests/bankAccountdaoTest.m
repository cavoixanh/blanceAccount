//
//  bankAccountdaoTest.m
//  bankAccount
//

#import "Kiwi.h"
#import "bankAccountdao.h"
#import "bankAccountEntity.h"
#import <LocalStorage/LocalStorage.h>
SPEC_BEGIN(bankAccountdaoSpec)
describe(@"bankAccountdao test", ^{
    describe(@"bankAccountDAO ", ^{
        __block DBEnviroment * dbEnvi;
        __block bankAccountdao *dao;
        __block NSString *accountNumber;
        
    beforeAll(^{
        accountNumber = @"1234567890";
        dbEnvi = [[DBEnviroment alloc] init];
        dao = [[bankAccountdao alloc] init];
        dao.dataAccessHelper = dbEnvi.databaseQueue;
        
    });
    
    afterAll(^{
        dbEnvi = nil;
        dao = nil;
    });
        
    context(@"Test Insert Account", ^{
        it(@"insert new Account", ^{
            bankAccountEntity *accountWillInsert = [[bankAccountEntity alloc] init];
            accountWillInsert.accountNumber = accountNumber;
            accountWillInsert.balance = @0;
            accountWillInsert.openTimeStamp = [NSDate date];
            
            NSString *scriptFilePath = [[NSBundle mainBundle] pathForResource:@"CreateDB" ofType:@"sql"];
            [dbEnvi loadScriptFile:scriptFilePath];
            
            bankAccountEntity *newAccount = [dao insertNewAccount:accountWillInsert];
            [newAccount shouldNotBeNil];
        });
        
        it(@"insert Account which nil", ^{
            bankAccountEntity *accountWillInsert;
            
            NSString *scriptFilePath = [[NSBundle mainBundle] pathForResource:@"CreateDB" ofType:@"sql"];
            [dbEnvi loadScriptFile:scriptFilePath];
            
            bankAccountEntity *newAccount = [dao insertNewAccount:accountWillInsert];
            [newAccount shouldBeNil];
        });
    });
        
    context(@"get Account from DB", ^{
        it(@"get Account exist in DB", ^{
            bankAccountEntity *accountNeedGet;
            NSString *scriptFilePath = [[NSBundle mainBundle] pathForResource:@"InsertAcc" ofType:@"sql"];
            [dbEnvi loadScriptFile:scriptFilePath];
            accountNeedGet = [dao getAccount:accountNumber];
            [accountNeedGet shouldNotBeNil];
        });
        
        it(@"get Acc not in DB", ^{
            bankAccountEntity *accountNeedGet;
            NSString *scriptFilePath = [[NSBundle mainBundle] pathForResource:@"InsertAcc" ofType:@"sql"];
            [dbEnvi loadScriptFile:scriptFilePath];
            accountNeedGet = [dao getAccount:@"123"];
            [accountNeedGet shouldBeNil];
        });
    });
        
    context(@"update Account Deposit and Withdraw", ^{
        bankAccountEntity *accountNeedUpdate = [[bankAccountEntity alloc] init];
        accountNeedUpdate.accountNumber = accountNumber;
        accountNeedUpdate.balance = @10;
        
        NSString *scriptFilePath = [[NSBundle mainBundle] pathForResource:@"InsertAcc" ofType:@"sql"];
        [dbEnvi loadScriptFile:scriptFilePath];
        
        accountNeedUpdate = [dao updateDepositAccount:accountNeedUpdate];
        [accountNeedUpdate shouldNotBeNil];
        
        accountNeedUpdate = [dao updateWithdrawAccount:accountNeedUpdate];
        [accountNeedUpdate shouldNotBeNil];
    });
    });
});
SPEC_END
