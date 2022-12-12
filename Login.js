/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

 import React, { useEffect, useState } from 'react';
 import type {Node} from 'react';
import {SafeAreaView, View,Text,TouchableOpacity,TextInput,StyleSheet, NativeModules, Pressable} from 'react-native'
 
 
 // var HelloWorldModule = require('react-native').NativeModules.HelloWorldModule;
 
 
 const Login: () => Node = () => {
   const { LoginModule } = NativeModules
   const [token, setToken] = useState("")
 
   const handleClick = () => {
     const username = "xinya";
     const password = "dsadsadsd"
     LoginModule.login(username, password, (token) => {
       console.log(token)
       setToken(token)
     })
   }
 
   return (
     <SafeAreaView style={styles.container}>
        <Text style={styles.buttonTextStyle}>React Native Page: </Text>
        <View style={styles.loginView}>
            <TextInput
                style={styles.input}
                placeholder="username"
                placeholderTextColor="#ccc"
                autoCapitalize="none"
                returnKeyType="next"
                onChangeText={this.handleEmail}
            />
            <TextInput
                style={styles.input}
                placeholder="password"
                placeholderTextColor="#ccc"
                autoCapitalize="none"
                returnKeyType="next"
                onChangeText={this.handleEmail}
            />
            <Pressable onPress={handleClick} style={styles.buttonStyle}>
                <Text style={styles.buttonTextStyle}>Login</Text>
            </Pressable>
            { token ? <Text style={styles.textStyle}>get token: { token }</Text>: null}
        </View>
     </SafeAreaView>
   );
 };
 
 const styles = StyleSheet.create({
    container: {
        flex: 1,
        borderWidth: 1
    },
    buttonStyle: {
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: 20,
        marginBottom: 20
        
    },
    buttonTextStyle: {
        fontSize: 26
    },
    loginView: {
        flex: 1,
    },
    input:{
        margin:15,
        paddingLeft:8,
        height:40,
        borderColor:'#eeeeee',
        borderWidth:1
      },
      textStyle: {
        borderColor:'#eeeeee',
        borderWidth:1,
        paddingVertical: 20,
        fontSize: 20,
        fontWeight: "600"
      }
 });
 
 export default Login;
 