component {
    /**
     * Catch timeout errors at least. Since there will be lots. 
     *
     * @exception 
     * @eventName 
     */
    void function onError(exception, eventName){
        dump(arguments.exception);
        dump(arguments.eventName);
    }    
}