//
//  BankAccountDAO.h
//  BankAccount
//
//  Created by Truong Tran  The on 7/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankAccountEntity.h"
@interface BankAccountDAO : NSObject

-(BankAccountEntity*)insertNewAccount:(BankAccountEntity*) entity;
-(BankAccountEntity*)insertAnAccount:(BankAccountEntity*)entity;
-(BankAccountEntity*)getAccountWithAccNumber:(NSString *) accNumber;
@end
