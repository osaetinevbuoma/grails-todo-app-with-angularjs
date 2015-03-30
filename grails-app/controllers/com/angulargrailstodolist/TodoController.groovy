package com.angulargrailstodolist

import grails.converters.JSON

import java.text.DateFormat
import java.text.SimpleDateFormat

class TodoController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    /**
     * List all the todo items
     * @return JSON
     */
    def list() {
        render Todo.list() as JSON
    }

    /**
     * Save new todo item
     * @return int The id of the saved todo item
     */
    def save() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.ENGLISH)
        dateFormat.setTimeZone(TimeZone.getTimeZone("UTC"))

        def todo = new Todo(
                title: request.JSON.title,
                description: request.JSON.description,
                startDate: dateFormat.parse(request.JSON.startDate),
                endDate: dateFormat.parse(request.JSON.endDate),
                isCompleted: false
        )
        todo.save(flush: true)

        render todo.id
    }

    /**
     * Fetch the item to edit
     * @param params Url parameters
     * @return Todo object instance
     */
    def edit(params) {
        render Todo.findById(params.id) as JSON
    }

    /**
     * Update an item
     * @return Response Code
     */
    def update() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.ENGLISH)
        dateFormat.setTimeZone(TimeZone.getTimeZone("UTC"))

        def todo = Todo.findById(request.JSON.id)
        todo.title = request.JSON.title
        todo.description = request.JSON.description
        todo.startDate = dateFormat.parse(request.JSON.startDate)
        todo.endDate = dateFormat.parse(request.JSON.endDate)
        todo.isCompleted = request.JSON.isCompleted

        todo.save(flush: true)

        render(200)
    }

    /**
     * Delete an item
     * @param params URL parameters
     * @return Response Code
     */
    def delete(params) {
        def todo = Todo.findById(params.id)
        todo.delete(flush: true)

        render(200)
    }
}
