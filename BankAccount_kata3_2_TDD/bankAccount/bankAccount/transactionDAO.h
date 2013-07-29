//
//  transactionDAO.h
//  bankAccount
//
//  Created by Truong Tran  The on 7/18/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalStorage/LocalStorage.h>
#import "transactionEntity.h"
@interface transactionDAO : NSObject

@property(nonatomic, strong) FMDatabaseQueue *dataAccessHelper;


-(transactionEntity *) saveDepositTransaction:(transactionEntity*) entity;
-(transactionEntity *) saveWithdrawTransaction:(transactionEntity*) entity;

-(NSArray *) getListTransaction:(NSString*)accNumber;
-(NSArray *) getListTransactionFromRange:(NSDate*)start endDate:(NSDate*)end FromAccount:(NSString*)accNumber;
-(NSArray *) getListTransactionWithN:(NSString*) accNumber withN:(NSNumber*)number;
@end
