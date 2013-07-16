//
//  TransactionDAO.h
//  BankAccount
//
//  Created by Truong Tran  The on 7/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransactionEntity.h"
#import "BankAccountEntity.h"
@interface TransactionDAO : NSObject

-(TransactionEntity*)depositMoneyIntoAccount:(BankAccountEntity*) entity;
-(TransactionEntity*)withdrawMoneyFromAccount:(BankAccountEntity*)entity;
-(BOOL)saveDepositTransaction:(TransactionEntity*)entity;
-(BOOL)saveWithdrawTransaction:(TransactionEntity*)entity;
-(NSArray*)getTransactionsOccurred:(NSString*) accNumber;
-(NSArray*)getTransactionsFromRanger:(NSString *)accNumber startDate:(NSDate*)startDate endDate:(NSDate*)stopDate;
-(NSArray*)getTransactionsWithN:(NSString*) accNumber withN:(NSNumber*)number;
@end
