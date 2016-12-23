Circuit URL handler
==================

This is proyect is about facilitating making calls from any phone number in Firefox or Thunderbird using [Circuit WebApp](https://eu.yourcircuit.com/). Usually, when you find a phone nunber it is just text that you will copy/paste into your calling system (Circuit in our case). If your are lucky it will appear as linkable phone number but there will not be an app knowing how to manage it. 

**These proyect covers GNU/Linux use case, but Windows should have a similar way of adding handlers for
your customs protocols**

So you have a phone number as text:

![alt text](./phone-no-link.png "Phone numbers as not linkable text")

And you want this:

![alt text](./phone-link.png "Phone numbers is a link to make the call")

Notice in the bottom part of the last picture that it is not only a link, it is a link with a "Circuit" protocol. We will use this protocol with an url handler to invoke the Circuit Web App. So we have 3 steps:

 1. Transform texts into links with a Circuit protocol
 2. To add an url handler in your Linux system to hook this new protocol
 3. Lunch Google Chrome (recommende browser for this app), but could be other, to call this number.
 

## Transforming texts into links

Using [telify addon](https://addons.mozilla.org/en-US/firefox/addon/telify/?src=search) is pretty easy to get what we want (Firefox): transform Text Phone Numbers into a Link with a Custom Protocol Ciruit.

You only have to configure the custom url mode of this addon to prefix the phone number with a new protocol called Circuit:
![pic1](./telify-circuit-protocol.png)

This addon will detect phone number as links, this works pretty well for example with google contacts, or others phones detected in a web page (or in Thunderbird). But even phone numbers that are not automatically detected can be used, you just need to select the phone number text and click with the second button of your mouse:

![pic2](https://cloud.githubusercontent.com/assets/3435696/21431054/13d882a2-c866-11e6-8dc9-37359b82798a.png)

So, now we have click-ables phone numbers in web pages and emails (you have to install the addon in Thunderbird). And these links make reference to a new protocol *circuit:phone-number*.

## Creating the url-handler

The url handler is just a way of managing urls, uris, mime-types, etc, saying with application will manage it. 

An url handler will look like this:

```
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=/usr/bin/circuit-url-handler.sh %u
Name=PHONE-CIRCUIT
Comment=PHONE-CIRCUIT handler
Icon=
Categories=Application;Network;
MimeType=x-scheme-handler/circuit;

```

So, just copy [circuit.desktop](./circuit.desktop) file, usually, in to the directory for the MimeTypes:

```
$> cp circuit.desktop ~/.local/share/applications/
```

Edit ~/.local/share/applications/mimeapps.list and add the handler:

```
[Default Applications]

...
x-scheme-handler/circuit=circuit.desktop
...

```

and run an update of the data base with Mime types:

```
$> update-desktop-database
```

And finally copy the script that make of bridge between the handler and chrome:

```
$> sudo cp circuit-url-handler.sh /usr/bin/
```

And thats all, maybe you will need to reboot your browser. Now you will be able to click on phone numbers that will be passed to Circuit Web App to make the call



# License

Opensource licence Apache v2