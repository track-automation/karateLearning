Feature: Try Karate Keyword Examples Here

Scenario: Parse CSV text as json
* text txt =
"""
    name,job
    Matt Damon, Actor
"""
* csv csvstring = txt
* print 'The Parsed CSV String is ' +csvstring
* print 'Name:' +csvstring[0].name
* print 'Job:' +csvstring[0].job