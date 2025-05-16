import { Pressable, StyleSheet, Text } from "react-native";

export const FokusButton = ({ onPress, title, icon, outline }) => {
    return (
        <Pressable style={[styles.button, outline && styles.outlineButton]} onPress={onPress}>
            {icon}
            <Text style={[styles.buttonText, outline && styles.outlineButtonText]}>{title}</Text>
        </Pressable>
    )
}

const styles = StyleSheet.create({
  button: {
    backgroundColor: "#B872FF",
    padding: 8,
    borderRadius: 32,
    flexDirection: "row",
    gap: 12,
    alignItems: "center",
    justifyContent: "center"
  },
  outlineButton: {
    backgroundColor: "transparent",
    borderColor: "#B872FF",
    borderWidth: 2,
  },
  buttonText: {
    textAlign: "center",
    color: "#021123",
    fontSize: 18,
  },
  outlineButtonText: {
    color: "#B872FF",
  }
})