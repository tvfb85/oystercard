# Oystercard Challenge

## About this project
The goal of this Ruby project was to build a complex program which replicated the TfL Oyster card system. Using TDD, the code has been developed with object-oriented design principles in mind.


## User Stories
This project meets the requirements of the following user stories:
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## Skills
This project was an opportunity to develop skills in the following areas:
- Encapsulation
- Delegation
- Single Responsibility Principle
- Law of Demeter

## Usage

To create a new Oystercard:

```
2.3.3 :002 > oystercard = Oystercard.new
 => #<Oystercard:0x007ff6ec170350 @balance=0, @journeylog=#<Journeylog:0x007ff6ec170328 @journey_class=Journey, @history=[]>>
 ```

 To top-up the Oystercard:

 ```
 2.3.3 :003 > oystercard.top_up(25)
 ```

 To touch-in at a station, pass in a new instance of a Station object, using the station name and zone as parameters:

 ```
 2.3.3 :005 > oystercard.touch_in(Station.new('Richmond', 4))
 => #<Journey:0x007ff6ec149f98 @entry_station=#<Station:0x007ff6ec14a060 @name="Richmond", @zone=4>>
 ```

 Similarly, to touch out at a station, call the following:

 ```
 2.3.3 :006 > oystercard.touch_out(Station.new('Brixton', 2))
 ```

 The journey will be logged on the Oystercard instance as:

 ```
 #<Oystercard:0x007ff6ec170350 @balance=23, @journeylog=#<Journeylog:0x007ff6ec170328 @journey_class=Journey, @history=[#<Journey:0x007ff6ec149f98 @entry_station=#<Station:0x007ff6ec14a060 @name="Richmond", @zone=4>, @exit_station=#<Station:0x007ff6ec130f48 @name="Brixton", @zone=2>, @fare=2>], @current_journey=nil, @fare=2>>
 ```
