# Salesforce Apex — Account Industry Trigger

A small, fully tested Apex automation on the standard Account object, built as a Salesforce developer portfolio piece. It demonstrates the one-trigger-per-object plus handler pattern, bulk-safe logic, and a unit test with 100% code coverage.

Built and verified in a Trailhead Playground. Not connected to any production org.

## Problem

Apex triggers are easy to get wrong: business logic crammed into the trigger body, code that breaks on bulk loads of 200 or more records, and missing test coverage (Salesforce blocks deployment below 75%). The goal was to build the correct baseline shape every real trigger should follow.

## Solution

Thin trigger (AccountIndustryTrigger): a dispatcher with no logic; it only forwards Trigger.new to a handler.

Handler class (AccountTriggerHandler): all logic lives here, in a static method that takes a plain list of Account records, which makes it independently unit-testable.

Bulk-safe: the logic loops over the collection, so it handles 1 or 200 records identically, with no SOQL or DML inside the loop.

Before-save context: fields are changed in memory before the record is written, so no extra DML is needed.

Current rule: when an Account is inserted or updated with a blank Industry, the handler writes a value to the Description field.

## Tech stack

Apex (trigger, handler class, test class), SOQL, the standard Salesforce Account object, built in a Trailhead Playground via the Developer Console.

## Result

The unit test passes with zero failures and 100% code coverage (trigger 1 of 1, handler 5 of 5), past the 75% deployment threshold.

TODO (Andre): add a screenshot of the green test run from the Developer Console.

## Repository structure

The Apex files live under force-app/main/default/. The trigger is at triggers/AccountIndustryTrigger.trigger; the handler and its test are at classes/AccountTriggerHandler.cls and classes/AccountTriggerHandlerTest.cls.

## Design notes and next iteration

This began as a learning exercise. The current rule (writing a placeholder string to Description when Industry is blank) is not a realistic business requirement; it is a known limitation, kept here honestly. Planned improvements: replace the hardcoded string with a meaningful, configurable value; re-base the rule on a real-world need (flag or default a field rather than overwrite a free-text field); and add the Salesforce metadata files (cls-meta.xml and trigger-meta.xml) so the project deploys cleanly via SFDX.

## What I learned

TODO (Andre): in your own words. Trigger.new, the handler pattern, bulkification, Test.startTest and Test.stopTest, and Arrange-Act-Assert.

---

Licensed under the MIT License.
