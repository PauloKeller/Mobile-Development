import { useState } from "react";
import {
    Keyboard,
    KeyboardAvoidingView,
    Platform,
    Pressable,
    StyleSheet,
    Text,
    TextInput,
    TouchableWithoutFeedback,
    View
} from "react-native";
import { IconSave } from "../../components/Icons";

export default function TaskTextArea({ title, onSubmitText }) {
    const [text, setText] = useState()
    
    function submitText() {
        if (!text) {
            return
        }

        onSubmitText(text)
        setText("")
    }

    return (
        <KeyboardAvoidingView 
            behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
            style={styles.container}
        >
            <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
                <View style={styles.inner}>
                    <Text style={styles.text}>{title}</Text>
                    <Text style={styles.label}>Em que você está trabalhando?</Text>
                    <TextInput 
                        style={styles.input}
                        numberOfLines={10}
                        multiline={true}
                        value={text}
                        onChangeText={newText => setText(newText)}
                    />
                    <View style={styles.actions}>
                        <Pressable 
                            style={styles.button}
                            onPress={submitText}
                        >
                            <IconSave />
                            <Text>Salvar</Text>
                        </Pressable>
                    </View>
                </View>
            </TouchableWithoutFeedback>
        </KeyboardAvoidingView>
    )
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "#021123",
        alignItems: "center",
        justifyContent: "center",
        gap: 16,
    },
    text: {
        color: "#FFF",
        textAlign: "center",
        fontSize: 26
    },
    inner: {
        backgroundColor: "#98A0A8",
        width: "90%",
        borderRadius: 8,
        padding: 16,
        gap: 32,
    },
    label: {
        fontWeight: "600",
        fontSize: 18,
    },
    input: {
        backgroundColor: "#FFF",
        padding: 16,
        borderRadius: 8,
        height: 100,
    },
    actions: {
        flexDirection: "row",
        justifyContent: "flex-end"
    },
    button: {
        flexDirection: "row",
        alignItems: "center",
        gap: 4,
    }
})