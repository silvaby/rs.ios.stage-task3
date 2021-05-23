#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray<NSNumber*> *levels = [NSMutableArray new];
    NSMutableArray<NSNumber*> *rotation = [NSMutableArray new];
    NSMutableArray<NSMutableArray*> *result = [NSMutableArray new];

    int count = 0;
    int level = 0;

    for (NSObject *obj in tree) {
        if (rotation.count == 0 || rotation.lastObject.boolValue) {
            if ([obj isKindOfClass: NSNull.class]) {
                [rotation removeLastObject];
                [rotation addObject: @NO];
            } else {
                [levels addObject: [NSNumber numberWithInt: level]];
                [rotation addObject: @YES];
                level++;
            }
        } else {
            if ([obj isKindOfClass: NSNull.class]) {
                while (!rotation.lastObject.boolValue) {
                    [rotation removeLastObject];
                    level--;
                }
                [rotation removeLastObject];
                [rotation addObject:@NO];
            } else {
                [levels addObject: [NSNumber numberWithInt: level]];
                [rotation addObject: @YES];
                level++;
            }
        }
    }

    if (levels.count == 0) { return  @[]; }

    int max = [[levels valueForKeyPath: @"@max.intValue"] intValue];
    
    for (int i = 0; i <= max; i++){
        [result addObject: [NSMutableArray new]];
    }

    for (int i = 0; i < tree.count; i++){
        if (![tree[i] isKindOfClass: NSNull.class]){
            [result[levels[count].intValue] addObject: tree[i]];
            count++;
        }
    }

    return result;
}
