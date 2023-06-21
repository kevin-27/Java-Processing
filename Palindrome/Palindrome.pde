void setup()
{
 String Word = new String("abcdcba");
 println(Word);
 String WordCheck = new String();
 
 for (int i = Word.length() - 1; i >= 0; i--)
 {
   WordCheck += Word.charAt(i);
 }
 println(WordCheck);
 
 if (Word.equals(WordCheck))
   println("True");
 else
   println("False");
}
