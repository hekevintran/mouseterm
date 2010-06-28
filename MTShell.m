#import <Cocoa/Cocoa.h>

#import "MTShell.h"
#import "MouseTerm.h"
#import "Mouse.h"

@implementation NSObject (MTShell)

- (NSValue*) MouseTerm_initVars
{
    NSValue* ptr = [NSValue valueWithPointer: self];
    if ([MouseTerm_ivars objectForKey: ptr] == nil)
    {
        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
        [MouseTerm_ivars setObject: dict forKey: ptr];
        [dict setObject: [NSNumber numberWithInt: NO_MODE]
                 forKey: @"mouseMode"];
        [dict setObject: [NSNumber numberWithBool: NO]
                 forKey: @"appCursorMode"];
        [dict setObject: [NSNumber numberWithBool: NO]
                 forKey: @"isMouseDown"];
    }
    return ptr;
}

- (id) MouseTerm_get: (NSString*) name
{
    NSValue* ptr = [self MouseTerm_initVars];
    return [[MouseTerm_ivars objectForKey: ptr] objectForKey: name];
}

- (void) MouseTerm_set: (NSString*) name value: (id) value
{
    NSValue* ptr = [self MouseTerm_initVars];
    [[MouseTerm_ivars objectForKey: ptr] setObject: value forKey: name];
}

- (void) MouseTerm_setMouseMode: (int) mouseMode
{
	NSValue *ptr = [self MouseTerm_initVars];
	[[MouseTerm_ivars objectForKey: ptr] setObject: [NSNumber numberWithInt:mouseMode] forKey: @"mouseMode"];
}

- (int) MouseTerm_getMouseMode
{
	NSValue *ptr = [self MouseTerm_initVars];
	return [((NSNumber *)[[MouseTerm_ivars objectForKey: ptr] objectForKey: @"mouseMode"]) intValue];
}

- (void) MouseTerm_setAppCursorMode: (BOOL)appCursorMode
{
	NSValue *ptr = [self MouseTerm_initVars];
	[[MouseTerm_ivars objectForKey: ptr] setObject: [NSNumber numberWithBool:appCursorMode] forKey: @"appCursorMode"];	
}

- (BOOL) MouseTerm_getAppCursorMode
{
	NSValue *ptr = [self MouseTerm_initVars];
	return [((NSNumber *)[[MouseTerm_ivars objectForKey: ptr] objectForKey: @"appCursorMode"]) boolValue];	
}


// Deletes instance variables
- (void) MouseTerm_dealloc
{
    [MouseTerm_ivars removeObjectForKey: [NSValue valueWithPointer: self]];

    [self MouseTerm_dealloc];
}

@end