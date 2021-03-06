//------------------------------------------------------------------------------
//  Copyright (c) 2011 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.migration
{
	import org.robotlegs.adapters.SwiftSuspendersInjector;
	import org.robotlegs.adapters.SwiftSuspendersReflector;
	import org.robotlegs.base.CommandMap;
	import org.robotlegs.base.EventMap;
	import org.robotlegs.base.MediatorMap;
	import org.robotlegs.base.ViewMap;
	import org.robotlegs.core.ICommandMap;
	import org.robotlegs.core.IEventMap;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.IMediatorMap;
	import org.robotlegs.core.IReflector;
	import org.robotlegs.core.IViewMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.impl.RobotlegsInjector;

	public class MigrationExtension implements IExtension
	{

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		public function extend(context:IContext):void
		{

			const injector:RobotlegsInjector = context.injector as RobotlegsInjector;
			injector.map(IInjector).toValue(new SwiftSuspendersInjector(injector));
			injector.map(IReflector).toSingleton(SwiftSuspendersReflector);
			injector.map(ICommandMap).toSingleton(CommandMap);
			injector.map(IMediatorMap).toSingleton(MediatorMap);
			injector.map(IViewMap).toSingleton(ViewMap);
			injector.map(IEventMap).toType(EventMap);
		}
	}
}
