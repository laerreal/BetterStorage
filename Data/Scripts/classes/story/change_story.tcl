$start
$after
					// Verschiebungskrempel

$put
                    set stores [lnand 0 [obj_query this -class Lager -owner 0]]
					foreach s $stores {
    					set sy [get_posy $s]
    					if { $sy < [lindex $MPos1 1] && ![is_contained $s] } {
    						// drop quest items for relocation
							foreach item [inv_list $s] {
								if {[lsearch {Ring_Der_Erde Ring_Der_Luft Ring_Der_Magie Ring_Des_Feuers Ring_Des_Lebens Ring_Des_Wassers Ring_Des_Wissens Drachenbaby Drachen_Ei} [get_objclass $item]] > -1} {
									set newitempos [vector_add [get_pos $item] {0 0 1.5}]
									inv_rem $s $item
									set_pos $item $newitempos
									set_physic $item 1
									set_instore $item 0
								}
							}
    					}
    				}

$end


$start
$replace
if { $ry <= [lindex $MPos1 1] + 1 && ![find_in_inv_of $item $zl] } {
$with
if { $ry <= [lindex $MPos1 1] + 1 && ![find_in_inv_of $item $zl] && ![find_in_inv_of $item $stores] } {
$end