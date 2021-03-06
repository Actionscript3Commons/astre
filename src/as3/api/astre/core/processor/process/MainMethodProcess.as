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

package astre.core.processor.process 
{
    import astre.core.TestError;
	import astre.core.processor.process.ETestProcessPhase;
	import astre.api.ignore;
	import astre.api.Test;

/**
 * A <code class="prettyprint">MainMethodProcess</code> runs the 
 * main test method of the 
 * <code class="prettyprint">Test</code> to which this 
 * <code class="prettyprint">MainMethodProcess</code> is part of.
 * 
 * <p>An <code class="prettyprint">MainMethodProcess</code> participates to 
 * the <code class="prettyprint">ETestProcessPhase.MAIN_METHOD</code> 
 * phase.</p>
 * 
 * @author lunar
 * 
 */
public class MainMethodProcess extends SyncMethodProcess
{
	
	//------------------------------
	//
	// Constructor
	//
	//------------------------------
	
	/**
	 * Constructor.
	 * 
	 * @param test The test from which this 
	 * <code class="prettyprint">ITestProcess</code> is part of.
	 */
	public function MainMethodProcess(test:Test) 
	{
		super(test, ETestProcessPhase.MAIN_METHOD);
	}
	
	//------------------------------
	//
	// Methods
	//
	//------------------------------
	
	/**
	 * Runs the main test method of the 
	 * <code class="prettyprint">Test</code> this 
	 * <code class="prettyprint">MainMethodProcess</code> is part of.
	 */
	override protected function runSyncProcess():void 
	{
        use namespace ignore;
        try 
        {
            var testMethod:Function = test[test.name];
        } catch (re:ReferenceError)
        {
            throw new TestError("There is no test name specified "+
                "for this test or the method does not exist.", 
            re
            );
        }
        catch (te:TypeError)
        {
            throw new TestError("The error for the following reason : "+
                "The test method to run does not exist or the method is "+
                "declared in both ignore and public namespaces", 
            te
            );
        }
        test[test.name].apply(test);
	}
	
}
	
}
