[![Experimental Project header](https://github.com/newrelic/opensource-website/raw/master/src/images/categories/Experimental.png)](https://opensource.newrelic.com/oss-category/#experimental)

# New Relic Video Agent for iOS & tvOS


The New Relic Video Agent for iOS & tvOS contains multiple modules necessary to instrument video players and send data to New Relic.

## Modules

There are three modules available:

### NewRelicVideoCore

Contains all the base classes necessary to create trackers and send data to New Relic. It depends on the New Relic Agent.

### NRAVPlayerTracker

The video tracker for AVPlayer player. It depends on NewRelicVideoCore.

### NRIMATracker

The video tracker for Google IMA Ads library. It depends on NewRelicVideoCore.

## Installation

### Install automatically using Cocoapods

Add the following lines to your Podfile:

```
  pod 'NewRelicVideoCore', :git => 'https://github.com/newrelic/video-agent-iOS'
  pod 'NRAVPlayerTracker', :git => 'https://github.com/newrelic/video-agent-iOS'
  pod 'NRIMATracker', :git => 'https://github.com/newrelic/video-agent-iOS'
```

### Install manually

First install the [New Relic iOS Agent](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-ios/installation/ios-manual-installation).

1. Clone this repo.
2. Open each one of the .xcodeproj files with Xcode.
3. Select the appropiate scheme.
4. Build (cmd+B).
5. Include the generated .framework in your project.

## Usage

To start the video agent with AVPlayer tracker only:

<details>
<summary>Objective-C</summary>
<p>

```Objective-C
NSNumber *trackerId = [[NewRelicVideoAgent sharedInstance] startWithContentTracker:[[NRTrackerAVPlayer alloc] initWithAVPlayer:player]];
```

</p>
</details>
<details>
<summary>Swift</summary>
<p>

```Swift
let trackerId = NewRelicVideoAgent.sharedInstance().start(withContentTracker: NRTrackerAVPlayer.init(avPlayer: player))
```

</p>
</details>

To start the video agent with AVPlayer and IMA trackers:

<details>
<summary>Objective-C</summary>
<p>

```Objective-C
NSNumber *trackerId = [[NewRelicVideoAgent sharedInstance] startWithContentTracker:[[NRTrackerAVPlayer alloc] initWithAVPlayer:player] adTracker:[[NRTrackerIMA alloc] init]];
```

</p>
</details>
<details>
<summary>Swift</summary>
<p>

```Swift
let trackerId = NewRelicVideoAgent.sharedInstance().start(withContentTracker: NRTrackerAVPlayer.init(avPlayer: player), adTracker: NRTrackerIMA.init())
```

</p>
</details>

## Documentation

To generate source code documentation, you can use [appledoc](https://github.com/tomaz/appledoc) as follows:

```bash
appledoc --project-name NewRelicVideoAgent --project-company "New Relic Inc." --company-id com.newrelic --create-html --no-create-docset --output ./docs NewRelicVideoCore/NewRelicVideoCore/**/*.h
```

And then open `docs/html/index.html` with your prefered browser.

The source code annotations are compatible with Doxygen, so you would rather use it if you prefer.

For more detail on the Events and Data Model generated by Video Agent for Android and for advanced concepts such as creating custom trackers, reference the [Advanced Topics](advanced.md) manual.

## Examples

The `Examples` folder contains all the usage examples.

## Testing

The `Test` folder contains the test apps.

## Support

New Relic has open-sourced this project. This project is provided AS-IS WITHOUT WARRANTY OR DEDICATED SUPPORT. Issues and contributions should be reported to the project here on GitHub.

We encourage you to bring your experiences and questions to the [Explorers Hub](https://discuss.newrelic.com) where our community members collaborate on solutions and new ideas.

## Contributing

We encourage your contributions to improve New Relic Video Agent! Keep in mind when you submit your pull request, you'll need to sign the CLA via the click-through using CLA-Assistant. You only have to sign the CLA one time per project. If you have any questions, or to execute our corporate CLA, required if your contribution is on behalf of a company, please drop us an email at opensource@newrelic.com.

**A note about vulnerabilities**

As noted in our [security policy](../../security/policy), New Relic is committed to the privacy and security of our customers and their data. We believe that providing coordinated disclosure by security researchers and engaging with the security community are important means to achieve our security goals.

If you believe you have found a security vulnerability in this project or any of New Relic's products or websites, we welcome and greatly appreciate you reporting it to New Relic through [our bug bounty program](https://docs.newrelic.com/docs/security/security-privacy/information-security/report-security-vulnerabilities/).

## License

New Relic Video Agent is licensed under the [Apache 2.0](http://apache.org/licenses/LICENSE-2.0.txt) License.
