function getids
	set file "./log"
	if test -n "$1"
		set file "$1"
	end

	mkdir -p ./ids

	rm ./ids/*

	cat "$file" | rg '.*?_tray: (.*Bailopan.*) \(([0-9]+)\).*' -r '$2 $1' | sort | uniq > ids/ids_usernames
	cat "$file" | rg '.*?_tray: (.*Bailopan.*) \(([0-9]+)\).*' -r '$2' | sort | uniq | tr '\n' ' ' > ids/ids

	cd ids
	split -l 100 -t ' ' -d ids ids
	cd ..
end
