Return-Path: <SRS0=Uu9Z=I7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B41DC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Apr 2021 08:48:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34E0C610E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Apr 2021 08:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34E0C610E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JP7oKc389Vow8bESCmfiF42x9fPey2cUaNLLOTEEjr8=; b=K8QqTT6spp0ondBESRpPl8hLO
	YdUoGxov/05si+ikYuyzOm057vR3/5Vfs24iltEXyasYcT4Zrgybf1ZrtzdcNsXbg+A7WNUFaiG1f
	Q7oOWnZOC2O9RJg5sui+2NIm8eotJj8eGv00YmvgPfJTlusbUyv55/hFSgwGIrtQmjLZtXxeBDfzX
	/eIkT0GV+h56FlJk+zixEp55r4kXaPTAxeVsdGRDW25c4w0WwQpsmyENCSPwelztyK79bBhYsgD3h
	97y7FyG966YkYXFXs3cnxqkqOMsi+BA5w2hVPhbxnTzIlEqq/zx/t0SJcNpOpTE8i0xYosTu1wB71
	VNNAREl0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSFSF-00CL8n-U7; Fri, 02 Apr 2021 08:47:00 +0000
Received: from esa17.fujitsucc.c3s2.iphmx.com ([216.71.158.34])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSFPz-00CK7z-Ti
 for linux-arm-kernel@lists.infradead.org; Fri, 02 Apr 2021 08:44:42 +0000
IronPort-SDR: RUVwBV4LlaiEZimtxjkqevZKEUV2XKnXsRDe2l45H8HT5YHwSVyfQADkXXTzmL47BsDGoFThvO
 FBzSoF2vSXrT9kQ52I4is4C6o3VMgVm40HMOc07IN+chizyQrypFs/jF2zNJFIQadYFCP9E6l1
 3d0jXGjmmOUQCduw5irK5saffEfs5LBxGnAoIQQmScCRlbJHgmQebMin8MoaCs/+5A43Cp0ZOC
 fwKJMdVYkZK7Bu4sTAkTTjnN+0MNEKSg5DjcJI5G0GghWKcRdQIzkvcRDeJOkS23KP932qYni9
 2TQ=
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="28856079"
X-IronPort-AV: E=Sophos;i="5.81,299,1610377200"; d="scan'208";a="28856079"
Received: from mail-os2jpn01lp2050.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 17:44:34 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rcke/GfRW04LQYjFQBHAofJpV4+stYrR56NmkvcM9y5BSp8eox1jZGtCXhpFaETo3q9eCzeE+dCL/g/KXCTL6JtrrrJDxc9+zKOMYRmvxvP/4luUup/gfIM8HvS8unxqLKDPJ2tw7erh42VRfzYr2D+TwgqRNnq/2o+ZDUbq57GsaMikLThAX/ssfUOyFLkUdV/LjjbizV7t+DXYCiCk3K7lhgGqEv3iHXXMeXowQco4BhWzz2ZR5oqH+uLSeDMMKdeVNfc5uersDKBK5pimQkSbFW/MANGgUisKpWswPNK5WrUdQRx3wwDJ7C/JhRUedgbGugfDGiiys0V8PqD90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQJd0WJ1McupDnNqvRBI8eW36WODaK3eBC7xeKSWGIc=;
 b=FSVktrhaHWpECedV63kbvLI6UQjnDGmxbL+bcYuzoCrDfS3VfNOb21SNglNG7aO43KYd98BzOAOtcQSDa2RpaG7zztHFmJ0HuAcNAMH2mccJsowJUkzbtI6NX4KF8awzUGB/0RsFKE3h7r4brkGO6QmnycuYwO/gy2JJW+uAYiXHqFfsdDHgAqn6yoB1MZ7GNnr+Ps9A9Lyc5sdh4jV4A9G2UIHldvFsRZN2zH71r6ZQn7lk0Pr5rjHH/1gxUyw5+BNhgVZ6f6edWBTf/eQIkwx9AGOZJSTsBdupURzcwLK8qL+bdCXlcuKSH9u4S+93TskdZI0yER1nC1DT8fDZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQJd0WJ1McupDnNqvRBI8eW36WODaK3eBC7xeKSWGIc=;
 b=bFF0m4bXNF/iBXYzkqs0r+HiapSfBZANFtjWiSgDvam08kaGR6QfWILQ9MACdPjDp9D/x48rzXZ57K/CDZuy5gZWyQiOYjLWAnDN9i/C/T1CUAJvteJQWKSk94i7Vekx/4y3n3eb4hNk+OPmtFZEDro5qTXJ2dfOAbn2+ntqtZg=
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com (2603:1096:603:15::15)
 by OSAPR01MB2866.jpnprd01.prod.outlook.com (2603:1096:603:3d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Fri, 2 Apr
 2021 08:44:32 +0000
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d]) by OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d%6]) with mapi id 15.20.3999.028; Fri, 2 Apr 2021
 08:44:32 +0000
