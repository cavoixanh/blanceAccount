//
//  bankAccountdao.m
//  bankAccount
//
//  Created by Truong Tran  The on 7/18/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "bankAccountdao.h"
#import <sqlite3.h>
@implementation bankAccountdao
@synthesize dataAccessHelper,error;
-(bankAccountEntity *)insertNewAccount:(bankAccountEntity*) entity{
    if(!entity)
        return Nil;
    
    __block BOOL val;
    [dataAccessHelper inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
        [dateformat setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        NSString *dateOpended = [dateformat stringFromDate:entity.openTimeStamp];
        
        NSString *stm = [NSString stringWithFormat:@"insert into Account(accountnumber,balance,timeOpened) values('%@', %@, '%@')", entity.accountNumber, entity.balance, dateOpended];
        val = [db executeUpdate:stm];
    }];
    if(val)
        return entity;
    else
        return nil;
}
-(bankAccountEntity *)getAccount:(NSString*) accNumber{
    __block bankAccountEntity *accountWillGet;
    [dataAccessHelper inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSString *stm = [NSString stringWithFormat:@"select * from account where accountnumber = '%@'", accNumber];
        FMResultSet *r = [db executeQuery:stm];
        if ([r next]) {
            accountWillGet = [[bankAccountEntity alloc] init];
            accountWillGet.accountNumber = [r objectForColumnName:@"accountnumber"];
            accountWillGet.balance = [r objectForColumnName:@"balance"];
            accountWillGet.openTimeStamp = [r objectForColumnName:@"timeopened"];
            error = nil;
        } else {
            error = [NSError errorWithDomain:@"GetAccountError" code:0 userInfo:nil];
        }
    }];
    if(!accountWillGet)
        return Nil;
    
    return accountWillGet;
}
-(bankAccountEntity *)updateDepositAccount:(bankAccountEntity *)entity{
    if(!entity)
        return nil;
    
    __block BOOL val;
    [dataAccessHelper inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSString *stm = [NSString stringWithFormat:@"update account set balance = %@ where accountnumber = '%@'", entity.balance, entity.accountNumber];
        val = [db executeUpdate:stm];
    }];
    if(val)
        return entity;
    else
        return Nil;
}
-(bankAccountEntity *)updateWithdrawAccount:(bankAccountEntity *)entity{
    if(!entity)
        return nil;
    
    __block BOOL val;
    [dataAccessHelper inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSString *stm = [NSString stringWithFormat:@"update account set balance = %@ where accountnumber = '%@'", entity.balance, entity.accountNumber];
        val = [db executeUpdate:stm];
    }];
    if(val)
        return entity;
    else
        return Nil;
}
@end
