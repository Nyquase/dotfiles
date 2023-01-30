# Custom us-fr Layout

Qwerty alphas with azerty symbols

## Installation on Linux

Copy the file `usfr` to `/usr/share/X11/xkb/symbols`

```sh
sudo cp usfr /usr/share/X11/xkb/symbols/usfr
```

Edit the file `/usr/share/X11/xkb/rules/evdev.xml` with admin privilege and add this section.

```xml
<layoutList>
<!-- Other layouts -->
<!-- Add this before the closing layoutList tag -->
    <layout>
        <configItem>
            <name>usfr</name>
            <shortDescription>usfr</shortDescription>
            <description>French (With US alphas)</description>
            <languageList>
                <iso639Id>eng</iso639Id>
            </languageList>
        </configItem>
        <variantList/>
    </layout>
</layoutList>
```

Logout and the layout should be available in the English section with the name given in the `descprition` tag.
