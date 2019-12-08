class KeyDownManager{
  ArrayList<String> keysThatAreDown = new ArrayList<String>();
  
  void onKeyDown(){
    String _key = "" + key;
    if( !keysThatAreDown.contains(_key) )
      keysThatAreDown.add(_key);
  }
  
  void onKeyUp(){
    String _key = "" + key;
    keysThatAreDown.remove(_key);
  }
  
  boolean isDown(char _key){
    String __key = ""+_key;
    return keysThatAreDown.contains(__key);
  }
  
  void showKeysDown(){
    String str = "";
    for(String s : keysThatAreDown)
      str += s;
    textSize(50);
    fill(0);
    text(str, width/2, height*0.15);
  }
  
}
