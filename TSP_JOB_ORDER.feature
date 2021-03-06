Feature: Job Order

	As an employer with a staffing requirement
	I want to send a job order to Palmer Group
	So that I can quickly fill my open position

	Scenario: Submitting a staffing order
		Given I have a general staffing requirement
		When I submit the order details to the portal
		But I am not an approver
		Then an approver from my company will be notified of my staffing order

	Scenario: Submitting a Staffing Job Order
		Given I have a general staffing requirement
		When I submit the order details to the portal
		And I am an approver
		Then <PG Division> and <Location> will be notified of my staffing order

			table

	Scenario: Approving a job order
		Given I am an approver for a company
		When I am notified of a job order requiring approval
		And I approve the job order
		Then <PG Division> and <Location> will be notified of my staffing order
		But if I deny the job order
		Then *requesting user gets a notice of denial and job order is marked denied*

			table

	Scenario: Routing a job order
		Given an approved job order is submitted to a <PG Division> and <Location>
		When the client has an assigned AE for the <PG Division> and <Location>
		Then the job order is routed to <User>
		But if the client does not have an assigned AE for the <PG Division> and <Location>
		Then the job order is routed to <PG Division> and <Location> <Leader>

			table

