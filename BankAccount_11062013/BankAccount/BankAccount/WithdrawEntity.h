//
//  WithdrawEntity.h
//  BankAccount
//
//  Created by Truong Tran  The on 6/22/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WithdrawEntity : NSObject

@property(nonatomic, strong) NSString *accountNumber;
@property(nonatomic, strong) NSString *timeStamp;
@property(nonatomic, strong) NSNumber *amount;
@property(nonatomic, strong) NSString * description;
@end
