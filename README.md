# ProgressDialogTest
the initial crash error will read:

_`[VERBOSE-2:ui_dart_state.cc(148)] Unhandled Exception: NoSuchMethodError: The method 'update' was called on null.
Receiver: null
Tried calling: update()
#0      Object.noSuchMethod (dart:core-patch/object_patch.dart:51:5)
#1      ProgressDialog.update (package:progress_dialog/progress_dialog.dart:83:29)
#2      _ProgressTestPageState.build.<anonymous closure>.<anonymous closure> (package:progress_dialog_test/progress_test_page.dart:37:68)
<asynchronous suspension>
#3      SchedulerBinding._invokeFrameCallback (package:flutter/src/scheduler/binding.dart:1033:15)
#4      SchedulerBinding.handleDrawFrame (package:flutter/src/scheduler/binding.dart:983:9)
#5      SchedulerBinding._handleDrawFrame (package:flutter/src/scheduler/binding.dart:891:5)
#6      _rootRun (dart:async/zone.dart:1124:13)
#7      _CustomZone.run (dart:async/zone.dart:1021:19)
#8      _CustomZone.runGuarded (dart:async/zone.dart:923:7)
#9      _invoke (dart:ui/hooks.dart:249:10)
#10     _drawFrame (dart:ui/hooks.dart:207:3)`_

This happens because the dialog becomes null. 

To get to the following crash error:

_`Unhandled Exception: setState() called in constructor: (lifecycle state: created, no widget, not mounted) This happens when you call setState() on a State object for a widget that hasn't been inserted into the widget tree yet. It is not necessary to call setState() in the constructor, since the state is already assumed to be dirty when it is initially created.`_

re-initialize the dialog on show.
