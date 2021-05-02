import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toggel_client/data/model/time_entry_model.dart';
import 'package:toggel_client/modules/home/cubit/home_cubit.dart';
import 'package:toggel_client/shared/resource/style.dart';
import 'package:toggel_client/shared/util/utility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class TimeEntryList extends StatelessWidget {
  final List<TimeEntryModel> timeEntryList;

  const TimeEntryList(this.timeEntryList);

  @override
  Widget build(BuildContext Context) {
    return ListView.builder(
        itemCount: groupedByDate(timeEntryList).length,
        itemBuilder: (context, index) {
          String date = DateTime.now()
              .difference(DateTime.parse(
                  groupedByDate(timeEntryList).keys.elementAt(index)))
              .toString();

          return Column(
            children: [
              Card(
                  margin: EdgeInsets.symmetric(vertical: 15.0),
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          int.parse(date[0] + date[1]) <= 24
                              ? "ToDay"
                              : "${DateFormat.yMMMd().format(DateTime.parse(groupedByDate(timeEntryList).keys.elementAt(index)))}",
                          style: textStyle,
                        ),
                        Text(
                          timeEntryList[index].stop == null
                              ? "still running ---"
                              : timeDuration(
                                  Duration(seconds: sumTotalDuration(timeEntryList, index))),
                          style: textStyle,
                        ),
                      ],
                    ),
                  )),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: groupedByDate(timeEntryList)
                      .values
                      .elementAt(index)
                      .length,
                  itemBuilder: (context, index2) {
                    return InkWell(
                      onTap: () {
                        if (groupedByDate(timeEntryList)
                                .values
                                .elementAt(index)
                                .elementAt(index2)
                                .pid !=
                            null) {

                          context.read<HomeCubit>().getProjectName(groupedByDate(timeEntryList)
                                  .values
                                  .elementAt(index)
                                  .elementAt(index2)
                                  .pid)
                              .then((project) {
                            if (project.data.cid != null) {
                              context.read<HomeCubit>()
                                  .getClientName(project.data.cid)
                                  .then((client) {
                                return showAlertDialog(context, index, index2,
                                    projectName: project.data.name,
                                    clientName: client.data.name);
                              });
                            } else {
                              return showAlertDialog(context, index, index2);
                            }
                          });
                        } else {
                          return showAlertDialog(context, index, index2);
                        }
                      },
                      child: taskTimeEntryItem(index, index2),
                    );
                  }),
            ],
          );
        });
  }

  Widget taskTimeEntryItem(index, index2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(groupedByDate(timeEntryList)
                                .values
                                .elementAt(index)
                                .elementAt(index2)
                                .description ==
                            null
                        ? "No Description avaiable "
                        : groupedByDate(timeEntryList)
                            .values
                            .elementAt(index)
                            .elementAt(index2)
                            .description),
                    Text(groupedByDate(timeEntryList)
                                .values
                                .elementAt(index)
                                .elementAt(index2)
                                .stop ==
                            null
                        ? "still running oo"
                        : timeDuration(Duration(
                            seconds: groupedByDate(timeEntryList)
                                .values
                                .elementAt(index)
                                .elementAt(index2)
                                .duration)))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                groupedByDate(timeEntryList)
                            .values
                            .elementAt(index)
                            .elementAt(index2)
                            .tags
                            .length >
                        0
                    ? Row(
                        children: [
                          const Text("Tags :"),
                          ...groupedByDate(timeEntryList)
                              .values
                              .elementAt(index)
                              .elementAt(index2)
                              .tags
                              .map((e) => Text("#$e"))
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          )),
    );
  }

  Future<Widget> showAlertDialog(context, index, index2,
      {String projectName, String clientName}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                color: Colors.teal,
              ),
              padding: const EdgeInsets.fromLTRB(16.0, 34.0, 16.0, 42.0),
              height: 280.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      groupedByDate(timeEntryList)
                                  .values
                                  .elementAt(index)
                                  .elementAt(index2)
                                  .description ==
                              null
                          ? "No Description avaiable "
                          : " Task title : ${groupedByDate(timeEntryList).values.elementAt(index).elementAt(index2).description}",
                      style: textStyle),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      "Start : ${formatDate(DateTime.parse(groupedByDate(timeEntryList).values.elementAt(index).elementAt(index2).start).toIso8601String())}",
                      style: textStyle),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      groupedByDate(timeEntryList)
                                  .values
                                  .elementAt(index)
                                  .elementAt(index2)
                                  .stop ==
                              null
                          ? "End: The task Not Finished "
                          : "End : ${formatDate(DateTime.parse(groupedByDate(timeEntryList).values.elementAt(index).elementAt(index2).stop).toIso8601String())}",
                      style: textStyle),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      groupedByDate(timeEntryList)
                                  .values
                                  .elementAt(index)
                                  .elementAt(index2)
                                  .stop ==
                              null
                          ? "Duration : The Duration is unKnown"
                          : "Duration : ${timeDuration(Duration(seconds: groupedByDate(timeEntryList).values.elementAt(index).elementAt(index2).duration))}",
                      style: textStyle),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    projectName == null ? "" : "project Name: $projectName",
                    style: textStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    clientName == null ? "" : "client Name: $clientName",
                    style: textStyle,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
