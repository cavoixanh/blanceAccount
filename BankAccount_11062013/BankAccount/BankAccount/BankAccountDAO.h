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
@interface BankAccountDAO : NSObject

- (BankAccountEntity*) insertAccountToDB:(BankAccountEntity*) entity;
- (BankAccountEntity*) getInformation:(NSString*) accountNumber;
- (BankAccountEntity*) deposit:(NSString*) accountNumber withMoney:(NSNumber*) money;
- (BankAccountEntity*) saveTimeStampWhenDepositToDB:(BankAccountEntity*) entity;
- (BankAccountEntity*) getTimeStampWhenDeposit:(BankAccountEntity*) entity;
- (BankAccountEntity*) withdraw:(NSString*)accountNumber withMoney:(NSNumber*) moneyWithdraw;
- (WithdrawEntity*)    saveInforWithdraw:(WithdrawEntity*)entity;
@end
