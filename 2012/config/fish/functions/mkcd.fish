function mkcd
	mkdir $argv

	if test $status = 0
		cd $argv[-1]
	end
end
