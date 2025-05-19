import { router } from "expo-router";
import { Image, StyleSheet, Text, View } from "react-native";
import { FokusButton } from "../components/FokusButton";


export default function Index() {
  return (
    <View style={styles.container}>
      <Image source={require("../assets/images/logo.png")} />
      <View style={styles.inner}>
        <Text style={styles.title}>
          Otimize sua {"\n"}produtividade,{"\n"}
          <Text style={styles.bold}>
            mergulhe no{"\n"}que importa
          </Text>
        </Text>
        <Image 
          style={styles.image}
          source={require("../assets/images/home.png")}
        />
        <FokusButton 
          title={"Quero iniciar!"}
          onPress={() => router.navigate("/pomodoro")}
        />
      </View>
      <View style={styles.footer}>
        <Text style={styles.footerText}>Projeto fictício e sem fins comerciais</Text>
        <Text style={styles.footerText}>Desenvolvido por Alura.</Text>
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#021123",
    gap: 40,
  },
  image: {
    width: 300,
    height: 300
  },
  inner: {
    gap: 16,
  },
  title: {
    color: "#FFF",
    textAlign: "center",
    fontSize: 26,
  },
  bold: {
    fontWeight: "bold"
  },
  footer: {
    width: "%80"
  },
  footerText: {
    textAlign: "center",
    color: "#98A0A8",
    fontSize: 12.5
  }
})