//
//  ViewController.h
//  bankAccount
//
//  Created by Truong Tran  The on 7/18/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bankAccountdao.h"
@interface ViewController : UIViewController

@property(nonatomic, strong) bankAccountdao *dao;
- (void)openNewAccount:(NSString *) accNumber;
- (void)getAccountWithAccountNumber:(NSString*) accNumber;
-(void)depositIntoAnAccount:(NSString *) accNumber withMoney:(NSNumber*)moneyWithdraw;
@end
