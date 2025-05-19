import AsyncStorage from '@react-native-async-storage/async-storage';
import { createContext, useEffect, useState } from "react";

export const TaskContext = createContext()
const TASKS_STORAGE_KEY = 'fokus-tasks'

export function TasksProvider({ children }) {

    const [tasks, setTasks] = useState([])
    const [isLoaded, setIsLoaded] = useState(false)

    useEffect(() => {
        const getData = async () => {
            try {
                const jsonValue = await AsyncStorage.getItem(TASKS_STORAGE_KEY);
                const loadedData = jsonValue != null ? JSON.parse(jsonValue) : [];
                setTasks(loadedData)
                setIsLoaded(true)
            } catch (e) {
                console.log(e)
            }
        }

        getData()
    }, [])

    useEffect(() => {
        const storeData = async (value) => {
            try {
                const jsonValue = JSON.stringify(value)
                await AsyncStorage.setItem(TASKS_STORAGE_KEY, jsonValue)
            } catch (e) {
                console.log(e)
            }
        }

        if (isLoaded) {
            storeData(tasks)
        }
    }, [tasks])

    const addTask = (description) => {
        setTasks(oldState => {
            return [
                ...oldState,
                {
                    description,
                    id: oldState.length + 1
                }
            ]
        })
    }

    const toggleTaskCompleted = (id) => {
        setTasks(oldState => {
            return oldState.map(t => {
                if (t.id === id) {
                    t.completed = !t.completed
                }
                return t
            })
        })
    }

    const editTask = (id, description) => {
        setTasks(oldState => {
            return oldState.map(t => {
                if (t.id == id) {
                    t.description = description
                }
                return t
            })
        })
    }


    const deleteTask = (id) => {
        setTasks(oldState => {
            return oldState.filter(t => t.id != id)
        })
    }

    const getTask = (id) => {
        const array = tasks.filter(t => t.id == id)
        
        if (array != null) {
            return array[0]
        }
    }

    return (
        <TaskContext.Provider 
            value={{
                tasks,
                addTask,
                toggleTaskCompleted,
                editTask,
                deleteTask,
                getTask
            }}
        >
            { children } 
        </TaskContext.Provider>
    )
}