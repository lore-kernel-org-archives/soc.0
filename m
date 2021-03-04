Return-Path: <SRS0=to4Y=IC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3E7C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 07:10:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56D4964EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 07:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56D4964EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rVjY4qs5ETP8tAZ095d6e8ngFFcB3GivdX7SnrElF6Y=; b=maC8J2JAWBAqvWOLNkTVAqiej
	JJPjtCTYBmi4Cn0Yn9uuP9mdmanBULqdtFk8b3n/HbOXau9Axqv/60QWrEFz0N5ePK96MCRMy8DBf
	v6Wkz/TuLq+DWLAGSd7RKAHPIyvbzKc54N7NN1YNjn8buyhmkoN8zvCTxzVeVDlBDki3AIJoYNS5Z
	pc35rYqqYCn2kULn93euLvSkohrHOyIS6xb3PGAJGyjcFa3VltWFoM7mDQ23VrMUti7ncICIUbTGS
	N3F6Dw/KkjiwENuwwchVu7dh+MbWNQbUlL0DIYiAf5Bv26nwU1UKP5OfTcDhJYntHft8dOkBi/1MG
	y6RdI0x4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHi5F-0080CM-K0; Thu, 04 Mar 2021 07:07:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHi2S-00802e-7m
 for linux-arm-kernel@desiato.infradead.org; Thu, 04 Mar 2021 07:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=i4kcOmSwVo9yryFL5lO7SO2on7y3wrHpaEhPERsxBas=; b=Gic6zmdMO8AQCIxlbEY1R8g2vh
 mleB74HwxTlTC/rRtphlQt7WL3uUrCBWGvLzQSuAKE4pAuU+bLoKZQ2OGy9J6/2PMgtU50BsbOebK
 CHQhayAyyZPQWlTDc4tL3IKnQCs/uf1K82T/7UjCgPBvut9X9kCT0Vi6CzkSqeofvTxzvadWb5ltz
 mElryRYjt9sBaR/7r6wN3Jug5l6xAvrlLqnbOW9dn+quYWSM5nTdWglm1tPTMWTOaWwuY4ayAdfvp
 2Mkc5MDq04liUmiJ0WoFPoESnuH9GXuDqEYOO0OSEU6gYzw8US5YEqpRolIBIoDI1PDq2jEBGAkzq
 feuImoVw==;
