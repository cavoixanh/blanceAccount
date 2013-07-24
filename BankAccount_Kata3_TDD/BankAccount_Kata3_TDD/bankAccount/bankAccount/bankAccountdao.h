//
//  bankAccountdao.h
//  bankAccount
//
//  Created by Truong Tran  The on 7/18/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "bankAccountEntity.h"
#import <LocalStorage/LocalStorage.h>
@interface bankAccountdao : NSObject

@property(nonatomic, strong) FMDatabaseQueue *dataAccessHelper;
@property(nonatomic, strong) NSError *error;

-(bankAccountEntity *)insertNewAccount:(bankAccountEntity*) entity;
-(bankAccountEntity *)getAccount:(NSString*) accNumber;
-(bankAccountEntity *)updateDepositAccount:(bankAccountEntity *)entity;
-(bankAccountEntity *)updateWithdrawAccount:(bankAccountEntity *)entity;
@end
