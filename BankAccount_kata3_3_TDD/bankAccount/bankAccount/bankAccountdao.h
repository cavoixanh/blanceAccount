//
//  bankAccountdao.h
//  bankAccount
//
//  Created by Truong Tran  The on 7/18/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "bankAccountEntity.h"
@interface bankAccountdao : NSObject

-(bankAccountEntity *)insertNewAccount:(bankAccountEntity*) entity;
-(bankAccountEntity *)getAccount:(NSString*) accNumber;
-(bankAccountEntity *)updateDepositAccount:(bankAccountEntity *)entity;
-(bankAccountEntity *)updateWithdrawAccount:(bankAccountEntity *)entity;
@end
