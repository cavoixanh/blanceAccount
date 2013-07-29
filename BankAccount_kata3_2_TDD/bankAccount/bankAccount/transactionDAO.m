//
//  transactionDAO.m
//  bankAccount
//
//  Created by Truong Tran  The on 7/18/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "transactionDAO.h"
#import "transactionEntity.h"
@implementation transactionDAO

-(transactionEntity *) saveDepositTransaction:(transactionEntity*) entity{
    return nil;
}
-(transactionEntity *) saveWithdrawTransaction:(transactionEntity*) entity{
    return nil;
}
-(NSArray *) getListTransaction:(NSString*)accNumber{
    return nil;
}
-(NSArray *) getListTransactionFromRange:(NSDate*)start endDate:(NSDate*)end FromAccount:(NSString*)accNumber{
    return nil;
}
-(NSArray *) getListTransactionWithN:(NSString*) accNumber withN:(NSNumber*)number{
    return nil;
}
@end
