import { router, useLocalSearchParams } from "expo-router";
import useTaskContext from "../../components/context/useTaskContext";
import TaskTextArea from "../../components/TaskTextArea";

export default function EditTask() {
    const { id } = useLocalSearchParams()
    const { editTask } = useTaskContext()
    
    function submitTask(description) {
        if (!description) {
            return
        }

        editTask(id, description)
        router.navigate("/tasks")
    }

    return (
        <TaskTextArea 
            title="Editar tarefa:"
            onSubmitText={submitTask}
        />
    )
}