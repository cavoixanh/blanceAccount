//
//  BankAccountViewController.h
//  BankAccount
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BankAccountEntity.h"
#import "TransactionEntity.h"
@interface BankAccountViewController : UIViewController

-(void) openAccountWithAccountNumber:(NSString*) accountNumber;
-(BankAccountEntity*) getAccountWithAccountNumber:(NSString *) accountNumber;
-(TransactionEntity*) DepositMoney:(NSString*) accountNumber : (NSNumber *) money;
-(TransactionEntity*) withdrawMoney:(NSString*) accountNumber :(NSNumber *) money;
-(NSArray*) getListTransactionWithAccountNumber:(NSString *) accountNumber;
-(NSArray*) getListTransactionWithAccountNumber:(NSString *) accountNumber andStart:(NSDate*)startDate end:(NSDate*)endDate;
@end


