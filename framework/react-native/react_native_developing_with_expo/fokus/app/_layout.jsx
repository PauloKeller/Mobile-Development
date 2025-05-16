import { Ionicons } from '@expo/vector-icons';
import { router } from 'expo-router';
import { Drawer } from 'expo-router/drawer';
import { GestureHandlerRootView } from 'react-native-gesture-handler';
import { TasksProvider } from '../components/context/TaskProvider';

export default function Layout() {
  return (
    <TasksProvider>
        <GestureHandlerRootView style={{ flex: 1 }}>
            <Drawer
                screenOptions={{
                    headerStyle: {
                        backgroundColor: "#021123"
                    },
                    headerTintColor: "#FFF",
                    drawerStyle: {
                        backgroundColor: "#021123",

                    },
                    drawerLabelStyle: {
                        color: "#FFF"
                    }
                }}
            >
                <Drawer.Screen 
                    name='index'
                    options={{ 
                        headerShown: false,
                        drawerItemStyle: {
                            display: "none"
                        }
                    }} 
                />
                <Drawer.Screen 
                    name='add-task/index'
                    options={{ 
                        drawerItemStyle: {
                            display: "none"
                        },
                        title: "",
                        headerLeft: () => {
                            return <Ionicons 
                                name="arrow-back"
                                size={24}
                                color="#FFF"
                                style={{ marginLeft: 16 }}
                                onPress={() => router.navigate("/tasks")}
                            />
                        }
                    }} 
                />
                <Drawer.Screen 
                    name='edit-task/[id]'
                    options={{ 
                        drawerItemStyle: {
                            display: "none"
                        },
                        title: "",
                        headerLeft: () => {
                            return <Ionicons 
                                name="arrow-back"
                                size={24}
                                color="#FFF"
                                style={{ marginLeft: 16 }}
                                onPress={() => router.navigate("/tasks")}
                            />
                        }
                    }} 
                />
                <Drawer.Screen 
                    name='pomodoro'
                    options={{ 
                        drawerLabel: "Timer",
                        title: ""
                    }} 
                />
                <Drawer.Screen 
                    name='tasks/index'
                    options={{ 
                        drawerLabel: "Lista de tarefas", 
                        title: ""
                    }} 
                />
            </Drawer>
        </GestureHandlerRootView>
    </TasksProvider>
  );
}