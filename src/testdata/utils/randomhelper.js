function fn() {
    return {
        generateRandomString: function (length){
            var result           = '';
            var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            var charactersLength = characters.length;
            for ( var i = 0; i < length; i++ ) {
               result += characters.charAt(Math.floor(Math.random() * charactersLength));
            }
            return result;
        },
        
        generateRandomGUID: function() {
            function _p8(s) {  
                var p = (Math.random().toString(16)+"000000000").substr(2,8);  
                return s ? "-" + p.substr(0,4) + "-" + p.substr(4,4) : p ;  
             }  
            return _p8() + _p8(true) + _p8(true) + _p8();
        }
    }
}