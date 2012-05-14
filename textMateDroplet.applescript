(*
	Textmate Window Opener

	Written by Jon Komperda
	https://github.com/jonkomperda
	komperda.jon@gmail.com
*)

-- For clicking on the icon
on run
	tell application "Finder"
		try
			set directory to (the target of the front window) as alias
		on error
			display dialog "Path does not appear to exist!" buttons {"Sorry!"} default button 1
		end try
	end tell
	stuff(directory)
end run

-- For dropping folders/files onto icon
on open theseItems
	repeat with thisItem in theseItems
		my stuff(thisItem)
	end repeat
end open

-- The main logic
on stuff(thisItem)
	set ourPath to POSIX path of thisItem
	tell application "System Events" to set didOpen to exists application process "TextMate"
	tell application "TextMate"
		activate
		open ourPath
	end tell
end stuff