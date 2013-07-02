//
//  BankAccount.h
//  BankAccount
//
//  Created by Truong Tran  The on 7/2/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject

@property(nonatomic, strong) NSString *accountNumber;
@property(nonatomic, strong) NSNumber *balance;
@property(nonatomic, strong) NSDate   *timeStamp;
@end
