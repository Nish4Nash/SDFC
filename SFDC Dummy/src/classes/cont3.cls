public with sharing class cont3 {


    public Integer x{get;set;}
        public Integer c{get;set;}
    public cont3(cont1 controller) {
    
    }
      public PageReference checking() {
        c=x+10;
        return null;
    }

}