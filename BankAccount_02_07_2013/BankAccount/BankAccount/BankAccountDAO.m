//
//  BankAccountDAO.m
//  BankAccount
//
//  Created by Truong Tran  The on 7/3/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "BankAccountDAO.h"

@implementation BankAccountDAO

-(BankAccountEntity*) insertNewAccountToDB:(BankAccountEntity*) entity{
    return nil;
}
-(BankAccountEntity *) getAccountFromDB:(NSString *) accountNumber{
    return nil;
}
-(BOOL) updateAccountInDB:(BankAccountEntity*)entity{
    return YES;
}
-(TransactionEntity *) insertTransactionInDB:(TransactionEntity *) entity{
    return nil;
}
-(NSArray*)getListTransactionWithAcc:(NSString*) accNumber{
    return nil;
}
-(NSArray*)getListTransactionWithAcc:(NSString*) accNumber andStart:(NSDate*)startDate end:(NSDate*)endDate{
    return nil;
}
-(NSArray*)getListTransactionWithAcc:(NSString *)accNumber andN:(NSNumber*)number{
    return nil;
}
@end
