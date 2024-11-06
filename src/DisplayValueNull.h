#ifndef DisplayValueNull_h
#define DisplayValueNull_h

#include <Arduino.h>  // Include Arduino-specific definitions

class DisplayValueNull {
public:
    DisplayValueNull() {}  // Default constructor
    void init() {}  // No-op
    void clear() {}  // No-op
    void setLabel(const char* value) {}  // No-op
    void setLabel(const __FlashStringHelper* value) {}  // No-op
    void setValue(const char* value) {}  // No-op
    void setValue(int value) {}  // No-op
    void setSuffix(const char* value) {}  // No-op
};

#endif // DisplayValueNull_h
