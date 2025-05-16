import { router } from "expo-router";
import useTaskContext from "../../components/context/useTaskContext";
import TaskTextArea from "../../components/TaskTextArea";

export default function AddTask() {
    const { addTask } = useTaskContext()

    function submitTask(description) {
        if (!description) {
            return
        }

        addTask(description)
        router.navigate("/tasks")
    }

    return (
        <TaskTextArea 
            title="Adicionar uma tarefa:"
            onSubmitText={submitTask}
        />
    )
}