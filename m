Return-Path: <SRS0=nGZT=NX=fujitsu.com=tan.shaopeng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C84C432BE
	for <soc@archiver.kernel.org>; Wed,  1 Sep 2021 08:36:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0678A61053; Wed,  1 Sep 2021 08:36:28 +0000 (UTC)
X-Greylist: delayed 64 seconds by postgrey-1.37 at mail.kernel.org; Wed, 01 Sep 2021 08:36:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40B0C60184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=fujitsu.com
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com [68.232.152.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B0C60184;
	Wed,  1 Sep 2021 08:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1630485388; x=1662021388;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=+CtD98KG/89PR8G0+Etdao56dZrQBpz3nzYVqK1eZY0=;
  b=n2gH3jFneQ/Qn2KBBpElXIuCBrpvSLiqdKDbtFNcNJ5H2LCA1+3bnZRj
   L73v3z1DZ2BfuOn1LZfT9G6KThkkKRk02kAx7MY3COHTycw8aAGDmtuTw
   78hDSGBTdwLDbjg8XiLnvplyhwPm9dJOBCP9yHmZRuHiUdaxi8VGTk5th
   9LgDPEQfHJXq8Xvo37OfqrKey23O+Z72tUEAswuHO/ozc/WxUZH78nD/p
   XbfoSWRYyUH4XDo9UrKStSr5Np0icN02pQ3GPuphQY2MAyRzfypksHdvf
   9M5DWtxYZWqBNj3ibNBXwVy75FsqkBsn/i/d8TVCaYUSVHuGkp9TPUGbh
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="46397076"
X-IronPort-AV: E=Sophos;i="5.84,368,1620658800"; 
   d="scan'208";a="46397076"
Received: from mail-ty1jpn01lp2056.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.56])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2021 17:35:20 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNcys+9fI62IDGevjyHpBaRJqV+KsLLnbry47ULqETs+LG/CkLHnUJ34VijHvn9SaRxK3vnIOxnbINCOjyuJ8if9dQQopjVq/yOlyJmrlT4TSb3OI6cTfgFbp/1+ipAU7/H9nZ88pqm88NexEEKiDiNjqGGf2ZHwAxArg+uMcxcrNZh15WyLBEPOw1u+8IWnDzeYJjNGEBrUBQhc7/mayqDbkhFShdKvbgJAmvGyPeWJit6Ebwz7uk65McmCfp1cmyZvJPRQLqkMAqAm4wTJ9n6lZYbUmYCv5svkFmNLoBqFSv061ezo9EQjqoiwuhbI/HzSj67FA/FjudljulyZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+CtD98KG/89PR8G0+Etdao56dZrQBpz3nzYVqK1eZY0=;
 b=od+d+6UQSa+U2q78/3bvCmNvTQiPt2U2WqTkZuQE5DfsbdTWNvBCKEw2r1pNchgzpJoXQeAUCKTW3yrszZQVtmwmNA5vUJNFeaTUU/l8uQBm0lIcy7rimaCUYPU3hoKCuN0QJagxE6luw9MguIh1UiB5vBFj6Q+5Q+/VPZJX0/R26iJU1k1w+ERh9nImHEonlB9cc3qvzlayQCdq/96svh8ijy7VtUKiX4tXVMcGaNuwmhRcQQwnvjEx4997MEVzIvdyQH//VOO5DsWBtYpSPVM9WweKleohuAkKc7YVC4UgA3+wDQ1RkjZKrskQ1CgG/YaZhU3tXR6dMOAdVkNvgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CtD98KG/89PR8G0+Etdao56dZrQBpz3nzYVqK1eZY0=;
 b=pytP36zkFFpIQK6o8CxojK8DmUWYHa0v09QzZK8SmlzNV5/gzN7pdrfQRQOZWhOYQpnPrVLhZhijCTrP70bdfgOLENKH8Ox9c0lVt+x6BUTIh9ZRngG/qpN0XscQ+3zMLVuqwX/Hr7Q0AUtuPpRuIfYTguJRBI81KYnS6UOJHqU=
