//
//  BankAccountViewController.h
//  BankAccount
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BankAccountDAO.h"
#import "BankAccountEntity.h"

@interface BankAccountViewController : UIViewController

@property(nonatomic, strong) BankAccountDAO *bankAccountDAO;

- (id)initWithDAO:(BankAccountDAO*) daoObject;
- (BankAccountEntity*) getInfo:(NSString*) accountNumber;
- (BankAccountEntity*) CreateNewAccount:(NSString*) accountNumber;
- (BankAccountEntity*) openNewAccounntWithAccountNumber:(NSString*) accountNumber;
- (BankAccountEntity*) deposit:(NSString*) accountNumber withMoney:(NSNumber*) money;
- (BankAccountEntity*) getTimeStampWhenDepositAndSaveToDB:(BankAccountEntity*) entity;
- (BankAccountEntity*) withdraw:(NSString*)accountNumber withMoney:(NSNumber*) moneyWithdraw;
- (WithdrawEntity*) saveInforWithdraw:(BankAccountEntity*)entity;
@end


