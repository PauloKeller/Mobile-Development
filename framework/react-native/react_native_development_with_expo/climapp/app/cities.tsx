import MaterialIcons from "@expo/vector-icons/MaterialIcons";
import { LinearGradient } from 'expo-linear-gradient';
import { useRouter } from "expo-router";
import { useEffect, useState } from "react";
import { Image, ScrollView, StyleSheet, Text, TextInput, TouchableOpacity, View } from "react-native";
import citiesData from "../data/cities.json";

export default function Cities() {
  const [search, setSearch] = useState("")
  const [filteredCities, setFilteredCities] = useState(citiesData)
  const router = useRouter()

  useEffect(() => {
    const newFilteredCities = citiesData.filter((city) => city.city.toLowerCase().includes(search.toLowerCase()))
    
    setFilteredCities(newFilteredCities)
  }, [search])

  return (
    <LinearGradient 
      colors={["#00457D", "#05051F"]}
      style={styles.container}
    >
        <View style={styles.inputContainer}>
            <TextInput 
                style={styles.input} 
                placeholder="Digite a cidade"
                placeholderTextColor={"#FFF"}
                value={search}
                onChangeText={(value) => setSearch(value)}
            />
            <MaterialIcons name="search" size={18} color={"#FFF"}/>
        </View>
        <ScrollView>
            <View style={styles.scrollList}>
                {
                    filteredCities.map(city => (
                        <TouchableOpacity onPress={() => router.push(`/${city.city}`)} key={city.city} style={styles.listItem}>
                            <Image style={styles.cityImage} source={require("../assets/images/clouds.png")} />
                            <Text style={styles.cityName}>{city.city.replace(", ", " - ")}</Text>
                            <Text style={styles.cityTemp}>{city.temp}º</Text>
                        </TouchableOpacity>
                    ))
                }
            </View>
        </ScrollView>
    </LinearGradient>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 16,
    gap: 40,
    paddingTop: 60,
  },
  scrollList: {
    gap: 16,
  },
  listItem: {
    height: 63,
    width: "100%",
    backgroundColor: "rgba(255, 255, 255, 0.15)",
    alignItems: "center",
    justifyContent: "space-between",
    borderRadius: 16,
    flexDirection: "row",
    paddingHorizontal: 16,
  },
  cityName: {
    color: "#FFF",
    fontSize: 16,
    fontFamily: "Montserrat_500Medium"
  },
  cityTemp: {
    color: "#FFF",
    fontSize: 25,
    fontFamily: "Montserrat_700Bold"
  },
  cityImage: {
    width: 27,
    height: 24,
  },
  inputContainer: {
    height: 36,
    width: "100%",
    backgroundColor: "rgba(255, 255, 255, 0.15)",
    borderRadius: 24,
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    paddingHorizontal: 16,
  },
  input: {
    fontSize: 16,
    fontFamily: "Montserrat_500Medium",
    color: "#FFF"
  }
});