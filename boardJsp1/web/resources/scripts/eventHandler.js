/**
 *  Event Regist ID
 */

function registerEventById( sTargetID, sEventName, fnHandler ) 
{
   var oTarget = document.getElementById( sTargetID );
   if ( oTarget != null ) 
   {
      if ( oTarget.addEventListener ) {   
         oTarget.addEventListener( sEventName, fnHandler, false );
      } 
      else 
      {
    	var sOnEvent = "on" + sEventName; 
        if ( oTarget.attachEvent )
        {
        	oTarget.attachEvent( sOnEvent, fnHandler );
        }

      }
   }
}

/**
 * Event Remove ID
 */ 

function removeEventById( sTargetID, sEventName, fnHandler ) 
{
   var oTarget = document.getElementById( sTargetID );
   if ( oTarget != null ) 
   {
      if ( oTarget.removeEventListener ) {   
         oTarget.removeEventListener( sEventName, fnHandler, false );
      } else {
        var sOnEvent = "on" + sEventName; 
        if ( oTarget.removeEvent )
        {
           oTarget.removeEvent( sOnEvent, fnHandler );
        }
        
      }
   }
}

/**
 * @param event
 * @returns Keyboard Key code
 */
function returnKeyCode(event) {
	var keyCode = event.keyCode ? event.keyCode : event.which;
	return keyCode;
}

function returnParent(target) {
	return target.parentElement;
}
