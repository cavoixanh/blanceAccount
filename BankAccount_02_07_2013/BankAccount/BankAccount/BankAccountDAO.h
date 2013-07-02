//
//  BankAccountDAO.h
//  BankAccount
//
//  Created by Truong Tran  The on 7/2/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankAccount.h"
@interface BankAccountDAO : NSObject

-(BankAccount*) insertNewAccount:(BankAccount*) entity;
@end
