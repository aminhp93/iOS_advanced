var express = require("express")
var app = express()
var bodyParser = require('body-parser');

var tasks = [{ "objective": "Task 1", "created_at": "Time 1" }, { "objective": "Task 2", "created_at": "Time 2" }]

app.use(bodyParser.urlencoded({ extended: true }));
// app.use(bodyParser.json());

app.get("/tasks", function(request, response) {
    response.json({ "results": tasks })

})

app.post("/tasks", function(request, response) {
    console.log(request.body.objective, "===========add")
    tasks += [{ "objective": request.body.objective, "created_at": new Date().toUTCString() }]
})

app.post("/tasks/update", function(request, response) {
    console.log(request.body.objective, "===========update")

    var array = request.body.objective.split(",")
        // tasks[array[]]
    console.log(array)

})

app.post("/tasks/delete", function(request, response) {
    console.log(request.body.objective, "===========delete")
    tasks.splice(parseInt(request.body.objective), 1)
})

app.listen(3000, function() {
    console.log("Running on port 3000")
})
