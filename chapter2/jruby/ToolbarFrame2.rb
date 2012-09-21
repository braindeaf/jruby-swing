require 'java'

java_import java.awt.BorderLayout
java_import java.awt.FlowLayout
java_import java.awt.Frame

java_import javax.swing.JButton
java_import javax.swing.JPanel

# Events
java_import java.awt.event.ActionListener
java_import java.awt.event.WindowAdapter
java_import java.lang.System

# import java class
# java_import 'LnFListener'
require 'lnflistener'

class ToolbarFrame2 < Frame

	def initialize()
		super("Toolbar Example (Swing)")
		self.setSize 450, 250
	
		add_window_listener(WindowCloser.new)

		toolbar = JPanel.new
		toolbar.layout = FlowLayout.new(FlowLayout::LEFT)

		cut = JButton.new("Cut")
		cut.addActionListener(PrintListener.new)
		toolbar.add(cut)

		copy = JButton.new("Copy")
		copy.addActionListener(PrintListener.new)
		toolbar.add(copy)

		paste = JButton.new("Paste")
		paste.addActionListener(PrintListener.new)
		toolbar.add(paste)

		add(toolbar, BorderLayout::NORTH)

		# Add the L&F controls.
		lnfPanel = JPanel.new
		lnfListener = LnFListener.new(self)

		macButton = JButton.new('Mac')
		macButton.addActionListener(lnfListener)
		lnfPanel.add(macButton)

		javaButton = JButton.new('Metal')
		javaButton.addActionListener(lnfListener)
		lnfPanel.add(javaButton)
		
		motifButton = JButton.new('Motif')
		motifButton.addActionListener(lnfListener)
		lnfPanel.add(motifButton)
		
		winButton = JButton.new('Windows')
		winButton.addActionListener(lnfListener)
		lnfPanel.add(winButton)

		add(lnfPanel, BorderLayout::SOUTH)
		
	end

  class WindowCloser < WindowAdapter
    def window_closing
      System.exit()
    end
  end

  class PrintListener 
  	include ActionListener
  	def action_performed(ae)
  		System.out.println(ae.get_action_command)
  	end
  end

end

tf2 = ToolbarFrame2.new
tf2.visible = true