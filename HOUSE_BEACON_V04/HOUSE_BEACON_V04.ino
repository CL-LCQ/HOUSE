
//"RBL_nRF8001.h/spi.h/boards.h" is needed in every new project
#include <SPI.h>
#include <EEPROM.h>
#include <boards.h>
#include <RBL_nRF8001.h>

#include "nfc.h"

/** define a nfc class */
NFC_Module nfc;
String tagID;
String prevTagID;
bool isLEDOn;

int led = 2;

void setup()
{  
  pinMode(led, OUTPUT);
  isLEDOn = true;
  digitalWrite(led, HIGH);
  
  // Default pins set to 9 and 8 for REQN and RDYN
  // Set your REQN and RDYN here before ble_begin() if you need
  //ble_set_pins(3, 2); 
  
    // Set your BLE Shield name here, max. length 10
  ble_set_name("House");
  
  // Init. and start BLE library.
  ble_begin();


  
  // Enable serial debug
  Serial.begin(57600);


    nfc.begin();
  Serial.println("READER DETECTED");
  
  uint32_t versiondata = nfc.get_version();
  if (! versiondata) {
    Serial.print("Didn't find PN53x board");
    
    while (1); // halt
    
  }
  
  // Got ok data, print it out!
  Serial.print("Found chip PN5"); Serial.println((versiondata>>24) & 0xFF, HEX); 
  Serial.print("Firmware ver. "); Serial.print((versiondata>>16) & 0xFF, DEC); 
  Serial.print('.'); Serial.println((versiondata>>8) & 0xFF, DEC);
  
  /** Set normal mode, and disable SAM */
  nfc.SAMConfiguration();

//the led will stay on if the setup fails
  isLEDOn = false;
  digitalWrite(led, LOW);
}

//unsigned char buf[16] = {0};
//unsigned char len = 0;

unsigned char payload[] = "0,100,400//";


void loop()
{
  

  
  byte data0;
  readNFC();
 if ( ble_available() )
  {
    while ( ble_available() ){

//LED function 
      data0 = ble_read();
      if (data0 == 0x01)  // Command is to control digital out pin
        {
           Serial.println("right byte");
            switchLED();
       }

        else if (data0 == 0x02)  // Command is to control digital out pin
        {
           Serial.println("blink pairing");
            blinkLED();
       }
       else if (data0 == 0x03)  // Command is to control digital out pin
        {
           Serial.println("blink pairing");
            resetDevice();
       }

    }
  }

 if(tagID != prevTagID){
  
  int Len = sizeof(tagID);
  //Serial.println(Len);
  unsigned char Filename[Len];
  for (int a=0;a<=Len;a++)
        {
            Filename[a]=tagID[a];
        }

 uint8_t n = Len;
  ble_write_bytes(Filename,n);
 
 
 }
 
ble_do_events();
  
prevTagID= tagID;

delay(10);



      

  

}
void blinkLED(){

 digitalWrite(led, HIGH);
 delay(100);
  digitalWrite(led, LOW);
  delay(100);
   digitalWrite(led, HIGH);
 delay(60);
  digitalWrite(led, LOW);
  delay(60);
     digitalWrite(led, HIGH);
 delay(30);
  digitalWrite(led, LOW);
  delay(30);
  
  }
void switchLED(){
           if(isLEDOn == false){
            
                 isLEDOn = true;
                  digitalWrite(led, HIGH);
                
           }
           else if (isLEDOn == true){
              
                isLEDOn = false;
                digitalWrite(led, LOW);
              
          }
  }

 void resetDevice(){
  
  asm volatile(" jmp 0");
  }

void readNFC(){ 
  
  u8 buf[32],sta;
  sta = nfc.InListPassiveTarget(buf);
  
  if(sta && buf[0] == 4){
  
    int bufLength = int(buf[0]);
    String thisTagID;
    
    for (int i=0; i<bufLength; i++){
      thisTagID += String(buf[i]);
      }

     tagID = thisTagID;

  }
  
}

