#include "DisplayValueNull.h"

DisplayValueNull display;

void setup() {
    Serial.begin(115200);
    display.init();
    display.setLabel("Sensor Reading");
    display.setSuffix("%");
    delay(1000);
}

void loop() {
    int sensorValue = analogRead(A0);
    display.setValue(sensorValue);
    delay(1000);
}
