﻿////////////////////////////////////////////////////////////////////////////
// The contents of this file are subject to the Mozilla Public License
// Version 1.1 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://www.mozilla.org/MPL/
// 
// Software distributed under the License is distributed on an "AS IS"
// basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
// License for the specific language governing rights and limitations
// under the License.
// 
// The Original Code is Astre framework.
// 
// The Initial Developer of the Original Code is 
// Vincent Petithory   "vincent.petithory@gmail.com".
// Portions created by the Initial Developer are Copyright (C) 2008-2009 
// the Initial Developer. All Rights Reserved.
// 
// Contributor(s): 
////////////////////////////////////////////////////////////////////////////

package astre.async 
{
	import flash.events.Event;

/**
 * A <code class="prettyprint">FunctionToken</code> is a bridge object 
 * returned by the 
 * <code class="prettyprint">astre.core.Test.checkFunctionWillBeCalled()</code> 
 * method, and used as an argument by the 
 * <code class="prettyprint">astre.core.Test.markFunctionAsCalled()</code> method.
 * 
 * Generally, you just need to store this object before passing it to the 
 * <code class="prettyprint">markFunctionAsCalled()</code> mentioned above.
 * 
 * @see astre.core.Test#checkFunctionWillBeCalled()
 * @see astre.core.Test#markFunctionAsCalled()
 * 
 * @author lunar
 * 
 */
public class FunctionToken 
{
	
	//------------------------------
	//
	// Class members
	//
	//------------------------------
	
	/**
	 * A shared function that handles a generic event.
	 */
	public static const EMPTY_EVENT_FUNCTION:Function = function (event:Event):void {};
	
	/**
	 * A empty shared function.
	 */
	public static const EMPTY_FUNCTION:Function = function ():void {};
	
	/**
	 * An string used during the creation of an event type.
	 */
	public static const EVENT_TYPE_SEPARATOR:String = "_Ox";
	
	//------------------------------
	//
	// Properties
	//
	//------------------------------
	
	/**
	 * The name of the function.
	 */
	public var functionName:String;
	
	/**
	 * The id of this 
	 * <code class="prettyprint">FunctionToken</code>.
	 * 
	 * <p>When returned by the 
	 * <code class="prettyprint">astre.core.Test.checkFunctionWillBeCalled()</code> 
	 * method, the id matches the one of the associated 
	 * <code class="prettyprint">IAsyncCheckout</code> generated by 
	 * this method.</p>
	 */
	public var id:uint;
	
	/**
	 * The event type related to the function.
	 * It is based on the function name and the id.
	 */
	public function get eventType():String
	{
		return functionName+FunctionToken.EVENT_TYPE_SEPARATOR+id.toString(16);
	}
	
	//------------------------------
	//
	// Constructor
	//
	//------------------------------
	
	/**
	 * Constructor.
	 * 
	 * @param functionName The name of the function.
	 * @param id The id of this 
	 * <code class="prettyprint">FunctionToken</code>.
	 */
	public function FunctionToken(functionName:String, id:uint) 
	{
		this.functionName = functionName;
		this.id = id;
	}
	
}
	
}