package com.angulargrailstodolist

class Todo {
    String title
    String description
    Date startDate
    Date endDate
    boolean isCompleted

    static constraints = {
        title nullable: false
        description nullable: false
        startDate nullable: false
        endDate nullable: false
        isCompleted nullable: false
    }

    static mapping = {
        description type: "text"
    }
}
