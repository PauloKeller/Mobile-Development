import { useContext } from "react";
import { TaskContext } from "./TaskProvider";

export default function useTaskContext() {
    const context = useContext(TaskContext)
    if (!context) {
        throw new Error("Tentando acessar o contexto fora do TaskProvider")
    }
    
    return context
}