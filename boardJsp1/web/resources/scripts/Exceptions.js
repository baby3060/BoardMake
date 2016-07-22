function NotBoardNumValidException(value) {
   this.value = value;
   this.message = " Is is Not Valid board_number";
   this.toString = function() {
      return "board_Num " + this.value + this.message;
   };
}

function BoardNumNullException() {
	this.message = "Board Num Not Null References";
	this.toString = function() {
	    return this.message;
	 };
}