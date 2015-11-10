defmodule Erl8583Demo do

	def simpleiso() do
		m1 = :erl8583_message.new()
		m2 = :erl8583_message.set_mti("0200", m1)
		m3 = :erl8583_message.set(:erl8583_macro_map.card_acceptor_name_location(), "ZIB Head Office ATM V/I  - Lagos 01NG", m2)
		m4 = :erl8583_message.set(:erl8583_macro_map.message_authentication_code(), <<1,2,3,4,5,6,7,8>>, m3)
		
		s1 = :erl8583_message.new()
		s2 = :erl8583_message.set(2, "0000387020", s1)
		m5 = :erl8583_message.set(127, s2, m4)
		m6 = :erl8583_message.set([127, 12], "ZIBeTranzSnk", m5)
		
		# Display the fields defined for the message.
		:io.format("Fields: ~w~n", [:erl8583_message.get_fields(m6)])
		
		# Display fields 0, 43, 64, 127.2 and 127.12.
		
		:io.format("MTI: ~s~n", [:erl8583_message.get(0, m6)])
		:io.format("Card acceptor name/location: ~s~n", [:erl8583_message.get(43, m6)])
		:io.format("MAC: ~p~n", [:erl8583_message.get(64, m6)])
		:io.format("Field 127.2: ~s~n", [:erl8583_message.get([127, 2], m6)])
		:io.format("Field 127.12: ~s~n", [:erl8583_message.get([127, 12], m6)])
	end

	

end
