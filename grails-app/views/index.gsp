<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails version of AngularJS To-Do List Application</title>
	</head>
	<body>
		<div class="row" ng-app="todoApp" ng-controller="TodoListController as todoListCtrl">
			<h1 align="center">To-Do List</h1>

			<div class="col-lg-4">
				<h3 ng-hide="todo.id">New To-Do Item</h3>
				<h3 ng-show="todo.id">Edit To-Do Item</h3>

				<form name="myTodo" ng-submit="todoListCtrl.saveTodo(todo.id)">
					<div class="form-group">
						<label for="title">Item</label>
						<input type="text" id="title" ng-model="todo.title" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="description">Description</label>
						<textarea id="description" ng-model="todo.description" class="form-control" required></textarea>
					</div>
					<div class="form-group">
						<label for="start_date">Start Date</label>
						<input type="date" id="start_date" ng-model="todo.startDate" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="end_date">End Date</label>
						<input type="date" id="end_date" ng-model="todo.endDate" class="form-control" required>
					</div>
					<div ng-show="todo.id">
						<label>
							<input type="checkbox" id="is_completed" ng-model="todo.isCompleted"> Completed?
						</label>
					</div>
					<button type="submit" class="btn btn-primary">Save</button>
					<button type="reset" class="btn btn-default" ng-hide="todo.id">Clear</button>
					<button type="button" class="btn btn-default" ng-show="todo.id" ng-click="todoListCtrl.cancel()">Cancel</button>
					<button type="button" class="btn btn-danger" ng-show="todo.id" ng-click="todoListCtrl.deleteTodo(todo.id)">
						Delete
					</button>
				</form>
			</div>

			<div class="col-lg-8">
				<table class="table table-responsive table-hover table-striped">
					<thead>
					<tr>
						<th>Item</th>
						<th>Description</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Completed</th>
						<th>Edit</th>
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="todo in todos">
						<td ng-bind="todo.title"></td>
						<td ng-bind="todo.description"></td>
						<td ng-bind="todoListCtrl.convertDate(todo.startDate) | date:'MM/dd/yyyy'"></td>
						<td ng-bind="todoListCtrl.convertDate(todo.endDate) | date:'MM/dd/yyyy'"></td>
						<td ng-bind="todoListCtrl.isCompleted(todo.isCompleted)"></td>
						<td>
							<a href ng-click="todoListCtrl.editTodo(todo.id)">
								<span class="glyphicon glyphicon-edit"></span>
							</a>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>

		<asset:javascript src="app/app.js" />
		<asset:javascript src="app/todoController.js" />
	</body>
</html>
