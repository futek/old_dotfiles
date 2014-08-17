function any --description "grep for process(es) by keyword"
	ps xauwww | grep -i --color=auto "$argv"
end
