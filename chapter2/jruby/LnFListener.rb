require 'java'

java_import java.awt.event.ActionListener

class LnFListener
	include ActionListener

	attr_accessor :frame

	def initialize(frame)
		@frame = frame
	end

	def action_performed(event)
		lnfName = case event.action_command
		when 'Mac'
			# "com.apple.mrj.swing.MacLookAndFeel"
			"com.apple.laf.AquaLookAndFeel"
		when 'Metal'
			"javax.swing.plaf.metal.MetalLookAndFeel"
		when 'Motif'
			"com.sun.java.swing.plaf.motif.MotifLookAndFeel"
		when 'Windows'
			"com.sun.java.swing.plaf.windows.WindowsLookAndFeel"
		else
			System.err.println("Unrecognized L&F request action: " + event.action_command)
			return
		end

		begin
			javax.swing.UIManager.setLookAndFeel(lnfName)
			javax.swing.SwingUtilities.updateComponentTreeUI(frame)
		rescue javax.swing.UnsupportedLookAndFeelException
			System.err.println("Unsupported LookAndFeel: " + lnfName)
		rescue java.lang.ClassNotFoundException
			System.err.println("LookAndFeel class not found: " + lnfName)
		rescue java.lang.InstantiationException
			System.err.println("Could not load LookAndFeel: " + lnfName)
		rescue java.lang.IllegalAccessException
			System.err.println("Cannot use LookAndFeel: " + lnfName)
		end
	end

end