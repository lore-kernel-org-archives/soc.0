Return-Path: <SRS0=KrAf=ID=fujitsu.com=tan.shaopeng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFA9C433E0
	for <soc@archiver.kernel.org>; Fri,  5 Mar 2021 08:11:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4062964E45; Fri,  5 Mar 2021 08:11:36 +0000 (UTC)
X-Greylist: delayed 64 seconds by postgrey-1.34 at mail.kernel.org; Fri, 05 Mar 2021 08:11:35 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E16064F0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=tan.shaopeng@fujitsu.com
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com [216.71.156.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E16064F0B;
	Fri,  5 Mar 2021 08:11:35 +0000 (UTC)
IronPort-SDR: Lka/CSSIbKRZwU/cslHDr0JfQNGQCyV/O1TTN/yM6ZMLz12jraBlO8w9gIESdkcDkBfOL8bzkO
 6xZw1UFhAhI7KYQB7qhH0FwshJYGYjVSUq9ngh054vHzmwOAPNYuPJs+cqHZJ/w0xKR7+u11e2
 Dn4L9BXJ6m20yvz6GIYHzkq5MjWm4voaFWuuEe9SJDrToOmllXcLSstzwaEI532qVnhh2xrLjE
 Wjzrn4NQ837/kr5UKOV/TXSGIoBEX5RquGfZ0OF1R7Ai4PuV6A63g50MkO5HErK9aSmkH7SOJA
 CBo=
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="27442756"
X-IronPort-AV: E=Sophos;i="5.81,224,1610377200"; 
   d="scan'208";a="27442756"
Received: from mail-os2jpn01lp2056.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.56])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 17:10:29 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsXz6Jz7IVfwpBSSQGsSOnIgJ9U3lC10uNpQdJZa+9nmK41eOQw4jN4g1jhs0QSyj9J+3rq6cvzS3j+280lLDDVvj/mK0V1o3qXHgxHMV4xBsgceikllpVZlOanjeoQn+pOzPdd1q8V/s4mxCa9EFMTmkzw+BA44MG+UWzs84siCMdBJV37v/NMA1CmYQ1hP2TUBjqJj/p0NmMZ6Bxc6/s71P2loPCrjlkaolER7KSdcgfjAAf2+ng+0DIyFPzRE6epf5vX39i6RCQqINmjF/rlJfzigXuhpjqRIRlViq0+wJa7TYJnX8DS71yYxFbVr/2GjOhghvfV/d74mooWdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytrrxufPJjyK3sejC8T6l6ArjtqCfCg0LGMWLMMkKfA=;
 b=X4T4JmZkeLyEjJkvbfX+hSvC7qaB9OmTiiJs5gNZbntCcMA1Ky24L7eNU7aSBE7RZqlKPbxYfEbeiFmtyC8AotbELHirMHRsdb2vWziDx1Iznv1avI7zxhewWEkbN1dvZcOLRLxBNnXVe3WvDkZGnL1AFJTU12hVRv3B0vkV2LJ7pKDAiG7JwedjzCa5ZmtpCGRepGiig+cuamSFBmFZS51URyDS89EiNMC5Hh6sq8UCDRHxJQ8DmEQ+rzM/uFoEhTkLnErUQQaKORZ/9ceBS3+0qyRhTN/b5E5hI6XPww4VMUOtlHLTfhQ+lTAbgCDAMug7+wIC8YeKBxtOTurXvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytrrxufPJjyK3sejC8T6l6ArjtqCfCg0LGMWLMMkKfA=;
 b=TnN6K02vOYItcWLL5o4gZobAqUEZ1tC3etKuqHi/mQ4Hi1tzxe5tnE1vQJQyKWMCmfNZd0J6Er4WqV7Mbx7r5KMb6q2wO4LOoUsF0Vn5+okIxPU+1sURAr8oTBQeelRTZ44R36hGDi9vIgFR0K3dZRVSQZoK/gZzhz7foytu0Mc=
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com (2603:1096:603:15::15)
 by OS3PR01MB6324.jpnprd01.prod.outlook.com (2603:1096:604:f2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 08:10:25 +0000
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d]) by OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d%6]) with mapi id 15.20.3890.032; Fri, 5 Mar 2021
 08:10:25 +0000
