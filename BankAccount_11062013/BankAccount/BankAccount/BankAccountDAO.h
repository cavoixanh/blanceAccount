//
//  BankAccountDAO.h
//  BankAccount
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankAccountEntity.h"
#import "WithdrawEntity.h"
#import "TransactionEntity.h"
@interface BankAccountDAO : NSObject

- (BankAccountEntity*) insertAccountToDB:(BankAccountEntity*) entity;
- (BankAccountEntity*) getInformation:(NSString*) accountNumber;
- (TransactionEntity*) deposit:(NSString*) accountNumber withMoney:(NSNumber*) money;
- (BankAccountEntity*) saveTimeStampWhenDepositToDB:(BankAccountEntity*) entity;
- (TransactionEntity*) getTimeStampWhenDeposit:(BankAccountEntity*) entity;
- (BankAccountEntity*) withdraw:(NSString*)accountNumber withMoney:(NSNumber*) moneyWithdraw;
- (TransactionEntity*) saveInforWithdraw:(TransactionEntity*)entity;

@end
