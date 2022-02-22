Return-Path: <SRS0=elvg=TF=fujitsu.com=hasegawa-hitomi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B872EC433F5
	for <soc@archiver.kernel.org>; Tue, 22 Feb 2022 10:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7ACFDC340F0; Tue, 22 Feb 2022 10:53:49 +0000 (UTC)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CBDEFC340E8;
	Tue, 22 Feb 2022 10:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CBDEFC340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=fujitsu.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1645527228; x=1677063228;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YqlWN1xawVU/C/dlwihlVD0+A0NU6yRjl7UkxytU1vE=;
  b=pZQpJ8kIo0CDBuw8lu6dZBWTnWHZZ+21JXEDvt1il20J2N/IspKpJz+n
   Rzs1gjO8VE/CHh3PrHk5/W5W1k9Cc89Moqh0eqY3RfMHCb3t/GKBrEM4H
   S4V7xWjzzqYVdndOltSp1HirGzlWT/UqVE7SGyMawjXZggUQpAo8JxZbx
   kK9831YkLMGgIblJzi9MBeGC3RzLrKMn8v3rQHWgtZR4KU07Am/6O+OKd
   lIHBYPKbK2htKQczxWEpnSVfoITc6e7xLj05fmg6dQ1S51c0OsnoTjz19
   gd2DUYau7faGIEb8ehchFnwumUbrNU1VMFXVrDP89c9S8zKPDgZcWorGf
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="50339636"
X-IronPort-AV: E=Sophos;i="5.88,387,1635174000"; 
   d="scan'208";a="50339636"
Received: from mail-os0jpn01lp2109.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.109])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 19:52:33 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4VJIXMhUgfQBhc8MwoosffjeGO2D8bF/nSksFEQpOkQ39qBGSuhSijxQ9YrPlNwH1kNah+IrMYMkjnwBK5Md9CNrKXZIrz3r+eBfCAJikmg+gb2toZPWD36M/1CSpMIR7eSzLCh7/fhIJH9LiAH5OW+B1epriaiW8/x5d1DwwiSEtjFcNMM42J3ztriVQhV1WFzJJcpcTfjkfG+X4QTcleV6YJcC0XMuP0fndEZThi5pzLJZLbWYOXfvITZUpCa9MHsgnBHyPCQuaBUcfA5SHHt0O6akp8b9kVi11XVf7QTCyL/m0MdHegBCliZrTPcaqsvhXHVhC69ETvKG0QbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqlWN1xawVU/C/dlwihlVD0+A0NU6yRjl7UkxytU1vE=;
 b=ViZiNnVUStp+1Z04zPoC7kguJx6jAmeGtB4YLcNYCDfAxwLN0wyisbh/2Qr45CkKpAhDMKhxZRz76XyV3GC01CTgFUYWGxe2CRZDI1/l5WUqnxNpStkRT50IZwpiHs1NKixme3Xd93uDiSt6bRFxYY47ctqRd1E1OXMzfqL9QdkL/bz5pha1aOdX/pTIc+hEVViBYYsI+eykUkbFC5dqdLEwSi/ivmyA6poltkYF8pn03cfyra4z0vc4WGwWFdFz0+PuViZV98a4uHpiJnY/e70UhTx0J0S2fyOcjBJ6es5R3lOknzosfseYr4B5LlP3g4G5q4aPmkOjeeUe18coLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqlWN1xawVU/C/dlwihlVD0+A0NU6yRjl7UkxytU1vE=;
 b=Tp+yaH9qlGuqg4n+KKMJrg7tnXjPrBx/LCnM4sodFKOuejXrtowJ1dylfTfVjw1Y2a6/WxZHE4RkNnJh1gTDNPs6RgEAa9Pj5P6l44X/JfmaS8JXXr+EJAiq5mh2A+1s+4lXS1I4Y51v1CqJhPuOvU4IBLzd6EkxKrXoZyZHUz4=
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com (2603:1096:604:13e::5)
 by TYCPR01MB8456.jpnprd01.prod.outlook.com (2603:1096:400:155::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Tue, 22 Feb
 2022 10:52:31 +0000
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::8d61:a29c:6bd5:f2a1]) by OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::8d61:a29c:6bd5:f2a1%4]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 10:52:31 +0000
From: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team
	<soc@kernel.org>, Olof Johansson <olof@lixom.net>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] soc: fujitsu: Add A64FX diagnostic interrupt driver
