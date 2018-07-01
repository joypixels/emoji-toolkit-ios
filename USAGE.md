# Emojione iOS Usage

## Initialization

Start by importing the Emojione iOS library.

**`import emojione_ios`**

Instantiate the Emojione client.

**`let client = Client()`**

If you have a custom rule set, you can pass it in the initializer. `init()`

**`let client = Client(MyRuleSet())`**

_The default ruleset is recommended._

## Client Properties

The following properties are available in the Swift/iOS version of the Emojione library:

 - `emojiVersion` (str) - Used only to direct CDN path. This is a 2-digit version (e.g. '3.1'). Not recommended for usage below 3.0.0.
 - `emojiSize` (enum) **Default: `32`** - Used only to direct CDN path for non-sprite PNG usage. Available options are '32', '64', and '128'.
 - `imagePathPNG` (str) - Defaults to CDN (jsdelivr) path. Setting as alternate path overwrites `emojiSize` option.
 - `greedyMatch` (bool) **Default: `false`** - When `true`, matches non-fully-qualified Unicode values.
 - `ascii` (bool) **Default `false`** - When `true`, matches ASCII characters (in `unicodeToImage` and `shortnameToImage` functions).
 - `riskyMatchAscii` (bool) **Default `false`** - When `true`, matches ASCII characters not encapsulated by spaces. Can cause issues when matching (e.g. `C://filepath` or `<button>.</button>` both contain ASCII chars).

## Usage Examples

Below there are some examples of how you will actually use the libraries to convert Unicode emoji characters to :shortnames: and :shortnames: to emoji images.


### Client Functions


**`client.toShort(string) -> String`** - _native unicode -> shortnames_

Take native unicode emoji input and translate it to their corresponding shortnames. (we recommend this for database storage)


**`client.shortnameToImage(string, UIFont) -> NSAttributedString`** - _shortname -> images_
**`client.shortnameToImageAsync(string, UIFont, (NSAttributedString) -> Void)`** - _shortname -> images_

Take input containing only shortnames and translate it directly to EmojiOne images (when displaying the unified input to clients).  The UIFont parameter is used to calculate the line height to display the emoji image appropriately.  The asynchronous version takes a callback as the third argument.

**`client.shortnameToUnicode(string) -> String`** - _shortname -> native unicode emoji_

Take input containing only shortnames and translate it directly to Unicode Emoji (when displaying the unified input to clients).

**`client.unicodeToImage(string, UIFont) -> NSAttributedString`** - _native unicode -> images_
**`client.unicodeToImageAsync(string, UIFont, (NSAttributedString) -> Void)`** - _native unicode -> images_

Takes native unicode emoji input and translate it directly to EmojiOne images.  The UIFont parameter is used to calculate the line height to display the emoji image appropriately.  The asynchronous version takes a callback as the third argument.

**`client.toImage(string, UIFont) -> NSAttributedString`** - _native unicode + shortnames -> images_
**`client.toImageAsync(string, UIFont, (NSAttributedString) -> Void)`** - _native unicode + shortnames -> images_

Takes a string containing both native unicode emoji and shortnames, and translate it into EmojiOne images for display.  The UIFont parameter is used to calculate the line height to display the emoji image appropriately.  The asynchronous version takes a callback as the third argument.