From: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
To: 'Arnd Bergmann' <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team
	<soc@kernel.org>, Will Deacon <will@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>,
	"misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>,
	"tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
Subject: RE: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Topic: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Index: AQHXEBESAJcmfc8h0U6q78FjB96JBapyH1gAgAGCoFCAAAdxgIABXnvA
Date: Fri, 5 Mar 2021 08:10:25 +0000
Message-ID:
 <OSAPR01MB2146C723F0194BF88D9C04FA8B969@OSAPR01MB2146.jpnprd01.prod.outlook.com>
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
 <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
 <CAK8P3a17oRP=mU09ypPSxY3ms=fCROxk8SXo0S+CQpdtvsoHXA@mail.gmail.com>
In-Reply-To:
 <CAK8P3a17oRP=mU09ypPSxY3ms=fCROxk8SXo0S+CQpdtvsoHXA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [210.162.30.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 002918c5-32fe-49de-e70b-08d8dfae21d5
x-ms-traffictypediagnostic: OS3PR01MB6324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <OS3PR01MB63248CE48C6870031966D9FB8B969@OS3PR01MB6324.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Hnieb/DtYVAn5D5CxxULkQW2IrqtBqInWC9HA/9WsFBgsKw2b/SIlanrp3nN4Q1eWpAafEDvdAJFK+Mh+5H2SG3XakHG1n03YyQJNhxwbgU7YDuOqbr5w1gvbmzlyDX1UKMferzYTo0/FmlY+ycB8ZfZewKwlQjjpvNN3RdpuXJG2O6trX82NwIHDaoTfWUI5ARZsGLsfg0erDvK3MaWjs+naghcbS64cgNlVaAEI5nYMpNruImHlOSM1AYM3weiqWE7u34Paw2O7JP9KdXSwvXF9E9gEZXNrY1dB+F2frUXSnlInaucC0uyOrBsg3p0LXqdC7iogP+tTjtL6BJwuXzIKgp9Sglvtm9p9VpJ3Op8hHKxbgfThZ4naTy2N+NHX/M1egXGhO2aUjnniaMFMzEaJI4zSaY9PVHhquhpEUX+OiGlmX4emHny+Vhrl72hBC1FWfXalkegieHu4asBFZFICGLV+BxowAFOitvHTtueHIV97CrkoBqP7jSRTlklHxvUxobmzvmx1G4o+wZXmw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2146.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(5660300002)(6506007)(53546011)(54906003)(7696005)(71200400001)(2906002)(478600001)(6916009)(85182001)(186003)(52536014)(8936002)(76116006)(26005)(64756008)(107886003)(55016002)(83380400001)(66476007)(33656002)(8676002)(86362001)(66946007)(4326008)(66556008)(66446008)(9686003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?bHV6MHp4NGp0NThoSzkzNHBUYWpLblNRd1NVVUxWZ3J2K25JU2JDb0VsU1N0?=
 =?utf-8?B?SVo5enpiVEhGUUtta0tEY01MN21pVEZLbSt1eERBOWVkejROb1QzMnowWWxk?=
 =?utf-8?B?eXpOVFBJQlB1cXp2KzZWOVMxYTZvVnQxdFEyYVVwMnBMSVZXM3BZV1Y2TFJv?=
 =?utf-8?B?YUZEc0ZuZk9qYjU0b3ZEUnk2RlVyOURGUEV6eW1RZTVjTWl5ZVNkTUI3R0cw?=
 =?utf-8?B?QmNrUWtqcGFScGxId3lZdVp6dWw2ZzlqYzFzN3NmYmdEZ2dtTmFVdlBvRTBB?=
 =?utf-8?B?U0FCYzJEU0RiOHVnWkJQZGU5U3FBaVNPL3Z4bHg5ejMxUDR3YlczYVQ1WEQ1?=
 =?utf-8?B?MFA4Z0txM2ZzbGJWdnZLclhkbFVYeWZma29Zb0tkYUlYVFRsZmZsM0Z1ZDNT?=
 =?utf-8?B?R055OExCVWF4VjU2Ky9ETS9mRkFMV2pJRWw2dmx1cVFXekFFanBzbmp2MHla?=
 =?utf-8?B?eU1RWXRVT1hYbWdMQ2JsWlBFK1R0TWFjRFpSandMRy9FaVBrdlpZVlRFWmg0?=
 =?utf-8?B?Y0JiKzdWT1h3c3hRZFRaZ096OEFyOFdHdld2bVpTcWE3Ni85T0RLSmxsYzhl?=
 =?utf-8?B?cFZobG9WZ3FKbEJXRHltZE52LzI5clNya3BrTWFxUFhUYjEzbEdJMGFNWkRh?=
 =?utf-8?B?WVRXUGhqMkpJVHhEQmhwb1pGUlRuYk4zNnh3Y0p6ZEIzRTNFYmxNV29rS3dE?=
 =?utf-8?B?N2VJRGczQ3JHcFpBc1RxS1lwZGJFVFlJS25NLzBGSkR6UXBjbG5JazdwaVFL?=
 =?utf-8?B?THUrTGN3aGJSc3hUYSt6MDQ0N0tIQ3YxQVBxR1RONUoyMCtKNUh4NzRMaW9q?=
 =?utf-8?B?aGZ4c0VGTnRGTk9jSURvVTIrRG4renlxSEZqYjlSdmdkUVNlaDh1dlVKRWVa?=
 =?utf-8?B?MWFhYjF5UHMrdEpzSWxKbXdETXNtSy8rRy9rR0hSZjZoNnZWekpReExHWHdQ?=
 =?utf-8?B?Tkwxekc4THZEVHNWZk5mS0tEaHR1ZzFqbFUwS0NBZlo5cGpNM0VuUUc2Y0l3?=
 =?utf-8?B?Q0NWblBXamgrcjVuUkV2L0p0Y3I3cUV6Z01vNU9WWHY4ditKZm53VTVsNk5W?=
 =?utf-8?B?Szl4YSt6SWpvT3RwUHhaZU9RUVVtZzBTWGVwK25LdU55a2x4NEpQZVFKcXhx?=
 =?utf-8?B?YVZPbUgrcnRxbHlzTy95cmRxY01oS0ppUExZVUFUUmF1ZTMzbTlWN3ZhUUpN?=
 =?utf-8?B?UjZCMG8zV0hYK2s2STVKWm44SGE1a1pqc200Z1IwcDNXSmlibG5RMzdVNWxp?=
 =?utf-8?B?OG8wTFVJRnNDelpOWndncmdobmFQV28vRklMbVpPa2ZsWW96NjhWRitjY0w0?=
 =?utf-8?B?Smh2RTlZRmRjSERESFBLcUVzR1F2eXVPZGJFRGVNTk80RTU5S2dvNmpaU1NQ?=
 =?utf-8?B?cXY2UWhLZWhNcUFmdldjMVhtMmdBdmkzMGlQZXhGa0U2UE5CWmJjT0pCZ3NP?=
 =?utf-8?B?dmFYN0NvMTRIVVJRWXZBbFpadE5WdWFNa3ZCem9NSEtqbVEvcTdVTXkxbHd6?=
 =?utf-8?B?VjArNkVlQU96Y2g5N2NDbFkxT0lUNWg3ZVlPMk1SeHhMTmtXWXRwemFqcnZB?=
 =?utf-8?B?T1RRZEM1bUVlcDlSUmp5UkhHcks2K2JUTjdiODhsZFJVRFNvKzVRcnNJYzFP?=
 =?utf-8?B?NUhmYnJDcFJHRWNIRUtCLzRvbWluQ2RHcDJHQ1FGSzhsd1NuOHdNd3R3R3Ja?=
 =?utf-8?B?RDNaZVVFQTAxa0dSRDhVSWJlelJSVkUwR3NBVnI3VS8vVWkvV0NBVUIyalVW?=
 =?utf-8?Q?ucJMjwvLUaGX+K4ERdp720+oi1gR6hygcjMniay?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2146.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002918c5-32fe-49de-e70b-08d8dfae21d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2021 08:10:25.6635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWrpgSvQMg3zM8uW5h3SQVW2LYLoGRQ8YeFoqVmvo2qzr6A3908ohzjhuL9j2dSAmp2CsRREq5xaDJLB6eEHpwV/c4CtclmdmczvMTdtNLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6324

PiBPbiBUaHUsIE1hciA0LCAyMDIxIGF0IDExOjM0IEFNIHRhbi5zaGFvcGVuZ0BmdWppdHN1LmNv
bQ0KPiA8dGFuLnNoYW9wZW5nQGZ1aml0c3UuY29tPiB3cm90ZToNCj4gPiA+IE9uIFdlZCwgTWFy
IDMsIDIwMjEgYXQgMTA6MzggQU0gdGFuLnNoYW9wZW5nDQo+ID4gPiA8dGFuLnNoYW9wZW5nQGpw
LmZ1aml0c3UuY29tPiB3cm90ZToNCj4gDQo+ID4gPiA+ICttb2R1bGVfcGFyYW0odGFnYWRkcl9j
dHJsX3JlZywgdWxvbmcsIDA0NDQpOw0KPiA+ID4gPiArTU9EVUxFX1BBUk1fREVTQyh0YWdhZGRy
X2N0cmxfcmVnLCAiSFBDIHRhZyBhZGRyZXNzIG92ZXJyaWRlDQo+ID4gPiBjb250cm9sIHJlZ2lz
dGVyIik7DQo+ID4gPiA+ICttb2R1bGVfcGFyYW0oaHdwZl9jdHJsX3JlZywgdWxvbmcsIDA0NDQp
Ow0KPiA+ID4gPiArTU9EVUxFX1BBUk1fREVTQyhod3BmX2N0cmxfcmVnLCAiaGFyZHdhcmUgcHJl
ZmV0Y2ggYXNzaXN0DQo+IGNvbnRyb2wNCj4gPiA+IHJlZ2lzdGVyIik7DQo+ID4gPiA+ICttb2R1
bGVfcGFyYW0oc2VjX2N0cmxfcmVnLCB1bG9uZywgMDQ0NCk7DQo+ID4gPiA+ICtNT0RVTEVfUEFS
TV9ERVNDKHNlY19jdHJsX3JlZywgInNlY3RvciBjYWNoZSBjb250cm9sIHJlZ2lzdGVyIik7DQo+
ID4gPiA+ICttb2R1bGVfcGFyYW0oc2VjX2Fzc2lnbl9yZWcsIHVsb25nLCAwNDQ0KTsNCj4gPiA+
ID4gK01PRFVMRV9QQVJNX0RFU0Moc2VjX2Fzc2lnbl9yZWcsICJzZWN0b3IgY2FjaGUgYXNzaWdu
DQo+IHJlZ2lzdGVyIik7DQo+ID4gPiA+ICttb2R1bGVfcGFyYW0oc2VjX3NldDBfbDJfcmVnLCB1
bG9uZywgMDQ0NCk7DQo+ID4gPiA+ICtNT0RVTEVfUEFSTV9ERVNDKHNlY19zZXQwX2wyX3JlZywg
InNlY3RvciBjYWNoZSBMMiB3YXkNCj4gPiA+IHJlZ2lzdGVyKHNlY3Rvcj0wLDEpIik7DQo+ID4g
PiA+ICttb2R1bGVfcGFyYW0oc2VjX3NldDFfbDJfcmVnLCB1bG9uZywgMDQ0NCk7DQo+ID4gPiA+
ICtNT0RVTEVfUEFSTV9ERVNDKHNlY19zZXQxX2wyX3JlZywgInNlY3RvciBjYWNoZSBMMiB3YXkN
Cj4gPiA+IHJlZ2lzdGVyKHNlY3Rvcj0yLDMpIik7DQo+ID4gPg0KPiA+ID4gTXkgZmVlbGluZyBp
cyB0aGF0IHRoZSBhY3R1YWwgc2V0dGluZ3MgbmVlZCB0byBiZSBvbiBhIGhpZ2hlciBsZXZlbCwg
bm90IHRpZWQNCj4gPiA+IHRvIHRoZSBzcGVjaWZpYyByZWdpc3Rlci1sZXZlbCBpbXBsZW1lbnRh
dGlvbiBvZiB0aGlzIGNoaXAuIE5vcm1hbGx5LCAgdGhlIEwyDQo+ID4gPiBjYWNoZSBpcyBzZXQg
dXAgYnkgdGhlIGZpcm13YXJlIGFjY29yZGluZyB0byBsb2NhbCBwb2xpY3ksIGFuZCB0aGUgc2V0
dGluZ3MNCj4gPiA+IGNhbiBlaXRoZXIgYmUgcmVhZCBieSB0aGUga2VybmVsIGZyb20gcmVnaXN0
ZXJzIG9yIHBhc3NlZCBkb3duIHRocm91Z2ggdGhlDQo+ID4gPiBkZXZpY2UgdHJlZS4gSXQgc291
bmRzIGxpa2UgeW91IHdhbnQgdG8gY29udHJvbCB0aGUgcG9saWN5IGF0IHJ1bnRpbWUgaW4gdGhl
DQo+ID4gPiBvcGVyYXRpbmcgc3lzdGVtIHJhdGhlciB0aGFuIGF0IGJvb3QgdGltZSwgc28gZm9y
IGVhY2ggc2V0dGluZyB5b3Ugd2lzaCB0bw0KPiA+ID4gb3ZlcnJpZGUsIHRoZXJlIHNob3VsZCBi
ZSBkZXNjcmlwdGlvbiBvZiB3aGF0IHRoZSBzZXR0aW5nIGRvZXMgYW5kIHdoYXQNCj4gPiA+IHRo
ZSBwdXJwb3NlIG9mIG92ZXJyaWRpbmcgdGhlIGZpcm13YXJlIHNldHRpbmcgaXMuDQo+ID4NCj4g
PiBPSywgSSB3aWxsIGNoYW5nZSBtb2R1bGUgcGFyYW1ldGVyIGZyb20gc3BlY2lmaWMgcmVnaXN0
ZXItbGV2ZWwgdG8NCj4gPiBhIGhpZ2hlciBsZXZlbC4gQW5kLCBJIHdpbGwgbW9kaWZ5IHRoZSBk
ZXNjcmlwdGlvbiBvZiBtb2R1bGUgcGFyYW1ldGVycy4NCj4gPiBUbyBiZSBjbGVhciwgd2UgZG9u
J3Qgc3VwcG9zZSB0aGVzZSBwYXJhbWV0ZXJzIChFTDEgcmVnaXN0ZXJzKSBhcmUNCj4gPiBvZnRl
biBjaGFuZ2VkIGF0IHJ1bnRpbWUuDQo+ID4NCj4gPiA+IExvb2tpbmcgYXQgdGhlIGZpcnN0IG9u
ZSBpbiB0aGUgbGlzdCwgSSBzZWUgdGhlIHNwZWNpZmljYXRpb24gbWVudGlvbnMNCj4gPiA+IG11
bHRpcGxlIGRpc3RpbmN0IGZlYXR1cmVzIHRoYXQgY2FuIGJlIGVuYWJsZWQgb3IgZGlzYWJsZWQs
IHNvIHRoZXNlDQo+ID4gPiBzaG91bGQgcHJvYmFibHkgZ2V0IGNvbnRyb2xsZWQgaW5kaXZpZHVh
bGx5Lg0KPiA+DQo+ID4gSXQgaXMgbm90IG5lY2Vzc2FyeSB0byBlbmFibGUvZGlzYWJsZSBldmVy
eSBmZWF0dXJlIGluZGl2aWR1YWxseS4NCj4gPiBUaGVyZSBhcmUgbm8gcGxhbnMgdG8gdXNlIHRo
ZXNlIGZlYXR1cmVzIGluZGl2aWR1YWxseS4NCj4gDQo+IE9rLCBpbiB0aGF0IGNhc2UgeW91IHBy
b2JhYmx5IHdhbnQgYSBzbWFsbGVyIG51bWJlciBvZiBnbG9iYWwNCj4gc2V0dGluZ3MgY2FuIGRl
c2NyaWJlIGFsbCB0aGUgY29tYmluYXRpb25zIG9uZSBtYXkgbmVlZCBpbg0KPiBwcmFjdGljZS4N
Cg0KVGhhbmtzIGZvciB5b3VyIGFkdmljZS4gDQpJIHdpbGwgY29uc2lkZXIgdGhlIG9wdGltYWwg
bW9kdWxlIHBhcmFtZXRlcnMgaWYgd2UgZW5kIHVwIG1ha2UgYSBkcml2ZXIuDQoNCj4gPiA+IEkg
YWxzbyBzZWUgdGhhdCBpdCBpcyBwb3NzaWJsZQ0KPiA+ID4gdG8gY29udHJvbCB0aGlzIGZvciBU
VEJSMSBhbmQgVFRCUjAgc2VwYXJhdGVseSwgYW5kIHdlIHByb2JhYmx5DQo+ID4gPiBjYW5ub3Qg
YWxsb3cgdXNlciBzcGFjZSAodGhyb3VnaCBtb2R1bGUgcGFyYW1ldGVycyBvciBhbnkgb3RoZXIN
Cj4gPiA+IGludGVyZmFjZSkgdG8gY29udHJvbCBUVEJSMSwgd2hpY2ggaXMgd2hlcmUgdGhlIGtl
cm5lbCByZXNpZGVzLg0KPiA+DQo+ID4gVGhpcyBkcml2ZXIgZG9lcyBub3QgY2hhbmdlIHRoZSB2
YWx1ZXMgb2YgVFRCUjAgYW5kIFRUQlIxLA0KPiA+IGFuZCB0aGUgdmFsdWVzIG9mIFRDUl9FTDEu
VEJJMCBhbmQgVENSX0VMMS5UQkkxLg0KPiA+IFRoZSBjYWNoZSBmdW5jdGlvbnMgY2FuIGJlIHVz
ZWQgd2hlbiBUQkkgaXMgYWxyZWFkeSBlbmFibGVkLg0KPiA+DQo+ID4gPiBUaGUgVFRCUjAgc2V0
dGluZ3MgaW4gdHVybiB3b3VsZCBzZWVtIHRvIGludGVyYWN0IHdpdGgNCj4gPiA+IENPTkZJR19B
Uk02NF9NVEUsIGFuZCBzaG91bGQgbm90IGJlIGNvbnRyb2xsZWQgaW5kZXBlbmRlbnRseQ0KPiA+
ID4gYnV0IHRocm91Z2ggdGhlIHNhbWUgaW50ZXJmYWNlcyBhcyB0aGF0IGlmIHdlIGZpbmQgdGhh
dCBpdCBkb2VzIG5lZWQNCj4gPiA+IHRvIGJlIGNvbnRyb2xsZWQgYXQgYWxsLg0KPiA+DQo+ID4g
TVRFIGlzIG5vdCBzdXBwb3J0ZWQgb24gQTY0RlguDQo+ID4gU28sIHRoaXMgZnVuY3Rpb24gZG9l
cyBub3QgY29uZmxpY3Qgd2l0aCBNVEUuDQo+IA0KPiBCdXQgY291bGQgeW91IGd1YXJhbnRlZSB0
aGF0IG5vIGZ1dHVyZSBnZW5lcmF0aW9uIG1pZ2h0IHN1cHBvcnQNCj4gYm90aCBmZWF0dXJlcz8g
SW4gZWl0aGVyIGNhc2UsIGl0IHNvdW5kcyBsaWtlIHRoZSBrZXJuZWwgd291bGQgbmVlZA0KPiB0
byBrbm93IHdoZW4gdGhpcyBpcyBlbmFibGVkIGluIHRoZSBzYW1lIHdheTogYXMgZmFyIGFzIEkg
dW5kZXJzdGFuZCwNCj4gYm90aCBvZiB0aGVzZSBwdXQgZXh0cmEgaW5mb3JtYXRpb24gaW50byB0
aGUgdXBwZXIgZWlnaHQgYml0cyBvZiBhDQo+IHBvaW50ZXIsIGFuZCBhbnkgY29kZSB0aGF0IGlu
dGVyYWN0cyB3aXRoIHVzZXIgYWRkcmVzc2VzIHdvdWxkIG5lZWQNCj4gdG8ga25vdyBhYm91dCB0
aGlzLg0KDQpJIHRoaW5rIHRoZXNlIGZ1bmN0aW9ucyBhbmQgTVRFIGNhbm5vdCBiZSBlbmFibGVk
IA0KYXQgdGhlIHNhbWUgdGltZSBvbiBoYXJkd2FyZSBsZXZlbC4NCg0KQmVzdCByZWdhcmRzLA0K
VGFuIFNoYW9wZW5nDQo=
