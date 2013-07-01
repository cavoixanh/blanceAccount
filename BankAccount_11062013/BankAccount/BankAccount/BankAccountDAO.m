//
//  BankAccountDAO.m
//  BankAccount
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "BankAccountDAO.h"
#import "BankAccountEntity.h"
#import "WithdrawEntity.h"
#import "TransactionEntity.h"
@implementation BankAccountDAO

-(BankAccountEntity*) insertAccountToDB:(BankAccountEntity*) entity{
    
    return nil;
}

- (BankAccountEntity*) getInformation:(NSString*) accountNumber{

    return nil;
}

- (TransactionEntity*) deposit:(NSString*) accountNumber withMoney:(NSNumber*) money{

    return nil;
}

- (BankAccountEntity*) saveTimeStampWhenDepositToDB:(BankAccountEntity*) entity{

    return nil;
}

- (TransactionEntity*) getTimeStampWhenDeposit:(BankAccountEntity*) entity{
    
    return nil;
}

- (TransactionEntity*) insertTransactionWithDrawIntoDB:(TransactionEntity*)entity {
    
    return nil;
}

- (TransactionEntity*) saveInforWithdraw:(TransactionEntity*)entity{

    return nil;
}

- (BOOL)updateAccount:(BankAccountEntity*) entity{
    
    return TRUE;
}

- (NSArray*)getTransactionFromDB:(NSNumber*) accountNumber{
    return nil;
}
- (NSArray*)getTransactionInRangeFromDB:(NSNumber*) accountNumber :(NSDate*) startDate :(NSDate *) endDate{
    return nil;
}
- (NSArray*)getNTransactionFromDB:(NSNumber*) accountNumber :(NSNumber*) n{
    return nil;
}
@end