From: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
To: 'James Morse' <james.morse@arm.com>
List-Id: <soc.lore.kernel.org>
CC: 'Arnd Bergmann' <arnd@arndb.de>, Will Deacon <will@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>,
 "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
Subject: RE: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Topic: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Index: AQHXEBESAJcmfc8h0U6q78FjB96JBapyH1gAgAGCoFCAAAVDgIAAAz8AgCpFWZCAAhRpgIABEIog
Date: Fri, 2 Apr 2021 08:44:32 +0000
Message-ID: <OSAPR01MB2146C20E39297D5DB347ACB48B7A9@OSAPR01MB2146.jpnprd01.prod.outlook.com>
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
 <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
 <20210304104650.GA20843@willie-the-truck>
 <CAK8P3a2pFcNTw9NpRtQfYr7A5OcZ=As2kM0D_sbfFcGQ_J2Q+Q@mail.gmail.com>
 <OSAPR01MB21463C735D4A07344F35E7CC8B7C9@OSAPR01MB2146.jpnprd01.prod.outlook.com>
 <edaea436-d94e-d862-1136-66e9f881e0cc@arm.com>
In-Reply-To: <edaea436-d94e-d862-1136-66e9f881e0cc@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [210.162.30.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8448ffc7-bc03-4f79-43ee-08d8f5b38936
x-ms-traffictypediagnostic: OSAPR01MB2866:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB2866EA96228F3298B0CB79A58B7A9@OSAPR01MB2866.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CVfbLlr3dtW4rBXQ65C5Kdz26Y8CONLLRXCHwuEHnqIt/xq/Lv+KhLkRUSm4lgcA216/7QMROYMbsxMlnTnzBkQ7YmU17snVALnuB5EK5EJ1ah9pInlhUMKEARC2ep8/nz/X+7luyjZ4QHSaCh+a6L4qXLDbv6wEDTAMUa/a0qWCnL8CRNMh87dEfc39L4gUIHHQ6RZC84VMhQzIWAD2dNKK88RTiX9UaigYF3E8nFD0yvafp9z/hzd+eddmsuWzAJm4eUsEL+IeqbDiimtE5N08iwPa7mUSUxtwG/T4hyjw2hqTljGl19WNVrDyNF/cAz92pFRPSHzqydOXatMrkFfV1VKk9NjSxUsbO/5ktJL5Jz4kglbda2cYOxxmqGtJHr1iCV5I6Ns+hEV0xP+NxhTT/zh2AYMFBX27Xl8JT2uh005zFaQaIGevGTKMN949764UtIu43SXJopttegD1tEKpFtQxMOtAuJ/tfLLYSprI7c7Xt6cagTummFOMjEPHpXGpesejXlFcYu2ThPSDoC3LBNV7Er+cQp6vTvnNaLpU3FQFVjV3optaMYzC5J/zaWR5248EtKFGqtD+xohggIzv8wFa+UZXFTU1PG4V7hFARaju7RtmrwWDSv1eRsxdmIfkjcb5TMaDeKzk6I5JBJxAMvBbe3xYUS97rRKeB1abHYw6L2tHrgHEmEf2xG8EIYtew4VeBYJF7lKQRWN6lxAQFz2NHXtnvJDYbSNCqeObnZytECnY2NQkGJJdV5WT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB2146.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(55016002)(33656002)(86362001)(53546011)(6916009)(64756008)(107886003)(966005)(7696005)(52536014)(5660300002)(2906002)(6506007)(9686003)(85182001)(4326008)(186003)(66946007)(76116006)(316002)(66556008)(66476007)(38100700001)(66446008)(26005)(478600001)(8676002)(8936002)(54906003)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UVhFL2llR0FncGUxaU5oZkhTUlhyclM1ZGl4Uk05ZmFpN2JpN1d0SUJuQUVq?=
 =?utf-8?B?bk1XS1IvN2pqUmJsK0pTdlZhdFQ5c1hiODU0M0VueE9Fb1ErTnNDN1BMUGhO?=
 =?utf-8?B?bXprN05HWGRVQjE2ZmEycGZJbDRhOXU5WTA2dDAyUTNremxucjdIRTJQU0lQ?=
 =?utf-8?B?a0tiSWc1OTNCd2hsSThBMDVONjZmLzRXZVlPWWdzL2J5c0RYNmY5TllrbWND?=
 =?utf-8?B?RjlKamtnMEdyM3lVY1pOamlyWFozMkZZWnRBQkNaTjdIcHlmYmZYcmlJa3dt?=
 =?utf-8?B?MWwyd1FEdTNTdStoeUc3U1MxZnFDQkV3VERhRzdUSnB1eHN4S0FidFZpTEVY?=
 =?utf-8?B?cGpUWkcxQmJXcm5mL1RFKzhOUk5la3BXQjBLZnRoL0JaL3FkT01xU2JrcGpL?=
 =?utf-8?B?UzlaL0UrYUkrNVdsM2svc1B4N0QzOFdTQnB0WnhYbU1NbEFpM2dGTzR2dm04?=
 =?utf-8?B?OHBYTVB5L0tBUjF5T2FEU0tYMTlUWXA1ODdKRTBDRU9NU2VwQkRwdUtFYU5D?=
 =?utf-8?B?eFZqSW9xV0hLUGFtN0I5QW4yYUVhRDZ3OTZrYVdjekhTcFJKWjhwNjRBNGhQ?=
 =?utf-8?B?L3ZCNDFFcDBocmUyTDhRa2FabUJXUHl4d09PQkd5TEJrbUZvL0JPVmh5bXFw?=
 =?utf-8?B?bDJFYzBzMjFSY0xtSmdVK1JvcUJadjVWR2xQWDM3YUcvc2FXaW1xTyt4OWpt?=
 =?utf-8?B?Mm9mQjN0U2p5MGlCczBiQjF2Q29DOExuY1RxOFAxOUtwZk1ZZlBEaFBpTCts?=
 =?utf-8?B?U1hobU8yVVAyc0dpYjYyaG9NVURsL2VZTTJZNG9QQlA4M0tpVlBuMmpvOUtL?=
 =?utf-8?B?Y0pselFoa1JvRzZZK3h2UlJ1YXQ5MTNNYjVIa0pGVzJhbndZUXE3S09KcjNa?=
 =?utf-8?B?K2srcmFjRDl1Tm8xc3N1QVhKTWdoUjBVK1dHZXNncVFYQWRLMVVsdGhEbjRv?=
 =?utf-8?B?OVBubXp4N1NzUGExV2c4WUpldHpYWDE0MG15QklhWnlQdjVNWm5INWZDWDVt?=
 =?utf-8?B?NEVjMTJtM3kxM0x6RTFaVFY3WFRrRWlLODJlVGV4UHdFZ3JXdWl5ekx6RjJr?=
 =?utf-8?B?VWhEb01WNjZzdlpNWmxxL3BXdVg5UTMxYWdmYlA5R0VKSEt6VitPUG9RT1JN?=
 =?utf-8?B?ZUlNZjNtT25pSFVPM0NZVkE2ekpMb2xsaW05bld6ZGtQNmc1aUJFWXlJeTlO?=
 =?utf-8?B?MFFRYlRFK1ZPdk0vQzVFdXpmNG0ybUlCa1ptcUxqZXNDZ3VpWkFvRktONUFE?=
 =?utf-8?B?c3AxMm52M1ZURFVVbGlOd3ExSVpLOEc1b29IUDN3RWppSUFJYWYzZDBKUi9a?=
 =?utf-8?B?d1Irb0tyTk92cVFiNnN2cG5QQlNPUTBiMW9zamxZTEN6MU90OU03OUNPS1VS?=
 =?utf-8?B?UGg0S1FXMHNuL2c4SkNVWG01MG1CK0IwRzE2eHkxZVRGNk1IVzg5aERZYWg2?=
 =?utf-8?B?cU92R3h0NUpHbmF0bVVRcHJQYnQ0UGFhUkx4clZpK0lvV1BCcVo3d3kxWkgv?=
 =?utf-8?B?alZTUzFDRWNkNUZTQzNXaExKSHVudTlVbGlTd3ZEN0p4cWFvbGhvOUI1dXRz?=
 =?utf-8?B?Zndqend1alE3eUxuTzl4SEdweHVRejl3Kzl5TWJLK2IxbkEvRi9TdFBjNUg3?=
 =?utf-8?B?MjhaVVNyTkR5bHpFZ3VWdTRvZ2VuL2tYK2E0Wm5GdTdMaWNFZUI3TlptaUlq?=
 =?utf-8?B?NzFRUXhvb1oyK0dPTW9qUVg5bUhGN2tsc3RGcUpDRjlFbzZneSt0aGN4NzRG?=
 =?utf-8?Q?yT3wv4uw4zAiaKiOWGSl+3mMxulKXEsBYV871kM?=
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2146.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8448ffc7-bc03-4f79-43ee-08d8f5b38936
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2021 08:44:32.1991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U8Wk8SvdQ60ovko0mSksFHse8UheEieJrMkZjNb51cC64r5QveQtZxpqgcjZNKa50WrLadvbntNnnwro98n7gqqpib1OQfSTdCFd9Ns2wXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2866
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_094440_278804_DD4CB37C 
X-CRM114-Status: GOOD (  33.44  )
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
Message-ID: <20210402084432.lcpE6X6maO6yppNIVFbA99x3t9d1G2erj55bFJoBePI@z>

Hi James Morse

> On 31/03/2021 09:52, tan.shaopeng@fujitsu.com wrote:
> >>> Given that all of this is outside of the scope of the architecture,
> >>> I don't think that arch/arm64/ is the right place for it. Perhaps
> >>> this would fit into the resctrl rework that James has been doing for
> MPAM?
> >>
> >> Indeed, that sounds like a good starting point. I don't understand
> >> enough about either of the two to be sure, but it sounds like there
> >> is some overlap in functionality, and ideally we would have one user
> >> interface that can deal with all the hardware implementations (intel, arm,
> fujitsu and any future ones).
> 
> > According to my study, it seems possible to add A64FX's sector cache
> > function to resctrl.
> 
> I think this depends on whether it maps to one of Intel RDT's existing schema.
> While adding new ones looks easy, it is bad for user-space as they are not
> portable between machines that support resctrl.

Thanks for your advice, I will try finding a way to add
the sector cache function in resctrl by using existing schema.

> > I heard you are working on resctrl rework for MPAM , but I cannot find
> > related patches on ML archive. Therefore, I would like to know the
> > status about MPAM support.
> 
> Its about five or six series that refactor resctrl inside arch/x86 to have a clear
> boundary between arch-specific code and the resctrl code that implements the
> filesystem, then pull it out to /fs/ and build the MPAM driver to make it work for
> arm64.
> 
> Unfortunately, its rather large (>100 patches), so will take some time to be
> reviewed.
> 
> 
> > (1) I think the first step is to support resctrl for ARM arch.
> >    Have you finished the work of arm support and when will you release it?
> 
> No-one wants a second copy of the code to implement resctrl, as this will
> introduce subtle bugs that user-space would have to work around, and make it
> harder to merge later.
> 
> The first step is to refactor the arch/x86 implementation of resctrl so that the
> parts that are visible to user-space can be moved somewhere that is common
> to multiple architectures.
> 
> I've posted the next chunk of that work here:
> https://lore.kernel.org/lkml/20210312175849.8327-1-james.morse@arm.com/
> 
> > (2) When will you release MPAM patch?
> 
> The latest complete version of the tree is here:
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpa
> m/snapshot/feb
> 
> It is over a year old, and has plenty of bugs.
> 
> I hope to push a newer version of the branch once I have a complete copy of the
> tree that has been tested, and is based on the current version of the ACPI table.

Thanks for your information. Let me see the patch.

Thanks, 
Tan Shaopeng
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