Received: from esa19.fujitsucc.c3s2.iphmx.com ([216.71.158.62])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHi2I-005z5z-Jy
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Mar 2021 07:04:41 +0000
IronPort-SDR: CentF7fEFv7tniDi7DnPPa/x2atS8LoSDG0TbnoUKS1jsW05v6s40Je3RUtuKFMVJOgD1glZY6
 PBUix+a7n3vT6HYvykOjtrigTyNyhaRW+kmtqLSWFABwhgW5NC+EEkQlOWSLwJfziuJJC6llXL
 UZP7nucLXyCcyXySh9GoP7w06I0I8Xa8jmh3MWQE+LwhcqWHXpnDA94JkN7CDcYuFL/Z6FUeA7
 AjayR3jt1g73T7Lk3pwj1nuYJXJeMGpIOh/1QvVJduHZ1MEQyLJenWhGrBecQkd+mFZFqrE8H8
 AaY=
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="27007198"
X-IronPort-AV: E=Sophos;i="5.81,222,1610377200"; d="scan'208";a="27007198"
Received: from mail-os2jpn01lp2050.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 16:04:14 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPEpr2mx0QF5T1gApPJ53hgmE4TI5Ikp5mbRrPcPkrindnRKViIvEyyKtGJNZnZKd5yALYqckSMj4NdPjvYfLzafCFewdQCLm2K3WDTq5Q+R5jBf2jS5wIiilZTmwDxNlbGQvZWiOgiJgsxjsUp3BUxPJbCWzcl5OBV0qwU4eeheIgdqkXNIa97lUjoC/K0wqCG3sswJRgghPlN4I3xHZ2/YWhRc1/rpgJ2qELGRWRCnabb3UqH3UvNUEnSCrFOOrt9r2smYrCulZKkcw5QBaQJHAYXUp9OMJ9eSQvj2RJEZcGyNTIGTnX4ZT7lpjVlPr1ZLf0CkoGOCqqzv7Bc1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4kcOmSwVo9yryFL5lO7SO2on7y3wrHpaEhPERsxBas=;
 b=H6peMj2m9drZ37E6pkK0cVVQsrCCUZ0sVFUPMcbEwzlbBwwyDpw589DHYIKW2/7chh6KhAWVOMY+5mJS3SHnyvKPVCVMeHXGY5wgFewhhO9l0pRnsv9XR7sipW3WjRvo18GH08M0pGEYafo7nM9ShlqpJCf04SeWEHmq3rEuullIltXQVrtdmOwlsw+MwCkYpuTzP2VXNPTeZDuzNiL1PCm1t3W5xtTO+Cd/AhtHnshbawb5ZexgV8EYZgH6yE6sL8hQv9c7kCuXXhSdygkZKZFZ2zVHa1gTfpBDy38xu/mbeA/yb7ZurswwS2bv36OZkQCmr8Ztxs8H+GQUwdlW9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4kcOmSwVo9yryFL5lO7SO2on7y3wrHpaEhPERsxBas=;
 b=VlwRxtRYp3WnskyIUnJ5NP4A0Pi1C78oGgyEXx+OlFRaJP+i2sGuDa1u3oPl/y4OGFi5GnLe3CW/VrDjs3TfQkNdo806ROLaf+rjK35iPK02JlegHqa/IX9G2uCSNzq3JQel43onCWhi0EPgXJNgrGdMxqfyQJhWY30a0Fxt6is=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OS3PR01MB6070.jpnprd01.prod.outlook.com (2603:1096:604:d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 07:04:11 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::e8ec:399a:e6ab:7056]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::e8ec:399a:e6ab:7056%6]) with mapi id 15.20.3890.028; Thu, 4 Mar 2021
 07:04:11 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, SoC Team <soc@kernel.org>, Olof Johansson
 <olof@lixom.net>, Will Deacon <will@kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: RE: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Topic: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Index: AQHW5aq63O/w5e6x+kOClsfWvFvpM6odr2EAgAAY7YCABfnJ8IAATzYAgAE118CAA2BUgIA1QadggBLz3YCAAYCFwIAAOqmAgAEhHjA=
Date: Thu, 4 Mar 2021 07:03:06 +0000
Deferred-Delivery: Thu, 4 Mar 2021 07:04:05 +0000
Message-ID: <OSBPR01MB4582AE99E2BFFB23749C2394E5979@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
 <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
 <OSBPR01MB4582A4399A25EBC65F8B0626E5859@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a3dBnSMmOgXHeycwpXJo3O2oq1e3Ue0XzgP=q68ZxMzvg@mail.gmail.com>
 <OSBPR01MB458224BBD6E110002DEA7085E5989@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a3CwCSXyXuj9NGcyowTUYdUgAJdH8ue=R_aXYX+SO6Uew@mail.gmail.com>
