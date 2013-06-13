//
//  BankAccountDAO.h
//  BankAccount
//
//  Created by Truong Tran  The on 6/12/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankAccountEntity.h"
@interface BankAccountDAO : NSObject

- (NSNumber*) getAccount:(NSString*) accountNumber;
@end
