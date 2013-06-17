//
//  BankAccountDAO.h
//  BankAccount
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankAccountEntity.h"
@interface BankAccountDAO : NSObject

-(BankAccountEntity*) insertAccountToDB:(BankAccountEntity*) entity;
-(BankAccountEntity*) getInformation:(NSString*) accountNumber;
@end
