function pairDifferencev1(nums: number[], k: number): [number, number] {
  const data = new Map<number, number>()
  for (let i = 0; i < nums.length; i++) {
    const dataNow = nums[i]
    const butuhPlus = dataNow + k
    const butuhMinus = dataNow - k

    if (data.has(butuhPlus)) {
      return [data.get(butuhPlus)!, i]
    }

    if (data.has(butuhMinus)) {
      return [data.get(butuhMinus)!, i]
    }

    data.set(dataNow, i)
  }

  throw new Error("Ada yang salah salah")
}

function saav1(numes: number[], k: number) {
  const data = new Map<number, number>()
  for (let i = 0; i < numes.length; i++) {
    const dataNow = numes[i]
    const dataPlus = dataNow + k
    const dataMinus = dataNow - k

    if (data.has(dataPlus)) {
      return [data.get(dataPlus), i]
    }


    data.set(dataNow, i)
  }
}

/* =========================
   DOMAIN: STATE
========================= */

type TodoStatus = "ACTIVE" | "COMPLETED" | "ARCHIVED"

interface Todo {
  id: string
  title: string
  status: TodoStatus
  completedAt?: Date
  archivedAt?: Date
}

/* =========================
   DOMAIN: EVENT
========================= */

type TodoEvent =
  | { type: "CREATE_TODO"; title: string }
  | { type: "COMPLETE_TODO" }
  | { type: "REOPEN_TODO" }
  | { type: "ARCHIVE_TODO" }

/* =========================
   DOMAIN: REDUCER (PURE LOGIC)
   state + event -> new state
========================= */

function todoReducer(
  state: Todo | null,
  event: TodoEvent
): Todo {
  switch (event.type) {
    case "CREATE_TODO":
      if (state !== null) {
        throw new Error("Todo already exists")
      }
      return {
        id: crypto.randomUUID(),
        title: event.title,
        status: "ACTIVE",
      }

    case "COMPLETE_TODO":
      if (!state || state.status !== "ACTIVE") {
        throw new Error("Cannot complete todo")
      }
      return {
        ...state,
        status: "COMPLETED",
        completedAt: new Date(),
      }

    case "REOPEN_TODO":
      if (!state || state.status !== "COMPLETED") {
        throw new Error("Cannot reopen todo")
      }
      return {
        ...state,
        status: "ACTIVE",
        completedAt: undefined,
      }

    case "ARCHIVE_TODO":
      if (!state) {
        throw new Error("Todo does not exist")
      }
      return {
        ...state,
        status: "ARCHIVED",
        archivedAt: new Date(),
      }
  }
}

/* =========================
   PORTS (INTERFACES)
========================= */

interface TodoRepository {
  findById(id: string): Promise<Todo | null>
  save(todo: Todo): Promise<void>
}

interface TodoLogger {
  record(event: TodoEvent, todoId: string): Promise<void>
}

interface Notifier {
  send(message: string, todoId: string): Promise<void>
}

/* =========================
   APPLICATION: EVENT HANDLER
========================= */

async function handleTodoEvent(
  deps: {
    repo: TodoRepository
    log: TodoLogger
    notifier: Notifier
  },
  todoId: string | null,
  event: TodoEvent
): Promise<Todo> {
  const currentTodo = todoId
    ? await deps.repo.findById(todoId)
    : null

  const nextTodo = todoReducer(currentTodo, event)

  // SIDE EFFECTS
  await deps.repo.save(nextTodo)
  await deps.log.record(event, nextTodo.id)

  if (event.type === "COMPLETE_TODO") {
    await deps.notifier.send("Todo completed", nextTodo.id)
  }

  return nextTodo
}

/* =========================
   INFRA: IN-MEMORY IMPLEMENTATION
========================= */

const memoryDB = new Map<string, Todo>()

const memoryRepo: TodoRepository = {
  async findById(id) {
    return memoryDB.get(id) ?? null
  },
  async save(todo) {
    memoryDB.set(todo.id, todo)
    console.log("[DB] SAVE", todo)
  },
}

const consoleLogger: TodoLogger = {
  async record(event, id) {
    console.log("[LOG]", event, "todoId:", id)
  },
}

const consoleNotifier: Notifier = {
  async send(message, id) {
    console.log("[NOTIFY]", message, "todoId:", id)
  },
}

/* =========================
   DEMO FLOW
========================= */

async function demo() {
  // CREATE
  const todo = await handleTodoEvent(
    { repo: memoryRepo, log: consoleLogger, notifier: consoleNotifier },
    null,
    { type: "CREATE_TODO", title: "Belajar state & event" }
  )

  // COMPLETE
  await handleTodoEvent(
    { repo: memoryRepo, log: consoleLogger, notifier: consoleNotifier },
    todo.id,
    { type: "COMPLETE_TODO" }
  )

  // ARCHIVE
  await handleTodoEvent(
    { repo: memoryRepo, log: consoleLogger, notifier: consoleNotifier },
    todo.id,
    { type: "ARCHIVE_TODO" }
  )
}

demo()