In-Reply-To: <CAK8P3a3CwCSXyXuj9NGcyowTUYdUgAJdH8ue=R_aXYX+SO6Uew@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-shieldmailcheckermailid: 4449e6c838c044b99b5badd89cd366e5
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.176]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3e3d8e6-5dc9-4426-a21f-08d8dedbb6a4
x-ms-traffictypediagnostic: OS3PR01MB6070:
x-microsoft-antispam-prvs: <OS3PR01MB607091D90F924B4A5790B7AFE5979@OS3PR01MB6070.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iS68dKusvLv+WJTyiGlp2qjoNGhW/YZzEtlIdVos1gbaj9Ii9T/rdAmHGiymK1noxsLXzt/9miAvXwdUYvF+rMja5XImiposteZxslLELGP/xIdCKsgrq2/o0jZzp7B1O8Px4JF6RVFL4mbEkPEkhOO5bHdMdWgz8W9AjeTeGaxT6mgZTxud3Mf3z2zE57p3N2qSPQ1C8dPBsZsOWcoQojjKv+DEluu1VVT3YrsX5Z0Tv8XQLkqIO2AnimmpV6CGYG8tWF3xTdDcgSHt1SDEE3f0gkRE6R0LzDkyWvGiTI3F7D2Wkycc9klNjx4UeQC2al+rxTgKtAMDHhJrEKSHnIT2Qku7YS4pO6X4yjiDtvLKTLiNxy5b5QdBlC5RlVA7DDY5cLv92gVN0uPRVlyj6KNoa1xt8JPhIzHiT59nks2N3L5KvY5SD46JhL9IFcaMRlnIoKpQku9ieOJHS+IZpR1X1GJONZfUNyYmirLcPWKkhtVCbjABDpCpjw/jDSImicbrx0q03r1DCaPodQiUzg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB4582.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(6666004)(26005)(7696005)(316002)(55016002)(33656002)(6916009)(71200400001)(8936002)(6506007)(2906002)(186003)(9686003)(86362001)(8676002)(85182001)(4326008)(83380400001)(54906003)(478600001)(66556008)(5660300002)(64756008)(52536014)(66476007)(66946007)(66446008)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TzdSZ2ZtM0lQLzBaSEpqS0VZTEEvYkIrQlA0YVN6UEZKRXdpKzdBWGcvNW12?=
 =?utf-8?B?eHdWVTVwR2doRmxNMkZORm55dkJxa0dKaXpXM1RiczBNeXJvb1Zld3lsVytr?=
 =?utf-8?B?VE1rNGFlODVWMnNEa3NlaE40U21jQ3FiT2ZaSlhFdXcwelB5L0x0M1Y5ZUw5?=
 =?utf-8?B?a2NBRlpscnp5cWViL296amRoQjN0U2Y4azZyTnUzN2FqM1R5S2VvVTYvRzQy?=
 =?utf-8?B?NEJXYWQxU2xnSm5IKzlJVjJ4MitvN2xQQytQZHR3NVRKdFVGRXg5OVBXc3Vl?=
 =?utf-8?B?aVBFMHl3eFFUd3pwU01BUzlMK2k5ZU85UlZWRmlCKzlnZkUrQW1mVmNZTUZa?=
 =?utf-8?B?SWdBMHlZRUNndFZsbUZrNU1pVGpMcHVYUXk1V2RqemF0cUw4cXArVVQ3OVJr?=
 =?utf-8?B?ODhwdURYMVhZM1d1YmQ1SlF1amh1eGhQSTJqd2NhQThFZTFvRmkvUzRFT1lr?=
 =?utf-8?B?TUI3YjRWaXZEZG05ZDdZbHBZbFFPQ3V4c09NbkNGNVRGWDBBRXdKdEZEY0Vz?=
 =?utf-8?B?ZWt0aVByVXN5Rlp0TU9wWU1vWTZUTk95dkFBVDN6MHYrMWtHc0o1NERXazhG?=
 =?utf-8?B?NmhFaStzY3VMRVlsVk85VWRpNzI3T0dVRW1WMU15MlNpLzg4aGYwSjMwSFRl?=
 =?utf-8?B?a0txVXpiVGR6OEpwb0ZaaEttT2w0aGU4R2NFeHFyem1QcUUrSmZ1VzVyLzZX?=
 =?utf-8?B?RVJ4ckRKZ3ZhMlJTNW1BSnVzZ3pmMWk0eWtMbDg4Um1hbStOd3cwRXBkTHRO?=
 =?utf-8?B?dWRGV3QwVytyVXpQekZjRWVWWHVuaEpwaktuQUpPVU5MRnp2bks2bzFMd0lT?=
 =?utf-8?B?ay8xNVpRYjM0L09TNHJQVXN6V2V6TmF2MzEwNEtOcVM4VzloMHJQcVhLcmsv?=
 =?utf-8?B?UXVjbXM0S0Z2R005YXFURnpEc1prTzFYc0dKVnJKTHFkUjdTblVwR29hNzRN?=
 =?utf-8?B?c2h1RTBHZ1RQT3ZOVXg3WTVGMXhnQW5oV0psdU5QT3U1SzM4UDBjVEhzUmxS?=
 =?utf-8?B?VmhieWFrY1Zha0ljTk9HbDZhREdlZXNaR3FTZ0FiZUdkWGtzTkNsV0tTb0x2?=
 =?utf-8?B?VEVFajN4OVlneUI3Snh0UnJpc0tWNkl3TGl1RXB3ZjMxeGRucGJ1cmVodTVW?=
 =?utf-8?B?OWFwUkN3d1ZWaCtHRUkzMkQ4SENkWDNySWtGVDRPZWtUVzVWVmlkQTRDMmhy?=
 =?utf-8?B?b3JRY08yUzFTdHIxRlc1UkNZQ2hHUUlLVGJCZTZIZlBCeDlYM1lKdktlUnZo?=
 =?utf-8?B?TWs3UHA4NTNUei9DOWRoL3h1UkZEckkzTm5iVHJuUThxek0rNlFTcDBUaVpp?=
 =?utf-8?B?Qm5HWjhDWWhHZy9tUzFSNGw2dmoxbE5LaTZYMk00SHA4UHZyUmloNGlncXQz?=
 =?utf-8?B?cE9Wc3MyYnJjOWZFUHMrOXJLMHBPOWZ1bkVjWW1oZVlnWjRkcklOTjd4Y1Fy?=
 =?utf-8?B?ZXl0RUlqOHFIU20xT1IyNExKYkVzWEc1LzAvVXljRnEyTkdWbTRZQ3VOeVN1?=
 =?utf-8?B?WWxqd21wK0tyendVSFdzRnordWVDYWt1V2lvcWdaY1dPVGxVQ0FSL1dzVjRi?=
 =?utf-8?B?QWl4Y3h1cVRINmpQWi9xNlkwNTJtSE54dE95M3dCMmZMQ0cwNlI2NVZEMU94?=
 =?utf-8?B?N0o0djJkcGRnSERmQ0dpeFVkdWptcGVWWEVrQ3pYNzNzK20vc2NQUVU0VENa?=
 =?utf-8?B?Y3dHN3ViemtRc2NIZTk1azgrS2ZmeGhVZUxPRkVuNmwvRVdMYzNLNUtiL0lW?=
 =?utf-8?Q?nAbG6Z/1XW/47xwHhZJIlAXUteMOloQlI6OYF1y?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e3d8e6-5dc9-4426-a21f-08d8dedbb6a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2021 07:04:11.5612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pa8qrAFXcDjVzPHVQFnhbW1GcOpB4fmi67bdqmlDNuWolDf6ZM6lBh2GvMjqgmAei3bUKvXApVdr2OGSPvH9f8zhACuo+UPHbr4/mEVa8AQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210304_070441_672864_19DD1D8F 
