;            /|\
; # Hoc     |-.-|
; #   kery  : | :
;            - -
; CLI utility for execution of ad-hoc half-automatic processes
;
; how it's made:
; power of regular rye + some specific cli functions + maybe some
; special context play + rye console + enter-console + ...
; 
; MVP:
; basically really just rye with some job specific short functions:
; step cmd ask h1 text halt
;
; GROWT:
; special CLI inputs , special (interactive) data displays
; stylesheets -- most of which can be used in other rye cases
;
; IDEAS:
; make it possible to exit and continue ... it stores at which step it
; stopped and on next run can strip code to that step and then DO it.
;
; in general let it store sessions, when it was started and when it ended,
; so you can see what you were doing and when, maybe even store all inputs
; so you can reply it
;
; have function summary, that takes it's script itself and shows only the
; steps and sections
;
; hockery projects are folders
; 
; hoc start ... starts process in local directory ..
; hoc log ... shows previous runs
; hoc replay <ID> ... replays previous run, inputs, remembered data
; 

h1 { "Billing for InvoiceCat" }

text { "you will create invoices from usage data in 4 sections and multiple steps." }

halt "press ENTER when ready"

cd %../

clear

section { "collect data for invoicing" } {

	step { 1 text { 'red 'bold "description of step" } } {
		
		date-from: ask "Enter the date of fist report? [yyyy-mm-dd]"
		
		cmd "rebcmd -swq make-report {date-from} > report_from_{date-from}.html"
		
		cmd " .... " |load-csv :report |remember "Data name"
		
		summary { "name of summary" "explanation ..." } {
			display report
		}

		
	}

	cd %~/d/www/area/
	
	step { 2 ... } {
		
		selection { 'inu "include new users" 'jeu "just existing users" } :mode
		
		if mode = 'jeu {
			cmd "..."
		} 
		
		cmt " ... "	
		
	}
}

