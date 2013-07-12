//
//  BankAccountEntity.h
//  BankAccount
//
//  Created by Truong Tran  The on 7/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccountEntity : NSObject

@property(nonatomic, strong) NSString * accountNumber;
@property(nonatomic, strong) NSNumber *balance;
@property(nonatomic, strong) NSDate   *openTimeStamp;
@end