X-CRM114-Status: GOOD (  26.05  )
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
Message-ID: <20210304070306.WpyOUrisU60IMzn7UgzwwLrRooD2CREKe5iW_Hspvhk@z>

> > > I'm also running out of ideas here. I don't think a sysfs interface would
> > > be any different to your earlier ioctl interface or the the /dev/msr approach,
> > > they all share the same problem that they expose low-level access to
> > > platform specific registers in a way that is neither portable nor safe to
> > > use for general-purpose applications outside the very narrow scope
> > > of running highly optimized HPC applications.
> >
> > Ok, but ARM architecture permits implementation defined registers at the
> > first place. So can we provide some method/interface to access them as
> > CPU feature if these registers do not at least affect kernel operations (like
> > this barrier) and only root can access them? Library could offer portable way
> > for user applications (under root permission) to access them.
> 
> The kernel is meant to provide an abstraction for any differences between the
> CPUs, including implementation defined registers. While any such abstraction
> will be leaky, just passing through the raw registers is generally not a helpful
> abstraction at all, as seen from the x86 MSR discussion you pointed to.
> 
> One problem with having a root-only register level interface is that this
> can break the boundary between kernel mode and root user space, and
> this is something that a lot of people would like to strengthen for security
> reasons (e.g. a root user should not be able to break secure boot).
> 
> Another problem is that exposing the raw registers from kernel space
> creates an ABI, and if it turns out to be a bad idea later on, this is hard to
> take back without breaking existing applications. Not breaking things that
> used to work is the primary rule for the Linux kernel.

Ok, thanks for the thorough explanations. It helps my understandings.

> In order to merge anything into the mainline kernel, I think the requirement
> would be that it does provide a sensible abstraction inside of the kernel
> that can directly be used from applications without having to go through
> another library that abstracts it, and that has a good chance of being
> supportable forever.

As you mentioned an idea of process-based approach earlier, I will
reconsider the possibility of general abstraction interface in that way.

Regards,
Tomohiro
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
