//
//  SingleLinkedListTest.m
//  SingleLinkedList
//

#import "Kiwi.h"
#import "SingleLinkedList.h"

SPEC_BEGIN(SingleLinkedListSpec)
describe(@"SingleLinkedList test", ^{
    
    __block SingleLinkedList *singleLinkedList;
    beforeAll(^{
        singleLinkedList = [[SingleLinkedList alloc] init];
    });
    
    afterAll(^{
        [singleLinkedList.array removeAllObjects];
        singleLinkedList = nil;
    });
    
    context(@"test link list", ^{
        it(@"init SingleLinkedList", ^{
            NSInteger count = [singleLinkedList.array count];
            [[theValue(count) should] equal:theValue(0)];
        });
        
        it(@"test size LinkedList", ^{
            [singleLinkedList.array addObject:@0];
            [singleLinkedList.array addObject:@1];
            [singleLinkedList.array addObject:@2];
            NSInteger count = [singleLinkedList getSize];
            [[theValue(count) should] equal:theValue(3)];
        });
        
        
    });
    context(@"", ^{
        it(@"test insert after", ^{
            singleLinkedList = [[SingleLinkedList alloc] init];
            [singleLinkedList.array addObject:@0];
            [singleLinkedList.array addObject:@1];
            [singleLinkedList.array addObject:@2];
            [singleLinkedList.array addObject:@3];
            
            [singleLinkedList insertAfter:2 Object:@9];
            NSInteger count = [singleLinkedList getSize];
            [[theValue(count) should] equal:theValue(5)];
            NSNumber *number = [singleLinkedList.array objectAtIndex:2];
            [[theValue([number integerValue]) should] equal:theValue(9)];
        });
    });
    context(@"", ^{
       it(@"delete node index", ^{
           singleLinkedList = [[SingleLinkedList alloc] init];
           [singleLinkedList.array addObject:@0];
           [singleLinkedList.array addObject:@1];
           [singleLinkedList.array addObject:@2];
           [singleLinkedList.array addObject:@3];
           
           [singleLinkedList deleteNode:2];
           [[theValue([singleLinkedList getSize]) should] equal:theValue(3)];
           
       });
    });
    context(@"", ^{
        it(@"get first and last node", ^{
            singleLinkedList = [[SingleLinkedList alloc] init];
            [singleLinkedList.array addObject:@0];
            [singleLinkedList.array addObject:@1];
            [singleLinkedList.array addObject:@2];
            [singleLinkedList.array addObject:@3];
            
            NSNumber *head =  [singleLinkedList first];
            NSNumber *last =  [singleLinkedList last];
            [[theValue(head.integerValue) should] equal:theValue(0)];
            [[theValue(last.integerValue) should] equal:theValue(3)];
        });
    });
    
    context(@"", ^{
        singleLinkedList = [[SingleLinkedList alloc] init];
        [singleLinkedList.array addObject:@0];
        [singleLinkedList.array addObject:@1];
        [singleLinkedList.array addObject:@2];
        [singleLinkedList.array addObject:@3];
       it(@"get before index", ^{
           NSNumber *before = [singleLinkedList before:2];
           [[theValue(before.integerValue) should] equal:theValue(1)];
//           before = [singleLinkedList before:0];
//           [before shouldBeNil];
       });
        it(@"get after index", ^{
            NSNumber *after = [singleLinkedList after:2];
            [[theValue(after.integerValue) should] equal:theValue(3)];
//            after = [singleLinkedList after:3];
//            [after shouldBeNil];
        });
        
    });
    
    
    context(@"", ^{
        singleLinkedList = [[SingleLinkedList alloc] init];
        [singleLinkedList.array addObject:@0];
        [singleLinkedList.array addObject:@1];
        [singleLinkedList.array addObject:@2];
        [singleLinkedList.array addObject:@5];
       it(@"find object", ^{
          NSInteger index =  [singleLinkedList findObject:@2];
           [[theValue(index) should] equal:theValue(2)];
           index = [singleLinkedList findObject:@6];
           [[theValue(index) should] equal:theValue(-1)];
       });
        
        it(@"insert object last", ^{
            [singleLinkedList append:@10];
            NSNumber *number = [singleLinkedList.array lastObject];
            [[theValue([singleLinkedList getSize]) should] equal:theValue(5)];
            [[theValue(number.integerValue) should] equal:theValue(10)];
        });
        
        it(@"insret object first", ^{
            [singleLinkedList insertFirst:@100];
            NSNumber *number = [singleLinkedList.array objectAtIndex:0];
            [[theValue([singleLinkedList getSize]) should] equal:theValue(6)];
            [[theValue(number.integerValue) should] equal:theValue(100)];
        });
    });
});
SPEC_END
