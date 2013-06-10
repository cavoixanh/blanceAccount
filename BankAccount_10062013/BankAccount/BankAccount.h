//
//  BankAccount.h
//  BankAccount
//
//  Created by Truong Tran  The on 6/10/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject

@property (nonatomic, strong) NSString * accountNumber;
@property (nonatomic) double balance;
@property (nonatomic, strong) NSString * openTimestamp;
@end
