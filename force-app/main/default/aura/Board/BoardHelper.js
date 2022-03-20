({
    getWords : function(count) {
        if(count > 100)return;
        let wordsArray = ['ukicxka', 'fomfvac', 'wkfpzhk', 'aswfvud', 'lltbsfk', 'qghemwc', 
                          'vqdevqq', 'zmchzjm', 'khybsly', 'xeftaua', 'khqenxt', 'vxgvsgn', 
                          'jlvzmwj', 'lzcqnto', 'ofwmcqx', 'vuwapoz', 'hdfvmld', 'sjodbsi', 
                          'txmqzta', 'fqaugae', 'ogwwkfm', 'iqnswcv', 'wdwreye', 'nydnrrh', 
                          'lxhqlrg', 'nqepgyu', 'jsehhdp', 'ymspsri', 'dbpwjcp', 'iiakpdt', 
                          'ajsaltm', 'bikusti', 'whhzhay', 'jjuxpzf', 'ltsooxp', 'cpfesnb', 
                          'rqbjuix', 'tpyneuu', 'xkkngko', 'ttvuleg', 'edssxlt', 'fupcaep', 
                          'xcvpiek', 'ifbvlcr', 'qvvefzy', 'mvvkmlt', 'sshryki', 'ohsgvtx', 
                          'rcyaknr', 'wimkixu', 'tegszvz', 'aytwenl', 'rrusocw', 'fzaledo', 
                          'etrsclj', 'sltloga', 'ifiazuy', 'owufkps', 'wuphhuo', 'kgqdhwa', 
                          'xqketdh', 'yqxhgfw', 'josecul', 'isoonwz', 'irkosdn', 'pkkbszn', 
                          'nxxqeec', 'giujwtt', 'usqdvhf', 'igxdpzm', 'mlhqzzg', 'erooktf', 
                          'wjhlzev', 'gyhpinh', 'rhgdwtj', 'vjajzel', 'xfeowrw', 'nasoecg', 
                          'wctltmu', 'pojsezt', 'weotxyv', 'fboibqn', 'xmseoeb', 'xdewxxr', 
                          'ytfsmeq', 'stqvggz', 'klnjswt', 'ekfkopw', 'gmzyvbo', 'qzynikl', 
                          'miybrke', 'mzzxwex', 'qljgvkx', 'sbatkcf', 'xybrrtw', 'lvkpkio', 
                          'fuuxbwy', 'lnzusfq', 'mimmkff', 'ypqmkyw'];
        // Randomize Array
        this.randomizeArray(wordsArray);
        return wordsArray.slice(0, count);
    },
    randomizeArray : function (arr) {
        for (var i = arr.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            const temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
    },
    getWinWord : function(arr){
        const randomWord = arr[Math.floor(Math.random()*arr.length)];
        return randomWord;
    },
    disableBoard : function(component){
        component.set('v.boardDisabled', true);
    },
    enableBoard : function(component){
        component.set('v.boardDisabled', false);
    },
    resetBoard : function(component){
        this.enableBoard(component);

        // resetting the counter
        component.set('v.clickCount', 0);

        // reset the result
        component.set('v.result', "");
    },
    
    fireResultEvent : function(resultValue){
        let appevent = $A.get("e.c:ResultApplicationEvent");
        appevent.setParam({result : resultValue});
        appevent.fire();
    }
})
