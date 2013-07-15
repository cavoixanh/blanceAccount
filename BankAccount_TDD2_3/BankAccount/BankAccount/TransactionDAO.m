//
//  TransactionDAO.m
//  BankAccount
//
//  Created by Truong Tran  The on 7/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "TransactionDAO.h"

@implementation TransactionDAO

-(TransactionEntity*)depositMoneyIntoAccount:(BankAccountEntity*)entity{
    return nil;
}
-(TransactionEntity*)withdrawMoneyFromAccount:(BankAccountEntity*)entity{
    return nil;
}
-(BOOL)saveDepositTransaction:(TransactionEntity*)entity{
    return YES;
}
-(BOOL)saveWithdrawTransaction:(TransactionEntity*)entity{
    return YES;
}
@end
