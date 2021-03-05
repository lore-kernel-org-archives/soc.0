Return-Path: <SRS0=fJxK=ID=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF73C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Mar 2021 08:12:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FA0B64F0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Mar 2021 08:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FA0B64F0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nFK0SXHeYzsaU7qM9jk4dbq1AVuJjrV1CUrFTN5peRs=; b=bNuYkiUhlOstrGiiS80qjrhI1
	KOULwr8bUAvO6II84PWD4zo5mubL0zf5/CYKcEkfmPsK8YfNVVUFRoobzh4ycIE2wyc8eYqos8S4X
	ckz5lF/ax4p+zpYifPoGP8LrOPdpHcj3TeH9uHufjVa0BJuGZh+3muNORBrff8VYyxZviRljlI1MC
	fhfRivcfOoXCLAQpvg4l0ht1558SiO9gaJxYNvBe5uqiXpX6SgwXUezjxN/oEyTM9l/rBPmu2YnOs
	0KZSwnp830adABkGIb3ADTqpPXSyQwKfSwfgYD98H9t6MakJiKHKZKojrnsdTeQo2zCrFML6LWD1H
	BxuFTDZ4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI5Xk-00DvK0-KS; Fri, 05 Mar 2021 08:10:40 +0000
Received: from esa11.fujitsucc.c3s2.iphmx.com ([216.71.156.121])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI5Xc-00DvIU-W8
 for linux-arm-kernel@lists.infradead.org; Fri, 05 Mar 2021 08:10:35 +0000
IronPort-SDR: Lka/CSSIbKRZwU/cslHDr0JfQNGQCyV/O1TTN/yM6ZMLz12jraBlO8w9gIESdkcDkBfOL8bzkO
 6xZw1UFhAhI7KYQB7qhH0FwshJYGYjVSUq9ngh054vHzmwOAPNYuPJs+cqHZJ/w0xKR7+u11e2
 Dn4L9BXJ6m20yvz6GIYHzkq5MjWm4voaFWuuEe9SJDrToOmllXcLSstzwaEI532qVnhh2xrLjE
 Wjzrn4NQ837/kr5UKOV/TXSGIoBEX5RquGfZ0OF1R7Ai4PuV6A63g50MkO5HErK9aSmkH7SOJA
 CBo=
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="27442756"
X-IronPort-AV: E=Sophos;i="5.81,224,1610377200"; d="scan'208";a="27442756"
Received: from mail-os2jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2021 17:10:29 +0900
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
Message-ID: <OSAPR01MB2146C723F0194BF88D9C04FA8B969@OSAPR01MB2146.jpnprd01.prod.outlook.com>
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
 <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
 <CAK8P3a17oRP=mU09ypPSxY3ms=fCROxk8SXo0S+CQpdtvsoHXA@mail.gmail.com>