Received: from TYAPR01MB6330.jpnprd01.prod.outlook.com (2603:1096:402:3e::12)
 by TY1PR01MB1882.jpnprd01.prod.outlook.com (2603:1096:403:4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 08:35:17 +0000
Received: from TYAPR01MB6330.jpnprd01.prod.outlook.com
 ([fe80::b94b:d5ad:b6ff:956b]) by TYAPR01MB6330.jpnprd01.prod.outlook.com
 ([fe80::b94b:d5ad:b6ff:956b%4]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 08:35:16 +0000
From: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
To: "'james.morse@arm.com'" <james.morse@arm.com>
List-Id: <soc.lore.kernel.org>
CC: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	"'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>, "'soc@kernel.org'" <soc@kernel.org>,
	"'tony.luck@intel.com'" <tony.luck@intel.com>, "'arnd@arndb.de'"
	<arnd@arndb.de>, "'will@kernel.org'" <will@kernel.org>,
	"'catalin.marinas@arm.com'" <catalin.marinas@arm.com>, "'olof@lixom.net'"
	<olof@lixom.net>, "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
Subject: RE: About resctrl code rebase
Thread-Topic: RE: About resctrl code rebase
Thread-Index: AdefCe9QtjQubFftQH+oh+e+FXNxSg==
Date: Wed, 1 Sep 2021 08:35:16 +0000
Message-ID:
 <TYAPR01MB6330CE3CB67CF8F602D44D098BCD9@TYAPR01MB6330.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9OGE0MmUzMDItYmViZC00Yzg0LTkwOTItM2Jl?=
 =?iso-2022-jp?B?ZWRlNDAyZjBhO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjEtMDktMDFUMDg6MTc6NDlaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cdc8ea5-7a04-4696-7ac1-08d96d236d03
x-ms-traffictypediagnostic: TY1PR01MB1882:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <TY1PR01MB18828D33FA69E3CE60207BF98BCD9@TY1PR01MB1882.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 u2AnZaIFHSkJDiIN/oZdMVjBzRSGI8VvPYA+CnY7x5o4nQMpW7CAyoU45ftnasFONimCLwTXHuoUI9qo8+98/C2+cWrFnHp6vll8kMt3DaGxOinmPWLE2PmnA5WwfyupKBhSE6paHHxtBn1i0t9Z1/q1DOwKh8umNkWv4jgtjQP740WZqNUiR+eZ9Tu5qOX4N+yRzG8MjrP57CuPePLCTL0fGv6i1ZYIByuIAB/b95khnqaIxx9SgmUTyGL3xh9UTGfTB4Fh53c/i0zsKS2VXKlR89GI897P4zzatuFKnyYPW7pZzx1yloZWYXe1vEroquhg9Av865wAzDvBZWe6toLQkEx1mP1i+LpDOB/YWvnz6KlEzfStqAtO5+KdvhRNCCLTbOeLbdy0q2D/fkufPcbvuEJ3zK3KuGUlKN1sjY30MVTwSncFfhwufUUixYvXlxGyKoE+EqcE6ddLlLZbwxG4U6iWheVWXNs0cguY4ryVFNE0hQWmp/SOWLGEHdpKCscXmCV5TnAnLVaaJk0PpMtCSeSmA8imDgA16ChKrJiFph1ngLm6pzwcpEUJjT4HbnGNaGroR/4c1MQkASUhVIhOoeMYNClOrucsAiFyi0aulLZE/4pwml0I2XTDiX7QnPxR72F9ro8bjBpHZfCFOvXA86pIyo2wCnN7LgDGwNSp+r144v3FM1A9zUMG/oKM2MWfpLIsQP62BbbYoAwHEpSHGgZB+WRBGTXFkpRxK1tEQYzuoes3HfE/JcKBB1RWot0hiI1LZu/c7+5jDWxewmdDPYn/am6q+s0finZGSSMNRBSdQrg77+z5e/sm0dp1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB6330.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(66446008)(55016002)(9686003)(64756008)(66556008)(66946007)(66476007)(5660300002)(76116006)(52536014)(3480700007)(316002)(4326008)(107886003)(8936002)(8676002)(85182001)(2906002)(33656002)(83380400001)(6916009)(478600001)(54906003)(186003)(966005)(26005)(86362001)(4744005)(71200400001)(6506007)(38100700002)(7696005)(122000001)(38070700005)(491001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?M2tkR0wxSnBnMnkwTDU5SjVaR05UVHA5eHdoYzVONzVNOENsdWtuZ2ox?=
 =?iso-2022-jp?B?cU93MmU2QkMwWEo0SFE1MjJ2cTkxQXl3UHRZR2pEVkNVcDlNOE44eSsv?=
 =?iso-2022-jp?B?aUlsaDJzcndCV21JOWhKUmJIZXAxN1N6dkRSWmpYSEl5ZUo5c1M1V29v?=
 =?iso-2022-jp?B?SFYyR3lNQklqUUJHYllvK0d0TnN3dGo5cFFOSFQyRjkxT3FPUC9yVTFn?=
 =?iso-2022-jp?B?L013cjd1ajJoZzVKWEF6bnVKQ1N3NlhZS2U0YzJoaHI2WFR1NVFkVEZk?=
 =?iso-2022-jp?B?b1g2OWU1Mm50alltMGdKR3AwcHE1a0ZwYWNTTjNibFJRbS9YNCsyM2wx?=
 =?iso-2022-jp?B?bUwzUlBLa2Q3Ky8zUUhwZ3ZuY05xWXRZeEhvRmNrRVEvUjEyN0pOYTcy?=
 =?iso-2022-jp?B?L0dMNUd5K21GM1liR2ttcmlaSkZRRXlOQUtncEE0enRlYmp3RUV3YWI4?=
 =?iso-2022-jp?B?MkNTL1BWenlPdWovcEN2NmsrRE1USlRudmFjRVNKTlY3dXRZVUJ6bTA3?=
 =?iso-2022-jp?B?Qmk2ZGE1T1Y5cXFtWEtlUXgwSG9paTAzb3M2ZVpUMkhmYVBpSmkycy9N?=
 =?iso-2022-jp?B?aVE4MHltT3dpVzZBUTB2bUlSTTZQVDF0Q0RPR2lwSWt6YWE3dUM4amxm?=
 =?iso-2022-jp?B?U0hSVEZKR1RCd0JnSThqM3FJVzJmVXZyZU9ITGZCZkZCZ1BmM0NkTDNO?=
 =?iso-2022-jp?B?RjltcUJOa3pWWWprNHRybG9VdVh0TVJuRUEwN0ZsQm1JWHhQZVdTaGZ3?=
 =?iso-2022-jp?B?VFZTZ0Y3cHBFU1AvQ29RaGFxbXJMbUdLcXhEYlVOTkRUdkJJMXZzRmZX?=
 =?iso-2022-jp?B?NmJrdzgyZEUraUdEZmxobDNGNEZEUThORkhIalcwSWxOTlRtZ0x2dE5x?=
 =?iso-2022-jp?B?WlRwS3Y0WFh6bExVS2puY3NNQXV4TzlMVVMvd1hwVTZ0RzYzbHUxdU8v?=
 =?iso-2022-jp?B?MW9XWFR5cnFjVWlOUXZ6OFBNR1Q3R2crWms4UFJ3VmNlL2hoaytGL08x?=
 =?iso-2022-jp?B?bEtpNnRXV0w5NzRCSzNleFBBaExhTkEwd1BEZ1RqUXo2Y2RxUVViUCtL?=
 =?iso-2022-jp?B?dHZlRlZPQUlkNEU1Z0x0OERhYlcxUnRtYkd5QUJkL0pkN2dvZjgrOHdF?=
 =?iso-2022-jp?B?SDJHMjVGVmxhbStla0FzUS9ZMHViSHFFcWdCNXZoYmQ0SjVZUExtT0NB?=
 =?iso-2022-jp?B?ZXR2dXN5dzFzS0tHRFY1YmRYNVhkZjdyajV1TVZsaG9xZDNzRkZpYUhV?=
 =?iso-2022-jp?B?TFlMRUYveVVGdUhhSlZEeFFUZE5zQ0tkdlJncW5mWnMyNWgxdkowM0ZV?=
 =?iso-2022-jp?B?RFZzYmc2eTRieU1kUFV2T0NHamFzZnpVcDF3dGVNeDE5dVNSem16Z0ZO?=
 =?iso-2022-jp?B?V1BUNWZzTU52ZDR4dlAwU0lCZE41VWMzSVROYlhrSFNZdEd2VDdQTGZy?=
 =?iso-2022-jp?B?YTFLdTVQRmxjMTBUeFphUE5BSUtJOEdIUDZGU1dTUXRpSzZSMk5GNlN4?=
 =?iso-2022-jp?B?ZmlTbWgzbXVYYlRERUJwa3BEdFd1RFRZMGYvQkQvc0FkbGxRa0VFNjh1?=
 =?iso-2022-jp?B?dDBsc1k0RWwxVy9idjRJWHF6dWpLdTNSTkJYYm9CL3FJMGtLR3h1ZXVD?=
 =?iso-2022-jp?B?SG11UEJkMHpkZXd1NFdEMmNzSzZHOXpybmxBQzR4TmNqeDl2Vml4UEw0?=
 =?iso-2022-jp?B?eGwxb1d6ZmNXeXhoTXhmMmg4U2ttbE91bHZGZGo3eFZKOFR0cndUTGR6?=
 =?iso-2022-jp?B?bDJuOTVuQy9YTjR6S2FQb1oraGs4YXhLbFBOSDVGU0l6TkhhZ1l4WUti?=
 =?iso-2022-jp?B?UEc3MmMwMWFjRWpoanY2NVo4YnEzMlhwQ3g0R3MybzZZdFpsc0pWakNu?=
 =?iso-2022-jp?B?YTBrTVFSdTJjaFRscmhHWUtsSU5Cc1dmMW1VK2RuOU9yVUR2N2ZoR2JT?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6330.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdc8ea5-7a04-4696-7ac1-08d96d236d03
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 08:35:16.6458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XmaeEIiIunMCeKXDCDVoH49A0pupo/dbxGvskYHTpBfAmJYC3ftMnxoVLzh1QbZiTVJuCac35K2O2D6izhN8EnFQLIk26c4B7AXMrpRRoQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1882

Hi, James Morse

> As you known, Fujitsu is implementing a feature that add A64FX's cache=20
> control function into resctrl. Fujitsu will implement this feature base
> on your rebased code. I think the commit of refactoring arch/x86=20
> implementation of resctrl has been merged into the x86/cache branch.=20
> https://lore.kernel.org/lkml/162871088112.395.12879267279872673224.tip-bo=
t2@tip-bot2/=20

> I would like to know whether you have rebased these codes that move=20
> the common parts of multiple architectures to somewhere.=20
> And where is the rebase code?=20
> In addition, when will you release the latest MPAM patch?
I'm afraid that my message may not have reached you.
I look forward to hearing from you.

Best regards,
Tan Shaopeng
