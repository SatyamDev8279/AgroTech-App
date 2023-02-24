// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Govsites extends StatefulWidget {
  const Govsites({Key? key}) : super(key: key);

  @override
  State<Govsites> createState() => _GovsitesState();
}

class _GovsitesState extends State<Govsites> {
  // Future<void> _launchURL(String url) async {
  //   final Uri uri = Uri(scheme: "https",host: url);
  //   if(!await launchUrl(uri,mode: LaunchMode.externalApplication,)){
  //     throw "Can't launch URL";
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
        backgroundColor: Colors.green.shade500,
          centerTitle: true,
            title: Text("Helpful Sites"),),
        body: ListView(
          children: [
            ListTile(
              title: Text(
                'News For Government Schemes'
              ),
              // subtitle: Text(
              //   'The site will tell you for the upcoming weather updates.'
              // ),
              onTap: ()async {
                final websiteurl = Uri.parse('https://agricoop.nic.in/');
                String websitelink = 'https://agricoop.nic.in/';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {
                  print("can't launch $websiteurl");
                }
              },
            ),
            ListTile(
              title: Text(
                'Farmers Portal'
              ),
              // subtitle: Text(
              //   'The site will give all governmentak news'
              // ),
              onTap: () async{
                final websiteurl = Uri.parse('https://www.india.gov.in/');
                String websitelink = 'https://www.india.gov.in/';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {
                  print("can't launch $websiteurl");
                }
              },
            ),
            ListTile(
              title: Text(
                  'Farmers Support'
              ),
              subtitle: Text(
                'Support , News and schemes'
              ),
              onTap: () async{
                final websiteurl = Uri.parse('https://farmer.gov.in/');
                String websitelink = 'https://farmer.gov.in/';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {
                  print("can't launch $websiteurl");
                }
              },
            ),
            ListTile(
              title: Text(
                  'Official Indian Site for Farmers'
              ),
              subtitle: Text(
                  ' topics › agriculture - Official agriculture site for updates and official work'
              ),
              onTap: () async{
                final websiteurl = Uri.parse('https://www.india.gov.in/');
                String websitelink = 'https://www.india.gov.in/';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {
                  print("can't launch $websiteurl");
                }
              },
            ),

            ListTile(
              title: Text(
                  'Official Indian Site for Farmers'
              ),
              subtitle: Text(
                  ' topics › agriculture - Official agriculture site for updates and official work'
              ),
              onTap: () async{
                final websiteurl = Uri.parse('https://www.india.gov.in/');
                String websitelink = 'https://www.india.gov.in/';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {
                  print("can't launch $websiteurl");
                }
              },
            ),
            ListTile(
              title: Text(
                  'VoiceCall helpLine'
              ),
              subtitle: Text(
                  ' A 24x7 voice call helpline for farmers'
              ),
              onTap: () async{
                final websiteurl = Uri.parse('https://mkisan.gov.in');
                String websitelink = 'https://mkisan.gov.in';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {
                  print("can't launch $websiteurl");
                }
              },
            ),
            ListTile(
              title: Text(
                  'Internation Support '
              ),
              subtitle: Text(
                  'nternational Community for Farmers and agriculture Agricultural Development | Bill & Melinda Gates Foundation'
              ),
              onTap: () async{
                final websiteurl = Uri.parse('https://www.ifad.org/');
                String websitelink = 'https://www.ifad.org/';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {
                  print("can't launch $websiteurl");
                }
              },
            ),

            ListTile(
              title: Text(
                  'Voi'
              ),
              subtitle: Text(
                  ' A 24x7 voice call helpline for farmers'
              ),
              onTap: () async{
                final websiteurl = Uri.parse('https://mkisan.gov.in');
                String websitelink = 'https://mkisan.gov.in';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {
                  print("can't launch $websiteurl");
                }
              },
            ),

          ],
        ),
      ),
    );
  }
}
