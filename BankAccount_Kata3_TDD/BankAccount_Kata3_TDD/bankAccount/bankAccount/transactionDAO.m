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
@synthesize dataAccessHelper;
-(transactionEntity *) saveDepositTransaction:(transactionEntity*) entity{
    __block BOOL val;
    [dataAccessHelper inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
        [dateformat setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        NSString *dateOpended = [dateformat stringFromDate:entity.time];
        
        NSString *stm = [NSString stringWithFormat:@"insert into tran(accountnumber,amount,timestamp) values('%@', %@, '%@')", entity.accNumber, entity.amount, dateOpended];
        val = [db executeUpdate:stm];
    }];
    if(val)
        return entity;
    else
        return nil;
}
-(transactionEntity *) saveWithdrawTransaction:(transactionEntity*) entity{
    return nil;
}

- (transactionEntity *)transactionParser:(FMResultSet *)r {
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    transactionEntity *tran = [[transactionEntity alloc] init];
    tran.accNumber = [r objectForColumnName:@"accountnumber"];
    tran.amount = [r objectForColumnName:@"amount"];
    tran.description = [r objectForColumnName:@"description"];
    tran.time = [dateformat dateFromString:[r objectForColumnName:@"timestamp"]];
    return tran;
}

-(NSArray *) getListTransaction:(NSString*)accNumber{
    __block NSMutableArray *result;
    [dataAccessHelper inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSString *stm = [NSString stringWithFormat:@"select * from tran where accountnumber = '%@'", accNumber];
        FMResultSet *r = [db executeQuery:stm];
        result = [[NSMutableArray alloc] init];
        while ([r next]) {
            transactionEntity *tran;
            tran = [self transactionParser:r];
            [result addObject:tran];
        }
        
    }];
    return result;}
-(NSArray *) getListTransactionFromRange:(NSDate*)start endDate:(NSDate*)end FromAccount:(NSString*)accNumber{
    __block NSMutableArray *result;
    [dataAccessHelper inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSDateFormatter *datefomater = [[NSDateFormatter alloc] init];
        [datefomater setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        NSString *startTime = [datefomater stringFromDate:start];
        NSString *entime = [datefomater stringFromDate:end];
        NSString *stm = [NSString stringWithFormat:@"select * from tran where accountnumber = '%@' and timestamp > '%@' and timestamp < '%@'", accNumber, startTime, entime];
        assert([db validateSQL:stm error:nil]);
        FMResultSet *r = [db executeQuery:stm];
        result = [[NSMutableArray alloc] init];
        while ([r next]) {
            transactionEntity *tran;
            tran = [self transactionParser:r];
            [result addObject:tran];
        }
        
    }];
    return result;
}
-(NSArray *) getListTransactionWithN:(NSString*) accNumber withN:(NSNumber*)number{
    __block NSMutableArray *result;
    [dataAccessHelper inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSString *stm = [NSString stringWithFormat:@"select * from tran where accountnumber = '%@' order by timestamp desc limit %@ ", accNumber, number];
        assert([db validateSQL:stm error:nil]);
        FMResultSet *r = [db executeQuery:stm];
        result = [[NSMutableArray alloc] init];
        while ([r next]) {
            transactionEntity *tran;
            tran = [self transactionParser:r];
            [result addObject:tran];
        }
        
    }];
    return result;
}
@end
