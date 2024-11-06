#ifndef DisplayValueNull_h
#define DisplayValueNull_h

#include "DisplayValueCommon.h"

class DisplayValueNull : public DisplayValueCommon {
public:
    DisplayValueNull() {}  // Default constructor
    void init() override {}  // No-op
    void clear() override {}  // No-op
    void setLabel(const char* value) override {}  // No-op
    void setLabel(const __FlashStringHelper* value) override {}  // No-op
    void setValue(const char* value) override {}  // No-op
    void setValue(int value) override {}  // No-op
    void setSuffix(const char* value) override {}  // No-op
};

#endif // DisplayValueNull_h
