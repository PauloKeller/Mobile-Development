import MaterialIcons from "@expo/vector-icons/MaterialIcons";
import { LinearGradient } from 'expo-linear-gradient';
import { useLocalSearchParams, useRouter } from "expo-router";
import { useEffect, useState } from "react";
import { Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";

export default function CityName() {
    const searchParams = useLocalSearchParams()
    const [cityDetails, setCityDetails] = useState(null)
    const router = useRouter()

    async function handleData() {
        try {
            const response = await fetch(`https://climapp-api.vercel.app/api`)
            const responseJson = await response.json()
            const city = responseJson.find(cityData => cityData.city == searchParams.cityName)
            setCityDetails(city)
        } catch(e) {
            console.log(e)
        }
    }

    useEffect(() => {
        handleData()
    }, [])

    if (!cityDetails) {
        return (
            <LinearGradient 
                colors={["#00457D", "#05051F"]}
                style={styles.container}
            />
        )
    }

  return (
    <LinearGradient 
      colors={["#00457D", "#05051F"]}
      style={styles.container}
    >
        <View>
            <TouchableOpacity onPress={() => router.back()} style={styles.headerIcon}>
                <MaterialIcons name="chevron-left" size={24} color={"#FFF"}/>
            </TouchableOpacity>
            <Text style={styles.headerTitle}>{cityDetails.city}</Text>
        </View>
        <View style={styles.card}>
            <View style={styles.cardHeader}>
                <Text style={styles.cardHeaderTitle}>Hoje</Text>
                <Text style={styles.cardHeaderTitle}>{cityDetails.date}</Text>
            </View>

            <View style={styles.cardBox}>
                <Image style={styles.cardImage} source={require("../assets/images/clouds.png")}/>
                <View>
                    <Text style={styles.cardTemperature}>{cityDetails.temp}º</Text>
                    <Text style={styles.cardDescription}>{cityDetails.description}</Text>
                </View>
            </View>

            <View style={styles.rowBox}>
                <View style={styles.row}>
                    <Image source={require("../assets/images/humidity.png")} />
                    <Text style={styles.rowTitle}>Humidity:</Text>
                    <Text style={styles.rowValue}>{cityDetails.humidity}%</Text>
                </View>

                <View style={styles.row}>
                    <Image source={require("../assets/images/temperature.png")} />
                    <Text style={styles.rowTitle}>Min/Max:</Text>
                    <Text style={styles.rowValue}>{cityDetails.forecast[0].min}/{cityDetails.forecast[0].max}</Text>
                </View>
            </View>
        </View>
    </LinearGradient>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 16,
    paddingTop: 60,
    gap: 40,
  },
  headerContainer: {
    alignItems: "center",
    justifyContent: "center",
    width: "100%",
  },
  headerTitle: {
    color: "#FFF",
    fontSize: 20,
    fontFamily: "Montserrat_500Medium",
    textAlign: "center"
  },
  headerIcon: {
    position: "absolute",
    left: 0,
    zIndex: 10,
  },
  card: {
    width: "100%",
    borderRadius: 24,
    backgroundColor: "#4463D5",
    padding: 16,
    gap: 24,
  },
  cardHeader: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "center",
    gap: 8,
  },
  cardHeaderTitle: {
    color: "#FFF",
    fontSize: 16,
    fontFamily: "Montserrat_600SemiBold"
  },
  cardImage: {
    width: 72,
    height: 64,
  },
  cardTemperature: {
    color: "#FFF",
    fontSize: 43,
    fontFamily: "Montserrat_700Bold",
    textAlign: "center"
  },
  cardDescription: {
    color: "#FFF",
    fontSize: 13,
    fontFamily: "Montserrat_400Regular",
    textAlign: "center"
  },
  cardBox: {
    alignItems: "center",
    justifyContent: "center",
  },
  row: {
    flexDirection: "row",
    alignItems: "center",
    gap: 8,
  },
  rowTitle: {
    color: "#FFF",
    fontSize: 16,
    fontFamily: "Montserrat_600SemiBold",
  },
  rowValue: {
    color: "#FFF",
    fontSize: 16,
    fontFamily: "Montserrat_400Regular",
    marginLeft: "auto"
  },
  rowBox: {
    gap: 8,
  }
});