In-Reply-To: <CAK8P3a17oRP=mU09ypPSxY3ms=fCROxk8SXo0S+CQpdtvsoHXA@mail.gmail.com>
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
x-microsoft-antispam-prvs: <OS3PR01MB63248CE48C6870031966D9FB8B969@OS3PR01MB6324.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hnieb/DtYVAn5D5CxxULkQW2IrqtBqInWC9HA/9WsFBgsKw2b/SIlanrp3nN4Q1eWpAafEDvdAJFK+Mh+5H2SG3XakHG1n03YyQJNhxwbgU7YDuOqbr5w1gvbmzlyDX1UKMferzYTo0/FmlY+ycB8ZfZewKwlQjjpvNN3RdpuXJG2O6trX82NwIHDaoTfWUI5ARZsGLsfg0erDvK3MaWjs+naghcbS64cgNlVaAEI5nYMpNruImHlOSM1AYM3weiqWE7u34Paw2O7JP9KdXSwvXF9E9gEZXNrY1dB+F2frUXSnlInaucC0uyOrBsg3p0LXqdC7iogP+tTjtL6BJwuXzIKgp9Sglvtm9p9VpJ3Op8hHKxbgfThZ4naTy2N+NHX/M1egXGhO2aUjnniaMFMzEaJI4zSaY9PVHhquhpEUX+OiGlmX4emHny+Vhrl72hBC1FWfXalkegieHu4asBFZFICGLV+BxowAFOitvHTtueHIV97CrkoBqP7jSRTlklHxvUxobmzvmx1G4o+wZXmw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB2146.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(5660300002)(6506007)(53546011)(54906003)(7696005)(71200400001)(2906002)(478600001)(6916009)(85182001)(186003)(52536014)(8936002)(76116006)(26005)(64756008)(107886003)(55016002)(83380400001)(66476007)(33656002)(8676002)(86362001)(66946007)(4326008)(66556008)(66446008)(9686003)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bHV6MHp4NGp0NThoSzkzNHBUYWpLblNRd1NVVUxWZ3J2K25JU2JDb0VsU1N0?=
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
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2146.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002918c5-32fe-49de-e70b-08d8dfae21d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2021 08:10:25.6635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWrpgSvQMg3zM8uW5h3SQVW2LYLoGRQ8YeFoqVmvo2qzr6A3908ohzjhuL9j2dSAmp2CsRREq5xaDJLB6eEHpwV/c4CtclmdmczvMTdtNLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_081033_396445_B79C4181 
X-CRM114-Status: GOOD (  39.96  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210305081025.cMFUykW_vqnLMmYvYxHl2qIa6DTqo6UrrCBjUhWmyuo@z>

> On Thu, Mar 4, 2021 at 11:34 AM tan.shaopeng@fujitsu.com
> <tan.shaopeng@fujitsu.com> wrote:
> > > On Wed, Mar 3, 2021 at 10:38 AM tan.shaopeng
> > > <tan.shaopeng@jp.fujitsu.com> wrote:
> 
> > > > +module_param(tagaddr_ctrl_reg, ulong, 0444);
> > > > +MODULE_PARM_DESC(tagaddr_ctrl_reg, "HPC tag address override
> > > control register");
> > > > +module_param(hwpf_ctrl_reg, ulong, 0444);
> > > > +MODULE_PARM_DESC(hwpf_ctrl_reg, "hardware prefetch assist
> control
> > > register");
> > > > +module_param(sec_ctrl_reg, ulong, 0444);
> > > > +MODULE_PARM_DESC(sec_ctrl_reg, "sector cache control register");
> > > > +module_param(sec_assign_reg, ulong, 0444);
> > > > +MODULE_PARM_DESC(sec_assign_reg, "sector cache assign
> register");
> > > > +module_param(sec_set0_l2_reg, ulong, 0444);
> > > > +MODULE_PARM_DESC(sec_set0_l2_reg, "sector cache L2 way
> > > register(sector=0,1)");
> > > > +module_param(sec_set1_l2_reg, ulong, 0444);
> > > > +MODULE_PARM_DESC(sec_set1_l2_reg, "sector cache L2 way
> > > register(sector=2,3)");
> > >
> > > My feeling is that the actual settings need to be on a higher level, not tied
> > > to the specific register-level implementation of this chip. Normally,  the L2
> > > cache is set up by the firmware according to local policy, and the settings
> > > can either be read by the kernel from registers or passed down through the
> > > device tree. It sounds like you want to control the policy at runtime in the
> > > operating system rather than at boot time, so for each setting you wish to
> > > override, there should be description of what the setting does and what
> > > the purpose of overriding the firmware setting is.
> >
> > OK, I will change module parameter from specific register-level to
> > a higher level. And, I will modify the description of module parameters.
> > To be clear, we don't suppose these parameters (EL1 registers) are
> > often changed at runtime.
> >
> > > Looking at the first one in the list, I see the specification mentions
> > > multiple distinct features that can be enabled or disabled, so these
> > > should probably get controlled individually.
> >
> > It is not necessary to enable/disable every feature individually.
> > There are no plans to use these features individually.
> 
> Ok, in that case you probably want a smaller number of global
> settings can describe all the combinations one may need in
> practice.

Thanks for your advice. 
I will consider the optimal module parameters if we end up make a driver.

> > > I also see that it is possible
> > > to control this for TTBR1 and TTBR0 separately, and we probably
> > > cannot allow user space (through module parameters or any other
> > > interface) to control TTBR1, which is where the kernel resides.
> >
> > This driver does not change the values of TTBR0 and TTBR1,
> > and the values of TCR_EL1.TBI0 and TCR_EL1.TBI1.
> > The cache functions can be used when TBI is already enabled.
> >
> > > The TTBR0 settings in turn would seem to interact with
> > > CONFIG_ARM64_MTE, and should not be controlled independently
> > > but through the same interfaces as that if we find that it does need
> > > to be controlled at all.
> >
> > MTE is not supported on A64FX.
> > So, this function does not conflict with MTE.
> 
> But could you guarantee that no future generation might support
> both features? In either case, it sounds like the kernel would need
> to know when this is enabled in the same way: as far as I understand,
> both of these put extra information into the upper eight bits of a
> pointer, and any code that interacts with user addresses would need
> to know about this.

I think these functions and MTE cannot be enabled 
at the same time on hardware level.

Best regards,
Tan Shaopeng
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
