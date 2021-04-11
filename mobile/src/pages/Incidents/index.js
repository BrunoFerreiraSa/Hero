import React, {useState, useEffect} from 'react';
import {Feather} from '@expo/vector-icons'
import {useNavigation} from '@react-navigation/native'
import { View, FlatList , Image, Text, TouchableOpacity } from 'react-native';

import api from '../../services/api';

import imgLogo from '../../assets/logo.png';

import style from './styles';

export default function Incidents(){
    const [incidents, setIncidents] = useState([]);
    const [total, setTotal] = useState(0);
    const [page, setPage] = useState(1);
    const [loading, setloading] = useState(false);

    const navigator = useNavigation();

    function navigateToDetais(incident){
        navigator.navigate('Detail', {incident});
    }

    async function loadIncidents(){
        if (loading) {
            return;
        }

        if(total > 0 && incidents.length === total){
            return;
        }

        setloading(true);

        const response = await api.get('incidents', {params:{page}});        

        setIncidents([...incidents, ...response.data]);
        setTotal(response.headers['x-total-count']);
        setPage(page + 1);

        setloading(false);
    }

    useEffect(() => {
        loadIncidents();
    }, [])

    return (
        <View style={style.container}>
            <View style={style.header}>
                <Image source={imgLogo} />
                <Text style={style.headerText}>
                    Total de <Text style={style.headerTextBold}>{total} casos</Text>
                </Text>
            </View>

            <Text style={style.title}>Bem-Vindo</Text>
            <Text style={style.description}>Escolha um dos casos abaixo e salve o dia.</Text>

            <FlatList
                data={incidents}
                style={style.incidentsList}
                keyExtractor={incident => String(incident.id)}
                showsVerticalScrollIndicator = {false}
                onEndReached={loadIncidents}
                onEndReachedThreshold={0.2}
                renderItem={({item: incident}) => (
                    <View style={style.incidents}>
                        <Text style={style.incidentsProperty}>ONG:</Text>
                        <Text style={style.incidentsValue}>{incident.name}</Text>

                        <Text style={style.incidentsProperty}>CASO:</Text>
                        <Text style={style.incidentsValue}>{incident.title}</Text>

                        <Text style={style.incidentsProperty}>VALOR:</Text>
                        <Text style={style.incidentsValue}>{Intl.NumberFormat('pt-BR', {style: 'currency', currency: 'BRL'}).format(incident.value)}</Text>

                        <TouchableOpacity style={style.detailButton} onPress={()=> navigateToDetais(incident)}>
                            <Text style={style.detailButtonText}>Ver mais detalhes</Text>
                            <Feather name="arrow-right" size={16} color="#e02041"></Feather>
                        </TouchableOpacity>
                    </View>
                )}
            />           

        </View>
    )
}