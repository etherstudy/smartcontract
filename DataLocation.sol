pragma solidity ^0.4.18;

contract DataLocation {
    uint[] a;
    uint[] b;
    
    function DataLocation() public {
        a.push(1);
        b.push(2);
    }
    
    function getA(uint index) external view returns (uint) {
        return a[index];
    }
    
    function getB(uint index) external view returns (uint) {
        return b[index];
    }
    
    // 참조 : storage variable => local storage variable 
    function storage2localStorageVariable() public returns (string) {
        uint[] storage c = a;
        c[0] = 10;
        if ( a[0] == c[0] )
            return "Reference";
        return "Copy";
    }
    
    function storage2localMemoryVariable() public view returns (string) {
        uint[] memory c = a;
        c[0] = 11;
        if ( a[0] == c[0] )
            return "Reference";
        return "Copy";
    }
    
    // 복사: storage variable => storage variable
    function storage2storage() public {
        b = a;
    }

    // copy : local memory variable => local memory variable
    function localMemory2LocalMemory() public view returns (string) {
        uint[] memory y = a;
        uint[] memory z = y;
        z[0] = 12;
        
        if ( y[0] == z[0] )
            return "Reference";
        return "Copy";
    }
    
    // Error: local memory variable => local storage variable
    function localMemory2LocalStorage() public view returns (string) {
        uint[] memory z = a;
        // uint[] storage d = z;
        z[0] = 0;
    }
    
    //  local memory variable => storage variable
    function localMemory2stateVariable() public returns (string) {
        uint[] memory z = a;
        z[0] = 13;
        b = z;
        
        if ( z[0] == b[0] )
            return "Copy";
        return "Reference";
    }
    
    // local storage variable => local storage variable
    function localStorage2localStorage() public returns (string){
        uint[] storage c = a;
        uint[] storage d = c;
        d[0] = 14;
        
        if ( c[0] == d[0] )
            return "Reference";
        return "Copy";
    }
    
    // copy : local storage variable => local memory variable
    function localStorage2localMemory() public view returns (string){
        uint[] storage d = a;
        uint[] memory x = d;
        x[0] = 15;
        
        if ( x[0] == d[0] )
            return "Reference";
        return "Copy";
    }
    
    // copy : local storage variable => local memory variable
    function localStorage2state() public returns (string){
        uint[] storage d = a;
        d[0] = 16;
        b = d;
        
        return "Copy";
    }
}
