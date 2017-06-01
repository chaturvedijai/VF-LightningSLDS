public class LightningPOCClass {
    
    public LightningPOCClass(ApexPages.StandardController controller) {
        countrieLst = new List<SelectOption>();
        countrieLst.add(new SelectOption('','--None--'));
        countrieLst.add(new SelectOption('India','India'));
        countrieLst.add(new SelectOption('China','China'));
        countrieLst.add(new SelectOption('US','US'));
        
        leftselected = new List<String>();
        rightselected = new List<String>();
        leftselected.addAll(originalValues);
    }
    
    public List<SelectOption> countrieLst {get;set;}
    public String selectedCountry{get;set;}
    public string selectedItem{get;set;}
    public string unselectedItem{get;set;}
    
    Set<String> originalValues = new Set<String>{'Sydney','London','Mumbai','Karachi','Auckland','Denmark','Atlanta'};
        
        public List<String> leftselected {get;set;}
    public List<String> rightselected {get;set;}
    
    public PageReference selectclick(){
        system.debug('***inside selectclick selectedItem***'+ selectedItem);
        system.debug('***inside selectclick before leftselected***'+ leftselected);
        rightselected.add(selectedItem);
        for(integer i=0; i<leftselected.size();i++){
            if(leftselected.get(i) == selectedItem){
                leftselected.remove(i);
            }
        }
        system.debug('***inside selectclick after leftselected***'+ leftselected);
        return null;
    }
    
    public PageReference unselectclick(){
        leftselected.add(unselectedItem);
        for(integer i=0; i<rightselected.size();i++){
            if(rightselected.get(i) == unselectedItem){
                rightselected.remove(i);
            }
        }
        return null;
    }
    
    public List<String> getunSelectedValues(){
        List<String> options = new List<String>();
        options.addAll(leftselected);
        options.sort();
        return options;
    }
    
    public List<String> getSelectedValues(){
        //system.debug('***rightvalues***'+ rightvalues);
        List<string> tempList = new List<String>();
        tempList.addAll(rightselected);
        tempList.sort();
        return tempList;
    }
}