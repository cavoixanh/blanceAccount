//
//  transactionDAO.h
//  bankAccount
//
//  Created by Truong Tran  The on 7/18/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "transactionEntity.h"
@interface transactionDAO : NSObject

-(transactionEntity *) saveDepositTransaction:(transactionEntity*) entity;
-(transactionEntity *) saveWithdrawTransaction:(transactionEntity*) entity;
@end
