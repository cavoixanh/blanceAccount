//
//  BankAccountDAO.h
//  BankAccount
//
//  Created by Truong Tran  The on 7/3/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankAccountEntity.h"
#import "TransactionEntity.h"
@interface BankAccountDAO : NSObject

-(BankAccountEntity*) insertNewAccountToDB:(BankAccountEntity*) entity;
-(BankAccountEntity *) getAccountFromDB:(NSString *) accountNumber;
-(BOOL) updateAccountInDB:(BankAccountEntity*)entity;
-(TransactionEntity *) insertTransactionInDB:(TransactionEntity *) entity;
@end
