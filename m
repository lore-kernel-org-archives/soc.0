Return-Path: <SRS0=MXBA=NK=fujitsu.com=tan.shaopeng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899E3C4338F
	for <soc@archiver.kernel.org>; Thu, 19 Aug 2021 05:15:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4A68F6112E; Thu, 19 Aug 2021 05:15:41 +0000 (UTC)
X-Greylist: delayed 63 seconds by postgrey-1.37 at mail.kernel.org; Thu, 19 Aug 2021 05:15:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F36F61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=fujitsu.com
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F36F61107;
	Thu, 19 Aug 2021 05:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1629350141; x=1660886141;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=F2jFuOc0kR1hAr8HRrNmmB+mPw4X7I4N/g/vgCWEgwI=;
  b=LwIz4b4EEccNcYFkqEduzJsxDDmtAjyW5rHjKGlriDPlfDIpudlAaI9o
   f8+RqJ3r+q/Kk6Jth10AI8MVRQgOEWtzp0VYEH7mekJDYwNBD1vdlF2tg
   3e8m7gP2A9j3odlPm6KXRE4SQw8eryauJA/MYD75stfiMbugVPpUQvwns
   ndhDPEkM0M91tjECmUg/GnS14rw+ZepsqFVILpLvVsd5FAPXUgcB0190L
   d9jDnV4gcm01Awj6tp62FuZSDQs7bGLjYvlib94kTL+ErpWz1DfXwNwXt
   R1HvJ5mWfVpyp7+N3RQ0Q1x2hNY0bbxToVyWeFz47vYfZmAdedKcjCIzy
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="36810601"
X-IronPort-AV: E=Sophos;i="5.84,333,1620658800"; 
   d="scan'208,217";a="36810601"
Received: from mail-pu1apc01lp2054.outbound.protection.outlook.com (HELO APC01-PU1-obe.outbound.protection.outlook.com) ([104.47.126.54])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2021 14:14:33 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeT0byW3RfI/Hf00yLYpnMWYfPiLWrqgW7gtYujEUgL8o3CMUPNSNlseL8KikcPiTS6iLhpDJv/AIBlqNQNQjwKhnfYAKi/5iYyf0Uuj3iDvSTFJjQUXXTQtSyGzRbDCi+zQQJw7efmU+MKyPdK75A2/9dADtRWWY1HrlUaUIaW67LzRFl9lk0jJzkQ/Ag6UQ1rDPmauzW1jLYek0Wk4vCoibGmBEoQntCgyHwps7EF0vhp8RMzmgazDbRFRMrW7ncI8V1xIM5OJLte7fql9I1jOnGuNH9K2vWI25EMaaa+wRYCKFGDlJ8ZuqE6armAsHVlMooJv3ea+6r+IRgzezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul87O4h+W8a35+QB+eFoATK3dea2STOqRVDV7tMQMfA=;
 b=C9cMO5mmnIKrwoEjVlmHQww0L+MqejFUxm+i0bmim6YhJgaqIwvMz3UsmMf3YJlhHX+/EFoZznEhEcQc8Jm/ISNQr1RD3ffrPjytvW8g89shkQqTRcLTwBZPs9ULOs+3+6AMCHifxPEsR2VCgzSKLHGlkCmjjWg7nWKOWWCv6N3skG/EfTRsFbJ4/DGUSGQdhFJ4xy5pBxLnDs82E4f3YXF+KWm2aBdz+ug0mEnbT6xLGDgRrYrQEwrn8aqUq0wD+7t3xREANid78VKUQCLxIxy9T+EQHVeLkeisIG7FzYG86a49biBP9TiL+cscqSlTtvCq31EZgX2fvB5Cy88idg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul87O4h+W8a35+QB+eFoATK3dea2STOqRVDV7tMQMfA=;
 b=cZPyah0qgL5r/yTXXYLEFb1bRDyQsCe7VnZHRyNdvXgX/kdLYGi5iUpfgiGd6RxC6Uyckca+2WI5ooaNK0nYkRlkO767oCEAj6LPSkQZ3xVcT4L6xrt5PeMlmLkIDCuQeEINhA3gZm0hC1ftaBI8aLGtyT9uWLLknW+F+6YxRII=
