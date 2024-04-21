import 'package:conversation_agent_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

String generatedText='''
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut faucibus pulvinar elementum integer enim neque volutpat ac. Maecenas ultricies mi eget mauris pharetra et ultrices. Faucibus in ornare quam viverra orci sagittis eu volutpat. Purus sit amet luctus venenatis. Placerat in egestas erat imperdiet. Adipiscing enim eu turpis egestas pretium aenean pharetra. Risus ultricies tristique nulla aliquet. Dignissim convallis aenean et tortor at risus viverra adipiscing. Odio ut enim blandit volutpat maecenas volutpat blandit aliquam. At lectus urna duis convallis. Lacus vel facilisis volutpat est velit egestas dui id ornare. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Pellentesque massa placerat duis ultricies lacus sed.

Nunc sed id semper risus. Scelerisque in dictum non consectetur a erat nam. Dictum at tempor commodo ullamcorper a lacus vestibulum sed. Est velit egestas dui id. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras. Habitant morbi tristique senectus et netus. Scelerisque fermentum dui faucibus in ornare quam viverra. Fames ac turpis egestas maecenas pharetra convallis posuere morbi leo. Gravida quis blandit turpis cursus. Et ultrices neque ornare aenean euismod elementum. Leo vel orci porta non pulvinar neque laoreet. Egestas maecenas pharetra convallis posuere morbi leo. Dolor sit amet consectetur adipiscing elit ut aliquam purus sit. Imperdiet proin fermentum leo vel orci porta non. Ac tincidunt vitae semper quis lectus. Posuere urna nec tincidunt praesent semper feugiat nibh.

Dui sapien eget mi proin. At in tellus integer feugiat scelerisque. Faucibus vitae aliquet nec ullamcorper sit amet risus nullam eget. Et leo duis ut diam quam nulla porttitor massa. Convallis aenean et tortor at risus. Amet nulla facilisi morbi tempus iaculis urna id volutpat lacus. Diam ut venenatis tellus in metus. Iaculis eu non diam phasellus vestibulum lorem sed risus ultricies. Diam maecenas sed enim ut sem viverra aliquet. Commodo viverra maecenas accumsan lacus vel facilisis volutpat. Sed blandit libero volutpat sed. Quis imperdiet massa tincidunt nunc. Bibendum at varius vel pharetra vel. Cursus euismod quis viverra nibh cras. Sollicitudin tempor id eu nisl nunc mi ipsum faucibus. Tellus mauris a diam maecenas sed. Volutpat maecenas volutpat blandit aliquam etiam erat. Nec tincidunt praesent semper feugiat.

Arcu dictum varius duis at consectetur. Ac tortor vitae purus faucibus ornare suspendisse. Convallis posuere morbi leo urna molestie at elementum eu. Ac turpis egestas integer eget aliquet nibh. Diam quam nulla porttitor massa. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin. Mauris cursus mattis molestie a iaculis at erat pellentesque. Felis imperdiet proin fermentum leo vel orci porta. Nunc faucibus a pellentesque sit amet porttitor eget dolor morbi. Magna ac placerat vestibulum lectus mauris ultrices eros in cursus. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Purus gravida quis blandit turpis cursus. Id faucibus nisl tincidunt eget nullam non nisi est sit. At urna condimentum mattis pellentesque id. Facilisis gravida neque convallis a. Scelerisque in dictum non consectetur a erat nam. Dui id ornare arcu odio ut sem nulla pharetra diam. Facilisi morbi tempus iaculis urna. Et malesuada fames ac turpis egestas sed tempus urna et. Morbi tristique senectus et netus et malesuada fames.

In eu mi bibendum neque egestas congue quisque egestas. Quis commodo odio aenean sed adipiscing. Vehicula ipsum a arcu cursus vitae congue mauris rhoncus. Dolor sit amet consectetur adipiscing elit ut aliquam purus sit. Amet mauris commodo quis imperdiet massa tincidunt. Dictumst quisque sagittis purus sit amet. Sed odio morbi quis commodo odio aenean sed. Sit amet nisl purus in mollis. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta. Fusce id velit ut tortor. Pretium quam vulputate dignissim suspendisse. Id venenatis a condimentum vitae sapien pellentesque habitant. Sit amet nisl suscipit adipiscing bibendum est ultricies integer quis. Tristique senectus et netus et malesuada fames. Adipiscing commodo elit at imperdiet. Quam viverra orci sagittis eu volutpat odio. Eleifend mi in nulla posuere sollicitudin aliquam. Volutpat sed cras ornare arcu dui vivamus arcu. Faucibus scelerisque eleifend donec pretium vulputate sapien nec sagittis aliquam.
''';

String BASE_URL="https://api.openai.com/v1/chat/completions";

final convMsg=[
  {
    "msg": "A",
    "index": 0,
  },
  {
    "msg": "B",
    "index": 1,
  },
  {
    "msg": "C",
    "index": 0,
  },
  {
    "msg": "D",
    "index": 1,
  },
];

List<String> responses=[
  "Multiple Choice Questions",
  "Graduation or Higher",
  "ISC",
  "CBSE 12",
  "ICSE",
  "CBSE 10",
];

// List<DropdownMenuItem<String>>? get getResponseType{
//   List<DropdownMenuItem<String>>? responseTypes =
//   List<DropdownMenuItem<String>>.generate(
//       responses.length,
//           (index) => DropdownMenuItem(
//             value: responses[index],
//               child: TextWidget(
//                 label: responses[index],
//                 fontSize: 15,
//                 color: Colors.grey[100],
//               ),
//           ),
//   );
//   return responseTypes;
// }