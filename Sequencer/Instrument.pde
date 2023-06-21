class Tri implements Instrument
{
  // create all variables that must be used througout the class
  Oscil Osc;
  ADSR  adsr;
  
  // constructor for this instrument
  Tri(float frequency, float amplitude)
  {    
    // create new instances of any UGen objects as necessary
    Osc = new Oscil( frequency, amplitude, Waves.TRIANGLE );
    adsr = new ADSR( 0.5, 0.01, 0.05, 0.5, 0.5 );
    
    // patch everything together up to the final output
    Osc.patch( adsr );
  }
  
  // every instrument must have a noteOn( float ) method
  void noteOn( float dur )
  {
    // turn on the ADSR
    adsr.noteOn();
    // patch to the output
    adsr.patch( out );
   }
  
  // every instrument must have a noteOff() method
  void noteOff()
  {
    // tell the ADSR to unpatch after the release is finished
    adsr.unpatchAfterRelease( out );
    // call the noteOff 
    adsr.noteOff();
  }
}
