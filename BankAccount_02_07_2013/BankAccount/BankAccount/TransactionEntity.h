//
//  TransactionEntity.h
//  BankAccount
//
//  Created by Truong Tran  The on 7/4/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransactionEntity : NSObject

@property(nonatomic, strong) NSString * accountNumber;
@property(nonatomic, strong) NSNumber * amount;
@property(nonatomic, strong) NSNumber * type;  //1 deposit, -1  withdraw
@property(nonatomic, strong) NSString * description;
@end
