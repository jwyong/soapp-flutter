# Soapp - Extending Possibilities

All-in-one app for chat, appointments and much more. A prototype written in Flutter Dart language in order to experiment on the feasibility of a custom XMPP Erlang backend connected to Flutter frontend. At the time of writing, there wasn't a Flutter library which handles XMPP (much less a highly customised backend), so the use of MethodChannels were required to communicate with native Smack (Android) and XMPP Framework (iOS) libraries.

## About Soapp

Soapp is a mobile app where users can search for restaurants, chat with friends, and manage appointments made to said venue - all in one app.

## Discover Tab

Users can search for restaurants on this tab, based on their current GPS location. They can then share said restaurant to the chat rooms with friends. Other features in this tab includes restaurant search and filtering.

## Chat Tab

This tab lists the chat rooms this user is in, be it single chat rooms or group chat rooms. Basic functions include sending of send texts, images, videos, and audios to others via chat, while unique features are sharing restaurants from the "Discover tab" and also viewing updates from scheduled appointments (e.g. RSVP by other members, change in date, time or venue, addition/deletion of an appointment, etc)

## Appointment Tab

Appointments scheduled with others are listed here. Appointments are tied to venues (restaurants) searched via the "Discover tab", and each appointment room can hold multiple appointments relevant to said room. I.e. users can schedule multiple upcoming appointments with friend A, with which each appointment will be listed in the appointment room with Friend A. Users can RSVP appointment in the appointment room, and also view RSVP status of all other members.
