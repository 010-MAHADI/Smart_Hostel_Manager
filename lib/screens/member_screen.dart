// lib/screens/member_screen.dart
import 'package:flutter/material.dart';
import '../models/member.dart';
import '../services/member_service.dart';

class MemberScreen extends StatefulWidget {
  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  final MemberService _memberService = MemberService();
  List<Member> _members = [];

  @override
  void initState() {
    super.initState();
    _fetchMembers();
  }

  Future<void> _fetchMembers() async {
    List<Member> members = await _memberService.getMembers();
    setState(() {
      _members = members;
    });
  }

  void _updateBalance(Member member) {
    // Code to update member balance
  }

  void _viewMemberProfile(Member member) {
    // Code to view and edit member profile
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Members')),
      body: ListView.builder(
        itemCount: _members.length,
        itemBuilder: (context, index) {
          final member = _members[index];
          return ListTile(
            title: Text(member.name),
            subtitle: Text('Balance: ${member.balance}'),
            onTap: () => _viewMemberProfile(member),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _updateBalance(member),
            ),
          );
        },
      ),
    );
  }
}
