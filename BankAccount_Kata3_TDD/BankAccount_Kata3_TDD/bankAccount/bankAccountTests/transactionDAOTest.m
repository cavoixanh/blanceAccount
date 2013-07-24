//
//  transactionDAOTest.m
//  bankAccount
//

#import "Kiwi.h"
#import "transactionDAO.h"
#import "transactionEntity.h"
#import <LocalStorage/LocalStorage.h>

SPEC_BEGIN(transactionDAOSpec)
describe(@"transactionDAO test", ^{
    describe(@"", ^{
        __block DBEnviroment * dbEnvi;
        __block transactionDAO *dao;
        __block NSString *accountNumber;
    beforeAll(^{
        dbEnvi = [[DBEnviroment alloc] init];
        dao = [[transactionDAO alloc] init];
        dao.dataAccessHelper = dbEnvi.databaseQueue;
        accountNumber = @"0123456789";
    });
    
    afterAll(^{
        dbEnvi = nil;
        dao = nil;
    });
    
    context(@"insert transaction into DB", ^{
        it(@"insert transaction deposit into DB", ^{
            transactionEntity *tranWillInsert = [[transactionEntity alloc] init];
            tranWillInsert.accNumber = accountNumber;
            tranWillInsert.amount = @20;
            tranWillInsert.time = [NSDate date];
            
            NSString *scriptFilePath = [[NSBundle mainBundle] pathForResource:@"CreateTable" ofType:@"sql"];
            [dbEnvi loadScriptFile:scriptFilePath];
            
            tranWillInsert = [dao saveDepositTransaction:tranWillInsert];
            [transactionEntity shouldNotBeNil];
        });
        
        it(@"insert transaction withdraw into DB", ^{
            transactionEntity *tranWillInsert = [[transactionEntity alloc] init];
            tranWillInsert.accNumber = accountNumber;
            tranWillInsert.amount = @20;
            tranWillInsert.time = [NSDate date];
            
            NSString *scriptFilePath = [[NSBundle mainBundle] pathForResource:@"CreateTable" ofType:@"sql"];
            [dbEnvi loadScriptFile:scriptFilePath];
            
            tranWillInsert = [dao saveWithdrawTransaction:tranWillInsert];
            [transactionEntity shouldNotBeNil];
        });
    });
    
    context(@"get list transaction", ^{
        it(@"with exist accNumber", ^{
            NSString *scriptFilePath = [[NSBundle mainBundle] pathForResource:@"InsertTransaction" ofType:@"sql"];
            [dbEnvi loadScriptFile:scriptFilePath];
            
            NSArray *allTrans = [dao getListTransaction:accountNumber];
            [[theValue(allTrans.count) should] equal:theValue(10)];
            
        });
        
        it(@"with not exist accNumber", ^{
            NSString *scriptFilePath = [[NSBundle mainBundle] pathForResource:@"InsertTransaction" ofType:@"sql"];
            [dbEnvi loadScriptFile:scriptFilePath];
            
            NSArray *allTrans = [dao getListTransaction:@"0000"];
            [[theValue(allTrans.count) should] equal:theValue(0)];
        });
        
        it(@"with many acc", ^{
            NSString *scriptFilePath = [[NSBundle mainBundle] pathForResource:@"InsertTransaction" ofType:@"sql"];
            [dbEnvi loadScriptFile:scriptFilePath];
            
            NSArray *allTrans = [dao getListTransaction:@"1234567890"];
            [[theValue(allTrans.count) should] equal:theValue(1)];
        });
    });
        
    context(@"get list transaction in range", ^{
       it(@"get list transaction in range", ^{
           NSString *startTime = @"2012-01-01 12:12:13";
           NSString *endTime = @"2012-01-02 12:12:12";
           NSDateFormatter *datefomater = [[NSDateFormatter alloc] init];
           [datefomater setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
           NSDate *startDate = [datefomater dateFromString:startTime];
           NSDate *endDate = [datefomater dateFromString:endTime];
           
           NSString *scriptFilePath = [[NSBundle mainBundle] pathForResource:@"InsertTransaction" ofType:@"sql"];
           [dbEnvi loadScriptFile:scriptFilePath];
           
           NSArray *allTrans = [dao getListTransactionFromRange:startDate endDate:endDate FromAccount:accountNumber];
           [allTrans shouldNotBeNil];
           [[theValue(allTrans.count) should] equal:theValue(8)];
       });
    });
    
        
    context(@"get list new transaction ", ^{
        it(@"get list new transaction", ^{
            NSString *scriptFilePath = [[NSBundle mainBundle] pathForResource:@"tran_sc5" ofType:@"sql"];
            [dbEnvi loadScriptFile:scriptFilePath];
            
            NSArray *allTrans = [dao getListTransactionWithN:accountNumber withN:@10];
            [allTrans shouldNotBeNil];
            [[theValue(allTrans.count) should] equal:theValue(10)];
            
            NSArray *allTrans1 = [dao getListTransactionWithN:@"1234567890" withN:@10];
            [allTrans1 shouldNotBeNil];
            [[theValue(allTrans1.count) should] equal:theValue(1)];
        });
    });
    });
    
});
SPEC_END
