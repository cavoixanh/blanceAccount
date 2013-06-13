//
//  BankAccountTestDAO.m
//  BankAccount
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "Kiwi.h"
#import "BankAccountDAO.h"
#import "BankAccountEntity.h"
#import "BankAccountViewController.h"

SPEC_BEGIN(BankAccountTestDAO){
    describe(@"Bank Account Test", ^{
        __block BankAccountViewController *viewCotroller;
        __block BankAccountDAO    *daoMock;
    
        beforeEach(^{
            daoMock = [BankAccountDAO nullMock];
            viewCotroller = [[BankAccountViewController alloc] initWithDAO:daoMock];
            
        });
        afterEach(^{
            viewCotroller = nil;
            daoMock = nil;
        });
    
        context(@"test init DAO", ^{
        
            it(@"test initwithDAO", ^{
                [[viewCotroller.bankAccountDAO should] equal:daoMock];
            });
            
            it(@"test create new Account to DB", ^{
                
            
            });
        
        });
    });

}
SPEC_END