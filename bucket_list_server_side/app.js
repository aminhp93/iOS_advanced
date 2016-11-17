var express = require("express")
var app = express()

app.get("/tasks", function(request, response) {

    tasks = [{ "objective": "Task 1", "created_at": "Time 1" }, { "objective": "Task 2", "created_at": "Time 2" }]

    response.json({ "results": tasks })
})

app.listen(3000)