Thread-Topic: [PATCH] soc: fujitsu: Add A64FX diagnostic interrupt driver
Thread-Index: AQHYJKtWrul8ggSTx0iTWIouzkxBW6yZHSiAgAZKI9I=
Date: Tue, 22 Feb 2022 10:52:30 +0000
Message-ID:
 <OSZPR01MB70508B35657B539FF4FA28F6EB3B9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
References: <20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com>
 <CAK8P3a027OWYrRDm3r930pYo+He7bqVSEpQKjM9od1W8ciamyw@mail.gmail.com>
In-Reply-To:
 <CAK8P3a027OWYrRDm3r930pYo+He7bqVSEpQKjM9od1W8ciamyw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-02-22T10:52:30.480Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
suggested_attachment_session_id: de2d8426-7fad-f5df-943a-77402331293e
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 090d8cc3-995f-4731-8d69-08d9f5f16ce0
x-ms-traffictypediagnostic: TYCPR01MB8456:EE_
x-microsoft-antispam-prvs:
 <TYCPR01MB84566B47648AF81F83C3C8DAEB3B9@TYCPR01MB8456.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bipatahIyLsavfXjR8p9r9mPrky9YRIwAGj/GbmawtfNj12oc+1uwYqy5c3h+w7xL85BTyw5Uc6kT6j+gNaJLYmR0uFbNaA34lFrud+pW9bFVQ8FmJ9MQJAAcYTXtvRqkSW75FIaOKU2hRlSkRd4Wzh+4BrXtkr/wrQjgqlUBNl/nOrfLAZaYAenY2XYVE0mpa+82slKPzoE3DdRFHbtVs4xSzVmOj8n49Ssrwh3/d/CTypqHZi4G0cUXTdKugozUYjt9GeXi3Biu5QQIn6jUOeeQG0ROmRALNz6vwbUXwZytCD3GOE2LXVh1cG6k5dvRjRCrWRkJFqOSVLROPNHWkIq3ct3E0l00/pzlN6IB9fpyahbbllFACryYC6QW3Mb8j51n1PewqwK+Q4xiMWJOoQ7X7XKQAcs3Udeq+TvTEY9aL8UHKrnPU23QDHd85GttJ4+gJHStZbJJvaTwVV8I2yZCJ3iKEN6PPjBhr6FzWDPDrdvn5p1vjoTgazqC7u1qZ2d4pRw61wJkXs2trMof9jymiigSueeGBwPUsaLgqeUyQ5b1KnZsuqgCG8VuLctSqSklsHrBrFOLwRmgOs28yEsXY1i7LEvzGWvaJmcNrhAWQBejlUmPpnE56CsQr9iErUGXfogite6X8Lolix58OuPuMyEe2QGQXtdeaPOMnka6dCD9XXP/we9EdGCen/UB4ubbkcB4FXbv1daMAdedw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7050.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(7696005)(66446008)(4326008)(6506007)(186003)(66946007)(8676002)(76116006)(66476007)(64756008)(66556008)(52536014)(55016003)(122000001)(85182001)(26005)(38070700005)(71200400001)(9686003)(33656002)(8936002)(86362001)(508600001)(82960400001)(5660300002)(316002)(4744005)(54906003)(2906002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?bEtVakplV0llRXNzdEQrL0xiRFVBQTZNK1Jma09sTmFTakVDcGR5cEFn?=
 =?iso-2022-jp?B?eGtnSWZrZmVjTUhBdWpBNW9WbTF5ZkV2QmlOOG1JT2ZsL3RlRjE4NE96?=
 =?iso-2022-jp?B?eFhibU5oUDRGTUlSRTVrYytnbE8veVczYWwvNTJVR09sd3oyYUt5ODFj?=
 =?iso-2022-jp?B?MitWNTBrbUJ6bCtKZmtLVTRTZHoxdUtaMXp0OEE3RWRvQzU4czEyRkMy?=
 =?iso-2022-jp?B?Nk1sc29scGhVdTkwNHlHU1hzdnNzdzBpMnpNRkM5Y3dQVmVjZVRoRXUw?=
 =?iso-2022-jp?B?VXc0V0ZRbjZubDczWmE1d1RLT0h4aGtUeWh1dEhFRTRRU3VMTnBVait4?=
 =?iso-2022-jp?B?amtlRXc0cFp2eEZWalVoZVE1M09FOW9RalkrUm9STk5xMnVaT1QrZFpx?=
 =?iso-2022-jp?B?OU5oNjF5Y1pURTFvMkNjei9kbVl6bVY5S3ZhMXRvWmp4cFQ3ME9YUTc4?=
 =?iso-2022-jp?B?dHp2Sjd3Qms4ZUswVGZlQnEwQ2lCQmd3YVQzWXNmUWVyTmtnekE5ZFcz?=
 =?iso-2022-jp?B?djdUdm13NXQ2S2VyMlRJbHpDZWFDME8xVnpoUGQvSFZMa3p5blRSblJN?=
 =?iso-2022-jp?B?MEVNU3UzL0cveTYrTXY0QXpIQjFKRzhmNncySnVOckh4Rnhub29HUWtP?=
 =?iso-2022-jp?B?MFA4K2pQNnlOcjMzYmZSM3BuSkdlNXMvY1IzdWlSOVJWa1BLNjN6VjF2?=
 =?iso-2022-jp?B?M1dnWU84WWtnOWdjYlJBK3psN0kzRnNHUXhvY3VoRlZGYkE0VElZTmMz?=
 =?iso-2022-jp?B?VDNRaC80Z25Bendic2ZUSm9iMFN1dkQ2V3FvTGtDMWgvSmhKWmEvQUhq?=
 =?iso-2022-jp?B?UlYxNWZMN2xzS1VCUk50bnU0MFNwRkxlQjNEWFhXUlRjWGVxK2RwbVJu?=
 =?iso-2022-jp?B?Vm1ENVp5VkRKTyt2L0I2T1AvQThvZHlMWDZUQ0E5SWFBYkw1ZVcwUENm?=
 =?iso-2022-jp?B?SDN0b1FiSlhhVXN4UDYzaEdreHhHckFzT2lFTGQyTWxodG5aOWdqdnl0?=
 =?iso-2022-jp?B?L0lWRkJHZTJBLzlYdUdMODc5Y213clB0UU94UDFuMVZ1bkZ4Mkswa1Q2?=
 =?iso-2022-jp?B?UEVBSzgweWdtMVk0bTJNMGxRdld1QkpLRXVUYzdOYmJsMlNyd3BsU3NP?=
 =?iso-2022-jp?B?VVF0ZjhwSThhY1RUVzdqSGRCdGdGUktGS1RCNk93OEZFdWlVeTNoRVZM?=
 =?iso-2022-jp?B?MnAveEN2Y0hxM01JTlo3eHdPQXlnMGRwYWlIQlYzYU9YVkZaUlRmb0tS?=
 =?iso-2022-jp?B?ckNucnVXbTY1aTNvU3VsT0tGaU0vZ3hPMmI4amllb25RQTN2c1lzc1pM?=
 =?iso-2022-jp?B?bU5sQmhEMUVETGZOQUk3OGdYQUJQZ0RQUm9jVjgxdVFtOTVlSDQ3Qys5?=
 =?iso-2022-jp?B?MHRCVnZiZ0hqSmZKUmpiQXpCUnFDT2Nwb2UvM3U3WXYvNmNMVzMrc2FX?=
 =?iso-2022-jp?B?QjdhZXhCSUpxaStlVSs0M3FWWG9oWkt6aHA3cW55Q3RCTVlUSU0vcURu?=
 =?iso-2022-jp?B?TkVYTHo5WjE5Q2oxVTYxQkIwK2RxUnZyeE5hc1V4S0ZmS1dFZzhheElk?=
 =?iso-2022-jp?B?eU5lVGJ2S0NmMlo3RUpyWlV4RS84VDVQTVdPcTJldE9aamVBaG9Oaisz?=
 =?iso-2022-jp?B?K3RTaDU1dzFHOXgxZi9ZVTJKRGZSTWV2SEJFSVJRc3N6b1Z6cWZPWUdz?=
 =?iso-2022-jp?B?Ukw5T0RaajB3SzBxSDdPWXJxenBxeHprM21lR1pVaTQ2U2xJMHBaT2w3?=
 =?iso-2022-jp?B?QUovc2dBR2p4bjBoY3pEYnI2ZnJjalYxQzRIOXlCUGFPazUwN1AzeG9H?=
 =?iso-2022-jp?B?cjUrVm14Z3U0QVVaTk1mdll2ZFNFMEdzdG1HM3hCb1lVSk9mY0ttc3U3?=
 =?iso-2022-jp?B?czRiZGQ0TDQ1M1VUTmhXMmNhTzVyVmsvcWN4Z2ZkRDJYNitVVXMyL3c1?=
 =?iso-2022-jp?B?dFhKMEJnbWhjcWFwSEV4cVRSRmxpQXNKOHdEdXhMU0srUC9KUXkwRjBI?=
 =?iso-2022-jp?B?cFkzTlZsNG5aSVh0bnVFUTJaSlVnRmUzSlluV2JBejR2eEQxNUFuL2Zr?=
 =?iso-2022-jp?B?MTRBdFhYVi81a0hMRUlGTE1MelY2TmdRYWhFeTY1VDRFQ0M4azVHT3F1?=
 =?iso-2022-jp?B?eWF0TWZJR1huVFdCRVFieWg2UUd4QitiVklSVVA2Q3hFTUhtZWp0VXQ1?=
 =?iso-2022-jp?B?SU45KzcvN0p2dlJPK3JOYUY3aUlPNE5oVUhNZ055UE5NYlRTTkJlc2p0?=
 =?iso-2022-jp?B?ZVJJYVVuS3dhK2FIa09qTlZaNjhvQS9rdkZkR1Q4aVVsQVhlYTdYTEhZ?=
 =?iso-2022-jp?B?Nk9haVJZWjlQcjRjYzJYSmROY2tIYXoyYkdwdm1NNGJ4dVNJTHlIMjJa?=
 =?iso-2022-jp?B?THIveWduR0JoZ1pQY044aklHNkdEcStaZFBYVHlncmZPVTEwNThPZE1H?=
 =?iso-2022-jp?B?NERXZmZnPT0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7050.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 090d8cc3-995f-4731-8d69-08d9f5f16ce0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 10:52:31.1433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMMwuMvFEmXEt9y3TIjILZM+fRszq5bXMwEMJOI4xXbQ0smCNVpO2jDOM6ma9Et6vedjrHPNgQQp/kEvWit0Wi/xsmqmVyVnQY759NcFxHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8456

Hi Arnd.=0A=
=0A=
> Is panic() the best action for this? I'm not familiar with this feature, =
but=0A=
> it sounds like handle_sysrq() might be more appropriate. How does a=0A=
> user trigger the event, and is there any sideband data that can be=0A=
> sent along with the interrupt?=0A=
=0A=
This event is triggered by sending "$ ipmitool chassis power diag" to the B=
MC.=0A=
It does not send any data when it interrupts.=0A=
Use sysrq can enable to the user to control enable/disable, it seems better=
=0A=
to use handle_sysrq().=0A=
=0A=
> Normal driver code should use readl()/writel(), not=0A=
> readl_relaxed()/writel_relaxed().=0A=
> If you do need the relaxed versions, please add a comment explaining why,=
=0A=
> otherwise change the code here and below.=0A=
=0A=
Okay, I will correct it as indicated.=0A=
=0A=
Thank you for pointing out the problem. I will release v2 which fixes=0A=
the problem.=0A=
=0A=
Hitomi Hasegawa=0A=
