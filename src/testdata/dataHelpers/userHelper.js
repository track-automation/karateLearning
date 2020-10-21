function fn(){
    return{
        extractUser: function(){
            var userResponse = karate.call('classpath:src/graphql/create/addUser.feature@createNewUser');
            return userResponse.user[0];
        }
    }
}