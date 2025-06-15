function itsv_quote
	# setup
	set quote_file ~/.config/fish/itsv_quotes.txt
	set cache_file ~/.cache/itsv_quote.txt
	set date_file ~/.cache/itsv_quote_date.txt
	set today (date "+%Y-%m-&d")

	# check if quotes exist
	if not test -f $quote_file
		echo "With great power, comes great responsibility... to set the quote file right."
		return
	end

	# read date out of date_file
	if test -f $date_file
		set last_date (cat $date_file)
	else
		set last_date ""
	end

	# if new day set new random quote
	if test "$today" != "$last_date"
		# get random quote and cache it
		set quote (shuf -n 1 $quote_file)
		echo $quote > $cache_file
		echo $today > $date_file
	end

	# display quote
	cat $cache_file
end
