//
//  BankAccountViewController.h
//  BankAccount
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BankAccountDAO.h"


@interface BankAccountViewController : UIViewController

@property(nonatomic, strong) BankAccountDAO *bankAccountDAO;

- (id)initWithDAO:(BankAccountDAO*) daoObject;
@end
