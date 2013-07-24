//
//  ViewController.h
//  bankAccount
//
//  Created by Truong Tran  The on 7/18/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bankAccountdao.h"
#import "transactionDAO.h"
@interface ViewController : UIViewController

@property(nonatomic, strong) bankAccountdao *dao;
@property(nonatomic, strong) transactionDAO *tranDAO;

- (void)openNewAccount:(NSString *) accNumber;
- (void)getAccountWithAccountNumber:(NSString*) accNumber;
-(void)depositIntoAnAccount:(NSString *) accNumber withMoney:(NSNumber*)moneyWithdraw;
-(void)withdrawFromAnAccount:(NSString*) accNumber withMoney:(NSNumber*) money;
-(void)getListTransaction:(NSString*)accNumber;
-(void)getListTransaction:(NSString *)accNumber start:(NSDate*)start end:(NSDate*)end;
-(void)getListTransaction:(NSString *)accNumber withN:(NSNumber*)number; 
@end
