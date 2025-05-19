import MaterialIcons from "@expo/vector-icons/MaterialIcons";
import { LinearGradient } from 'expo-linear-gradient';
import { useRouter } from "expo-router";
import { Image, StyleSheet, Text, TouchableOpacity } from 'react-native';

export default function Index() {
  const router = useRouter()

  return (
    <LinearGradient 
      colors={["#00457D", "#05051F"]}
      style={styles.container}
    >
      <Image source={require("../assets/images/logo.png")}/>
      <Image source={require("../assets/images/weather.png")}/>
      <Text style={styles.title}>Boas-vindas!</Text>
      <TouchableOpacity style={styles.button} onPress={() => router.push("/cities")}>
        <Text style={styles.buttonTitle}>Entrar</Text>
        <MaterialIcons name="arrow-forward" size={24} color={"#01080E"}/>
      </TouchableOpacity>
    </LinearGradient>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
    gap: 64,
    paddingVertical: 79,
    paddingHorizontal: 32,
  },
  title: {
    fontSize: 25,
    color: "#FFF",
    fontFamily: "Montserrat_400Regular"
  },
  button: {
    width: "100%",
    height: 40,
    backgroundColor: "#7693FF",
    alignItems: "center",
    justifyContent: "center",
    borderRadius: 32,
    flexDirection: "row",
    gap: 8
  },
  buttonTitle: {
    color: "#01080E",
    fontSize: 20,
    fontWeight: "600",
    fontFamily: "Montserrat_600SemiBold"
  }
});