Received: from TYAPR01MB6330.jpnprd01.prod.outlook.com (2603:1096:402:3e::12)
 by TY2PR01MB2907.jpnprd01.prod.outlook.com (2603:1096:404:7a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Thu, 19 Aug
 2021 05:14:29 +0000
Received: from TYAPR01MB6330.jpnprd01.prod.outlook.com
 ([fe80::c1fe:561e:4369:1300]) by TYAPR01MB6330.jpnprd01.prod.outlook.com
 ([fe80::c1fe:561e:4369:1300%3]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 05:14:29 +0000
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
Subject: About resctrl code rebase
Thread-Topic: About resctrl code rebase
Thread-Index: AdeUuCO0094nMvKmQkiigOIwGpDqlQ==
Date: Thu, 19 Aug 2021 05:14:29 +0000
Message-ID:
 <TYAPR01MB6330F88A234F98FEF239EDD28BC09@TYAPR01MB6330.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9MzYyM2I0MGMtNDE0MC00NzA1LTg0MjYtMTZk?=
 =?iso-2022-jp?B?YzNmNGY0N2VmO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjEtMDgtMTlUMDQ6NTU6NDZaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 090a2113-12df-4b70-2f94-08d962d03905
x-ms-traffictypediagnostic: TY2PR01MB2907:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <TY2PR01MB29078F0F313B517FAE48D3788BC09@TY2PR01MB2907.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hm/vty5yHUk0Lj4gQBSSwhREdWsqlhg7ElepgQ0csSqQWhy8yba/ue1TLW8hC46mbN7X0/mlz5gM9sJ2BQ2Ey1cwYvO0uYMWiB4ReIDTrDzRbo4/PIT8mA9bJont2uExFzqxAKn70j5C2h6i5I7VkTNsZebc0aufqVNjqGxI9w0m5px/NSJt0g3HO5HJUY0uufq85DspcGzSc7sJKl/zRRfC9gyHyMHwry5I4tjc9f5WVZhXo/KlLklA5wlgzMsiHGAYHLmTWRZpU2MbuoJS0LIpJaC+2B7CI80BLw2iAw9NwuYxUJFENtTov0FwYxhKAE+fRbDiHYMRdQgAZUEHTny7VROgOnRbMML0yuxuY10iOdEjLv6wofmli6iKezk1yphpHianyUDKi3hRZZxm6bcEV8lHATGM2s7PZmiVqeCSseOOlk5JlutaH7ERdL25N0hfaWd60F02+il9CNZBkFqFHZ7ETyk36siSmtqt+xBsQ7AfuKHKEjEElfUBEmi4In+WZiVi252S15MQVZLeQojPDDFnEiuOAN7sIKTzGn17LirQyjSVacnzMsGJioUBYFdi3+IHXRQzK8H7gM6VNrbYsaAs4EHeo9GlfIkXvTbphuFLzw0gw/l68ikwU3KS1FU07/V7isxu9vP54Cqo1QyfxPBTRkmkqY3hkvPzb+iIIz+UazAhMVPhe1N2/3hLryCQmklp1Muh+QsF4ZaXJ2+BWOLQhYjVR25TMQG0nNdqJw4977NJZ6QXyX2BCnuWOXRPAfHjJSIZuL8cdEQPzdgSYEkRn9kXcubCXpa6eJXsabiG6k2W8aUEHZnIjz1g
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB6330.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(186003)(9686003)(107886003)(26005)(71200400001)(166002)(83380400001)(2906002)(316002)(38070700005)(8676002)(6916009)(85182001)(966005)(478600001)(8936002)(33656002)(55016002)(7696005)(52536014)(38100700002)(66476007)(3480700007)(64756008)(66556008)(66446008)(86362001)(6506007)(66946007)(5660300002)(54906003)(4326008)(4744005)(76116006)(122000001)(491001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?aWxrQytFdGhtRXA2Y2hvUlVGK0YwQWVRaE9pS3JHUjNYTUcwOWc1YVBt?=
 =?iso-2022-jp?B?REE3eWtEWXdaWE5lZjFpMW5JNE0xK2J2bWhpT1B6dWFMYk45THR4MzNZ?=
 =?iso-2022-jp?B?MlMyOVNIa0VVTmVnV0Fibm9DWER2NCsvcDNHcDl1bVNpcVBuUmJsZEM3?=
 =?iso-2022-jp?B?Y1cxc2hEZmlGdWhZY0FBZSt4bDYwbXdkNUx5QmR3S3prMlBqRGRpSkls?=
 =?iso-2022-jp?B?RGRjRmduTDd2djBpZ2xvZ1YyMHNKWEh5dDNEUWpIYWtlbVRMVnZOeU1l?=
 =?iso-2022-jp?B?cXJqbHRhUU1VV0d4Q0M3SHZBbVlBdGhaeUZ0cEFJNEVuNDNqZUF3K09Q?=
 =?iso-2022-jp?B?aVU1Y3lGQUNOZXY4c2w2c3pFbEw4dCtTRE84dFd0Mnl0TE10NmZ6TEdl?=
 =?iso-2022-jp?B?WXlVVmt2RGI4M1RPK1V6eU80VjZvR1JNeUFPeWh2aDViaGNRZkhnak5w?=
 =?iso-2022-jp?B?bm53YXk1c3M4cmVZMml3aW9QS1VWOWcwdGZCL3VacnNBQmR1WjZsMjdP?=
 =?iso-2022-jp?B?SDBhakN3U0pxSnJkQUlIUUx1RkdzQlVYL1pCZjNpVEU5elhDU3Y3Z1By?=
 =?iso-2022-jp?B?c2EvRytwZWJSVGdDdWlneGZZN2UvL0FhbVpvWEFxTFVMWGV6U2lRVWlB?=
 =?iso-2022-jp?B?TDF6aHdRcE5OMkdPR3lldWROMFJwOHJYUnNiZWZYNGZMdHhvMlVxTmd1?=
 =?iso-2022-jp?B?d2NsUU5YSlczOC96MVZGOWd4azlCR0E0Rkh0aVJXTFA4eXpqRVhQMHdU?=
 =?iso-2022-jp?B?Um9KOEdVQjIvdUxydGFtbWJQUUprYW9VRVdDM1RncTRlZG4raFdmbTU2?=
 =?iso-2022-jp?B?QURMRERzREtKVDlRYmZMeVVJOS9QUFNaTE1LdUhDZC8zOGZlcTEwM0Z3?=
 =?iso-2022-jp?B?OUpDZ2M2bC96azlROTI1QmZsaEQ0UGpHVHRkNUVZV2pPTXlPMG1KYVcy?=
 =?iso-2022-jp?B?L2ltb3hOTHZ1a2twVGIxMTVkMnJSdVNLY1F4RUFIbUJpSm4rcU1mUU05?=
 =?iso-2022-jp?B?eG1XdzU5aGtueXJWdjJLcndJY0pCcTFPU2V4N1VXMjBXNnViRyt4VWxn?=
 =?iso-2022-jp?B?SE8rUWRjeTVoVTJXWUU0UTdjWmUwVWlnRFF1c0MrRlVWNS9LSlVscGpG?=
 =?iso-2022-jp?B?NDRMaUtSRjlGU04xTzB0ZEROTlpEdFJneVNWVWI3NEtOMEhWTGs1RjVY?=
 =?iso-2022-jp?B?cTZPL1ZUWGViZEZxZmtTTDNOallGWG5xV0FiSUpxYXJ6V2ZieWlZcXVW?=
 =?iso-2022-jp?B?TkNRVk4vRzJyUEhvbFVNRklqbnVDZEt5RDZGMjNiNnoyL0tZWkp3WVlk?=
 =?iso-2022-jp?B?RmhEMlM5YzR6d2k1OW1VMHE3QW82azNMQk5VdnNQaG0ydVdqSUJwN1U0?=
 =?iso-2022-jp?B?RzdOSE5LMU9jNDhYVDQ1dndmaEtKYlJDaHl3ck5rbGNQYzM2UGhacGo2?=
 =?iso-2022-jp?B?UldTY3Y0aS8yYktDSjh5MkNzdmp1ZE1sT0kxUDVaN0FUVFNhaDFqUTBB?=
 =?iso-2022-jp?B?TjZTcVVmelptK1E4Z0FTTWxCZ0ZPSHBaZ2k3ZFJUUXljWXlWQTgxQ055?=
 =?iso-2022-jp?B?bWV2N2pEYkpCcmtOcXM2eWdEUmNKM1JwQ1B5blMvWFBWbW1kRGZMM2lh?=
 =?iso-2022-jp?B?b0VrekNmeURGVXBkekdyeTBtQVRseGtzdDYxTFdGSTE5dHhKYlVONFZQ?=
 =?iso-2022-jp?B?MDZQT2V1T056NG9pblpYNzlEWjhFaS9kQmQxbnhnc2lJVU5QUmp6dFNv?=
 =?iso-2022-jp?B?TEFBeS8vdDVpRnlMZVBhUjhoZjRGTTdYZWg3TTEwNFVaSEtzeVNGc0J5?=
 =?iso-2022-jp?B?S3cvZ3Y2SWZWUllTcWhRY1I2ZXJ2OTRGOUxHMVVIYXg2REhVTVFGQlND?=
 =?iso-2022-jp?B?d3I4bzFOc0FBU0xoa05YZlozRkVFPQ==?=
Content-Type: multipart/alternative;
	boundary="_000_TYAPR01MB6330F88A234F98FEF239EDD28BC09TYAPR01MB6330jpnp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6330.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 090a2113-12df-4b70-2f94-08d962d03905
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2021 05:14:29.8249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JX/SvYU+rynM+sAS+OgsLI2ArM5ICTueZIMDHkL3ebeCHgvKxFh22132onADRwouli85KwMOrsInTOd7Q1RI2628ojlIz9OIohA9v17J9IQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2907

--_000_TYAPR01MB6330F88A234F98FEF239EDD28BC09TYAPR01MB6330jpnp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi, James Morse

As you known, Fujitsu is implementing a feature that add A64FX's cache
control function into resctrl. Fujitsu will implement this feature base
on your rebased code. I think the commit of refactoring arch/x86
implementation of resctrl has been merged into the x86/cache branch.
https://lore.kernel.org/lkml/162871088112.395.12879267279872673224.tip-bot2=
@tip-bot2/

I would like to know whether you have rebased these codes that move
the common parts of multiple architectures to somewhere.
And where is the rebase code?
In addition, when will you release the latest MPAM patch?

Best regards,
Tan Shaopeng


--_000_TYAPR01MB6330F88A234F98FEF239EDD28BC09TYAPR01MB6330jpnp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"=1B$B#M#S=1B(B =1B$B%4%7%C%/=1B(B";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"\@=1B$B#M#S=1B(B =1B$B%4%7%C%/=1B(B";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0mm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Arial",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.17
	{mso-style-type:personal-compose;
	font-family:"Arial",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:99.25pt 30.0mm 30.0mm 30.0mm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026">
<v:textbox inset=3D"5.85pt,.7pt,5.85pt,.7pt" />
</o:shapedefaults></xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"JA" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Hi, =
James Morse<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">As y=
ou known, Fujitsu is implementing a feature that add A64FX's cache
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">cont=
rol function into resctrl. Fujitsu will implement this feature base<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">on y=
our rebased code. I think the commit of refactoring arch/x86
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">impl=
ementation of resctrl has been merged into the x86/cache branch.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><a h=
ref=3D"https://lore.kernel.org/lkml/162871088112.395.12879267279872673224.t=
ip-bot2@tip-bot2/">https://lore.kernel.org/lkml/162871088112.395.1287926727=
9872673224.tip-bot2@tip-bot2/</a>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">I wo=
uld like to know whether you have rebased these codes that move
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">the =
common parts of multiple architectures to somewhere.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">And =
where is the rebase code?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">In a=
ddition, when will you release the latest MPAM patch?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Best=
 regards, <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Tan =
Shaopeng<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TYAPR01MB6330F88A234F98FEF239EDD28BC09TYAPR01MB6330jpnp_--
