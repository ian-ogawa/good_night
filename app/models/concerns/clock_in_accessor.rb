module ClockInAccessor
	def last_clocked_in
		self.user.clock_ins.first
	end
end