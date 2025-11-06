import React, { useEffect, useState } from 'react'
import { getTasks, createTask, updateTask, deleteTask } from './api'

export default function App(){
  const [tasks, setTasks] = useState([])
  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')

  useEffect(()=>{ fetchTasks() }, [])

  async function fetchTasks(){
    try{
      const res = await getTasks()
      setTasks(res.data)
    }catch(e){
      console.error(e)
    }
  }

  async function addTask(e){
    e.preventDefault()
    if(!title) return
    await createTask({ title, description })
    setTitle('')
    setDescription('')
    fetchTasks()
  }

  async function toggleDone(t){
    await updateTask(t.id, { done: !t.done })
    fetchTasks()
  }

  async function removeTask(id){
    await deleteTask(id)
    fetchTasks()
  }

  return (
    <div className="container">
      <h1>Tasks</h1>
      <form onSubmit={addTask} className="form">
        <input value={title} onChange={e=>setTitle(e.target.value)} placeholder="Title" />
        <input value={description} onChange={e=>setDescription(e.target.value)} placeholder="Description (opt)" />
        <button type="submit">Add</button>
      </form>

      <ul className="tasks">
        {tasks.map(t => (
          <li key={t.id} className={t.done? 'done': ''}>
            <div className="left">
              <input type="checkbox" checked={t.done} onChange={()=>toggleDone(t)} />
              <div>
                <strong>{t.title}</strong>
                <div className="desc">{t.description}</div>
              </div>
            </div>
            <button className="del" onClick={()=>removeTask(t.id)}>Delete</button>
          </li>
        ))}
      </ul>
    </div>
  )
}
