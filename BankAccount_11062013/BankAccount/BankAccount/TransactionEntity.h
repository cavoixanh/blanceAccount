//
//  TransactionEntity.h
//  BankAccount
//
//  Created by Truong Tran  The on 6/25/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransactionEntity : NSObject

@property(nonatomic, strong) NSString *accountNumber;
@property(nonatomic, strong) NSString *timeStamp;
@property(nonatomic, strong) NSNumber *amount;
@property(nonatomic, strong) NSString * description;
@property(nonatomic) NSInteger type;
@end
