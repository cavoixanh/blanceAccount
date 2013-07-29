//
//  transactionEntity.h
//  bankAccount
//
//  Created by Truong Tran  The on 7/18/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface transactionEntity : NSObject

@property(nonatomic, strong) NSString *accNumber;
@property(nonatomic, strong) NSNumber *amount;
@property(nonatomic, strong) NSNumber *type ; // 1 withdraw -1 deposit
@property(nonatomic, strong) NSString *description;
@property(nonatomic, strong) NSDate   * time;
@end
