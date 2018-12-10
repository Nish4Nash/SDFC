public class DebugClass
{
      public Integer a{get;set;}
      public Integer b{get;set;}
      public Integer c{get;set;}
      
      public DebugClass(){}
      public void deb()
      {
          System.debug(' a:'+a);
          System.debug(' b:'+b);
          
          c= a+b;
             System.debug(' c:'+c);
              
       }
}