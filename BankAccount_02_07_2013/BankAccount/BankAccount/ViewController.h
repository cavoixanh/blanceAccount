//
//  ViewController.h
//  BankAccount
//
//  Created by Truong Tran  The on 7/2/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BankAccountDAO.h"
#import "BankAccount.h"
@interface ViewController : UIViewController

@property(nonatomic, strong) BankAccountDAO *accountDAO;
@property(nonatomic, strong) BankAccount *accountEntity;

- (BankAccount*) openAccountWithNumber:(NSString *)accNumber;
@end
