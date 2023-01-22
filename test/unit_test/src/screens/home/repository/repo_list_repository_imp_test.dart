import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:search_github_repositories/src/screens/home/repository/repos_list_repository_imp.dart';

import 'repo_list_repository_imp_test.mocks.dart';

@GenerateMocks([Dio])
Future<void> main() async {
  MockDio mockDio = MockDio();
  late ReposListRepositoryImp repositoryImp;

  var options = BaseOptions(
    baseUrl: 'https://api.github.com',
    connectTimeout: 20000,
    receiveTimeout: 18000,
  );

  var response = '';

  setUp(() {
    repositoryImp = ReposListRepositoryImp();
    mockDio.options = options;
  });

  test('Successfully search repositories by name', () async {
    when(mockDio.get('/search/repositories', queryParameters: {
      'q': 'ai_barcode_web',
      'sort': 'name',
      'order': 'asc',
      'page': '0',
      'per_page': '10'
    }).whenComplete(() => response));

    var expected = {
      "total_count": 2,
      "incomplete_results": false,
      "items": [
        {
          "id": 347001050,
          "node_id": "MDEwOlJlcG9zaXRvcnkzNDcwMDEwNTA=",
          "name": "ai_barcode_web",
          "full_name": "pdliuw/ai_barcode_web",
          "private": false,
          "owner": {
            "login": "pdliuw",
            "id": 29451779,
            "node_id": "MDQ6VXNlcjI5NDUxNzc5",
            "avatar_url":
                "https://avatars.githubusercontent.com/u/29451779?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/pdliuw",
            "html_url": "https://github.com/pdliuw",
            "followers_url": "https://api.github.com/users/pdliuw/followers",
            "following_url":
                "https://api.github.com/users/pdliuw/following{/other_user}",
            "gists_url": "https://api.github.com/users/pdliuw/gists{/gist_id}",
            "starred_url":
                "https://api.github.com/users/pdliuw/starred{/owner}{/repo}",
            "subscriptions_url":
                "https://api.github.com/users/pdliuw/subscriptions",
            "organizations_url": "https://api.github.com/users/pdliuw/orgs",
            "repos_url": "https://api.github.com/users/pdliuw/repos",
            "events_url":
                "https://api.github.com/users/pdliuw/events{/privacy}",
            "received_events_url":
                "https://api.github.com/users/pdliuw/received_events",
            "type": "User",
            "site_admin": false
          },
          "html_url": "https://github.com/pdliuw/ai_barcode_web",
          "description": "support \"ai_barcode\" plugin web platform",
          "fork": false,
          "url": "https://api.github.com/repos/pdliuw/ai_barcode_web",
          "forks_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/forks",
          "keys_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/keys{/key_id}",
          "collaborators_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/collaborators{/collaborator}",
          "teams_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/teams",
          "hooks_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/hooks",
          "issue_events_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/issues/events{/number}",
          "events_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/events",
          "assignees_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/assignees{/user}",
          "branches_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/branches{/branch}",
          "tags_url": "https://api.github.com/repos/pdliuw/ai_barcode_web/tags",
          "blobs_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/git/blobs{/sha}",
          "git_tags_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/git/tags{/sha}",
          "git_refs_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/git/refs{/sha}",
          "trees_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/git/trees{/sha}",
          "statuses_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/statuses/{sha}",
          "languages_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/languages",
          "stargazers_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/stargazers",
          "contributors_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/contributors",
          "subscribers_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/subscribers",
          "subscription_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/subscription",
          "commits_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/commits{/sha}",
          "git_commits_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/git/commits{/sha}",
          "comments_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/comments{/number}",
          "issue_comment_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/issues/comments{/number}",
          "contents_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/contents/{+path}",
          "compare_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/compare/{base}...{head}",
          "merges_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/merges",
          "archive_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/{archive_format}{/ref}",
          "downloads_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/downloads",
          "issues_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/issues{/number}",
          "pulls_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/pulls{/number}",
          "milestones_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/milestones{/number}",
          "notifications_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/notifications{?since,all,participating}",
          "labels_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/labels{/name}",
          "releases_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/releases{/id}",
          "deployments_url":
              "https://api.github.com/repos/pdliuw/ai_barcode_web/deployments",
          "created_at": "2021-03-12T08:54:05Z",
          "updated_at": "2022-11-17T00:26:11Z",
          "pushed_at": "2022-06-13T12:21:58Z",
          "git_url": "git://github.com/pdliuw/ai_barcode_web.git",
          "ssh_url": "git@github.com:pdliuw/ai_barcode_web.git",
          "clone_url": "https://github.com/pdliuw/ai_barcode_web.git",
          "svn_url": "https://github.com/pdliuw/ai_barcode_web",
          "homepage": "",
          "size": 20,
          "stargazers_count": 3,
          "watchers_count": 3,
          "language": "Dart",
          "has_issues": true,
          "has_projects": true,
          "has_downloads": true,
          "has_wiki": true,
          "has_pages": false,
          "has_discussions": false,
          "forks_count": 10,
          "mirror_url": null,
          "archived": false,
          "disabled": false,
          "open_issues_count": 0,
          "license": {
            "key": "bsd-3-clause",
            "name": "BSD 3-Clause \"New\" or \"Revised\" License",
            "spdx_id": "BSD-3-Clause",
            "url": "https://api.github.com/licenses/bsd-3-clause",
            "node_id": "MDc6TGljZW5zZTU="
          },
          "allow_forking": true,
          "is_template": false,
          "web_commit_signoff_required": false,
          "topics": [],
          "visibility": "public",
          "forks": 10,
          "open_issues": 0,
          "watchers": 3,
          "default_branch": "master",
          "score": 1.0
        },
        {
          "id": 440715170,
          "node_id": "R_kgDOGkTHog",
          "name": "ai_barcode_web",
          "full_name": "liangzemian/ai_barcode_web",
          "private": false,
          "owner": {
            "login": "liangzemian",
            "id": 7534236,
            "node_id": "MDQ6VXNlcjc1MzQyMzY=",
            "avatar_url": "https://avatars.githubusercontent.com/u/7534236?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/liangzemian",
            "html_url": "https://github.com/liangzemian",
            "followers_url":
                "https://api.github.com/users/liangzemian/followers",
            "following_url":
                "https://api.github.com/users/liangzemian/following{/other_user}",
            "gists_url":
                "https://api.github.com/users/liangzemian/gists{/gist_id}",
            "starred_url":
                "https://api.github.com/users/liangzemian/starred{/owner}{/repo}",
            "subscriptions_url":
                "https://api.github.com/users/liangzemian/subscriptions",
            "organizations_url":
                "https://api.github.com/users/liangzemian/orgs",
            "repos_url": "https://api.github.com/users/liangzemian/repos",
            "events_url":
                "https://api.github.com/users/liangzemian/events{/privacy}",
            "received_events_url":
                "https://api.github.com/users/liangzemian/received_events",
            "type": "User",
            "site_admin": false
          },
          "html_url": "https://github.com/liangzemian/ai_barcode_web",
          "description": null,
          "fork": false,
          "url": "https://api.github.com/repos/liangzemian/ai_barcode_web",
          "forks_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/forks",
          "keys_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/keys{/key_id}",
          "collaborators_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/collaborators{/collaborator}",
          "teams_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/teams",
          "hooks_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/hooks",
          "issue_events_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/issues/events{/number}",
          "events_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/events",
          "assignees_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/assignees{/user}",
          "branches_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/branches{/branch}",
          "tags_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/tags",
          "blobs_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/git/blobs{/sha}",
          "git_tags_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/git/tags{/sha}",
          "git_refs_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/git/refs{/sha}",
          "trees_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/git/trees{/sha}",
          "statuses_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/statuses/{sha}",
          "languages_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/languages",
          "stargazers_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/stargazers",
          "contributors_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/contributors",
          "subscribers_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/subscribers",
          "subscription_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/subscription",
          "commits_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/commits{/sha}",
          "git_commits_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/git/commits{/sha}",
          "comments_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/comments{/number}",
          "issue_comment_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/issues/comments{/number}",
          "contents_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/contents/{+path}",
          "compare_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/compare/{base}...{head}",
          "merges_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/merges",
          "archive_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/{archive_format}{/ref}",
          "downloads_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/downloads",
          "issues_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/issues{/number}",
          "pulls_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/pulls{/number}",
          "milestones_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/milestones{/number}",
          "notifications_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/notifications{?since,all,participating}",
          "labels_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/labels{/name}",
          "releases_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/releases{/id}",
          "deployments_url":
              "https://api.github.com/repos/liangzemian/ai_barcode_web/deployments",
          "created_at": "2021-12-22T02:58:14Z",
          "updated_at": "2021-12-23T09:58:52Z",
          "pushed_at": "2021-12-23T09:58:49Z",
          "git_url": "git://github.com/liangzemian/ai_barcode_web.git",
          "ssh_url": "git@github.com:liangzemian/ai_barcode_web.git",
          "clone_url": "https://github.com/liangzemian/ai_barcode_web.git",
          "svn_url": "https://github.com/liangzemian/ai_barcode_web",
          "homepage": null,
          "size": 29712,
          "stargazers_count": 0,
          "watchers_count": 0,
          "language": "JavaScript",
          "has_issues": true,
          "has_projects": true,
          "has_downloads": true,
          "has_wiki": true,
          "has_pages": true,
          "has_discussions": false,
          "forks_count": 0,
          "mirror_url": null,
          "archived": false,
          "disabled": false,
          "open_issues_count": 0,
          "license": null,
          "allow_forking": true,
          "is_template": false,
          "web_commit_signoff_required": false,
          "topics": [],
          "visibility": "public",
          "forks": 0,
          "open_issues": 0,
          "watchers": 0,
          "default_branch": "master",
          "score": 1.0
        }
      ]
    };

    expect(
      await repositoryImp.getRepos(query: 'ai_barcode_web', page: 0),
      expected,
    );
  });
}
