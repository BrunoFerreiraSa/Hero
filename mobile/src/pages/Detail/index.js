import React from 'react';
import {Feather} from '@expo/vector-icons'
import {useNavigation, useRoute} from '@react-navigation/native'
import { View, Image, Text, TouchableOpacity, Linking } from 'react-native';
import * as MailComposer from 'expo-mail-composer'


import imgLogo from '../../assets/logo.png';

import style from './styles';

export default function Detail(){

    const navigator = useNavigation();
    const route = useRoute();

    const incident = route.params.incident;
    const message = `Olá ${incident.name}, estou entrando em contato pois gostaria de no caso "${incident.title}" com o valor de ${Intl.NumberFormat('pt-BR', {style: 'currency', currency: 'BRL'}).format(incident.value)}`

    function navigateBack(){
        navigator.goBack();
    }

    function sendMail(){
        MailComposer.composeAsync({
            subject: `herói do caso: ${incident.title}`,
            recipients: [incident.email],
            body: message,
        })
    }

    function sendWhatsApp(){
        Linking.openURL(`whatsapp://send?phone=${incident.whatsapp}&text=${message}`)
    }

    return (
        <View style={style.container}>
            <View style={style.header}>
                <Image source={imgLogo} />                
            

                <TouchableOpacity style={style.detailButton} onPress={navigateBack}>                
                    <Feather name="arrow-left" size={28} color="#e82041"></Feather>
                </TouchableOpacity> 
            </View>       

           
            <View style={style.incidents}>
                <Text style={style.incidentsProperty, {marginTop: 0}}>ONG:</Text>
                <Text style={style.incidentsValue}>{incident.name} de {incident.city}/{incident.uf}</Text>

                <Text style={style.incidentsProperty}>CASO:</Text>
                <Text style={style.incidentsValue}>{incident.title}</Text>

                <Text style={style.incidentsProperty}>VALOR:</Text>
                <Text style={style.incidentsValue}>{Intl.NumberFormat('pt-BR', {style: 'currency', currency: 'BRL'}).format(incident.value)}</Text>                        
            </View>

            <View style={style.contactBox}>
                <Text style={style.heroTitle}>Salve o dia</Text>  
                <Text style={style.heroTitle}>Seja o heroi desse caso.</Text>   
                <Text style={style.heroDescription}>Entre em contato:</Text>

                <View style={style.actions}>
                    <TouchableOpacity style={style.action} onPress={sendWhatsApp}>
                        <Text style={style.actionText}>WhatsApp</Text>                       
                    </TouchableOpacity>

                    <TouchableOpacity style={style.action} onPress={sendMail}>
                        <Text style={style.actionText}>E-mail</Text>                        
                    </TouchableOpacity>
                </View>        
            </View>                  

        </View>
    )
}