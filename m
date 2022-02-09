Return-Path: <SRS0=gwCy=SY=nxp.com=leoyang.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212ADC433F5
	for <soc@archiver.kernel.org>; Wed,  9 Feb 2022 02:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C71BFC340EF; Wed,  9 Feb 2022 02:04:08 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60068.outbound.protection.outlook.com [40.107.6.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D532CC004E1;
	Wed,  9 Feb 2022 02:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D532CC004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDrvn6bovNj7lFBAIU6ox+ItbTFepijASKvrA+2fMiqcC4//StoWJ0orolzVjovmMSoofsqFMFh4llgakX3SEMXS0kuw2mklGDuQ8SQkbV8+850AjL/MT2Yas3mPR3PCtZPdYVUYuqoEdmpC/fdLSyjuw0sMrHuQLfc+DEM+xsgMWdmey/S4Z7HJ3pn8FxxIGsO8n0/muurcYU0Icq0+8wyStz7qAiJbFKgPS1sH1eDRzQ6W6UixxhGal05aV7ubgvC/LbQKi2zz6pE+FUCOiY7kR6gP3LGe0sT0PhYNwNYo0zEIyMwjgauAHMgjSlM6HrJ/eP/QZYe0r/UkzvCFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIq88WmwXPvVehHeI4hIroJuvrk2rDl15H3izDuD3b4=;
 b=gDHDAhEPqCljQDhm/A1l3N6Ya4TTcd/srNqz6x/QBWJH4SgN4CE46XoqgjMx7/h1vyPMxtFj8pcgNeIZM6GBOVf2AbbbJdjA+ZDllEJuw2qXN01KVKdAw3YBbdhmihA8UtAUUcc+JwIl8veyS/BhOt8vgrKdU+rnAiZ3P/LkV0DQmdQ04INx2Aa/xmyztCGRHw+PULNjqUCZp4sArydnuLwramTNwIK3MxqANy9wIPcoa8IYFCiGYGnKouls0N0GK2bwuYDqeyOYaJiky0GqzbdARDtEzeejuL7hmGTJELqV3/srSjgoWiUjWciAzESm7PX0xXLW10EFgbiNNW8yRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIq88WmwXPvVehHeI4hIroJuvrk2rDl15H3izDuD3b4=;
 b=sjlh6JVUk5/S81OOCACGugNT1a0avCgsrfvL+rtVLTOvS3JmD9x0X+V+woR5ucyCn3qyC2plxQXtx+gGqh7PCBRkLS72sRyLjM01nFdILiHu6IIJppCcNpTpsWucL0XiWrli1i3cobGh3DYUZfiEBqGsgiG1SKyP3sBu7R74RSc=
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com (2603:10a6:20b:42d::18)
 by VI1PR0402MB3664.eurprd04.prod.outlook.com (2603:10a6:803:1e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 9 Feb
 2022 02:04:05 +0000
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::6402:5d83:9630:6678]) by AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::6402:5d83:9630:6678%5]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 02:04:04 +0000
From: Leo Li <leoyang.li@nxp.com>
List-Id: <linux-soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, "patchwork-bot+linux-soc@kernel.org"
	<patchwork-bot+linux-soc@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: SoC Team <soc@kernel.org>
Subject: RE: [GIT PULL] soc/fsl drivers changes for next(v5.17)
Thread-Topic: [GIT PULL] soc/fsl drivers changes for next(v5.17)
Thread-Index: AQHYBNsi8nezki04gU2LC7Mor3ZAzKyJnnWAgAEKHnA=
Date: Wed, 9 Feb 2022 02:04:04 +0000
Message-ID:
 <AS8PR04MB89464D6A782E3390A41D2B028F2E9@AS8PR04MB8946.eurprd04.prod.outlook.com>
References: <20220107033736.26762-1-leoyang.li@nxp.com>
 <164167921430.24856.5117528642270798509.git-patchwork-notify@kernel.org>
 <CAK8P3a0w7S6B3SVw+esH2H=sg9jOTGK3yC3hQSwRRM6GhosdkA@mail.gmail.com>
In-Reply-To:
 <CAK8P3a0w7S6B3SVw+esH2H=sg9jOTGK3yC3hQSwRRM6GhosdkA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88d03cee-0404-404c-0c95-08d9eb707320
x-ms-traffictypediagnostic: VI1PR0402MB3664:EE_
x-microsoft-antispam-prvs:
 <VI1PR0402MB366498136494A0A8EBAB2A4D8F2E9@VI1PR0402MB3664.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ILa42aDUWg7NWYKr2g3jWkN5HDXRx74KPKxn8Y/Qa1LzYHHa163CsBLvoC4klow5/9ow7WS/69o4jZqWVxI2taiOEjy00mvEY+KnodPoqR7vMIoPkL//XjhTtp8NmGXGGjXmS/G6qbSUmgraLWKghiWE9Hv7Y/lWro2HYwf0VQPJ5+rF/RGy544/knC3gZ1rNcp3q7Y/666Yib5aPkwEnQaVPWfnSz0AknKz+2j2C1ieyg3iDhzSCiI757g3zcBzsl9D+LJrAmKU5rlC+IXHqC5lug7RMMSj0rRMTKg7/WeEh9q+3IvETjsH5vLipHsOZJEv/zLO+Wf9AZ4Dg2eMptxLapE8SFjh2qjiLFYAeiMxJZCn5DVq4ehdvgiUBUWIIP0oNEtz6DiXcFYOhTfyqm1q8zIQ7WV5n4nXTQWZwl45UO2fZLytOxcimf1lM/YSt2p2xWjSjWkgTR++VKTDw6cOQHhMOjFQErcZQyvDOIOXbu1hni2C9d57iClA1Lyql/e9L3VbYLcUm3YRqhM1PmuW87BeMCA+NqHGrGgBhbyUHbjCjLf3YDqJgxA07hYiGeOaUl2ehI1ASIVoUo82T+BRfdVWjGe4C/LQ4QQ8U9zjs1jOnSuvyxXSCQtKozLdEXEgtEQ+6p9Jc5riPCsF8PbERhGNv6qQklMPIJVY7UZ9gsD1PoV9szLaT47nZNJKBJp4QABiN+41/T6FCOzjkcQbkLK3g2NVjJnGTH838/VCe3pmdMry4kgbsLYm9Be2KWYz1ikOt/ulm1vBimT0XKjRdW9AxFPBYgfBSn8iIR8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8946.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(53546011)(86362001)(9686003)(966005)(508600001)(7696005)(6506007)(38100700002)(71200400001)(45080400002)(5660300002)(110136005)(186003)(26005)(122000001)(64756008)(66476007)(66556008)(66946007)(76116006)(52536014)(55016003)(83380400001)(38070700005)(66446008)(8936002)(8676002)(4326008)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5CBmQyw9rz+I5Xg3DFdk5P1cbfB2Zd1kndhu1rG0ASfagkxnnK6WgsMidI3n?=
 =?us-ascii?Q?VxViqLna+I8S19mk2SY9sTEmjqCZWMlRPNwMDGD/3cou7IvDloBTVFQ/yYiL?=
 =?us-ascii?Q?wRUYzcc56MLHk/w9P29fPsueoG4EZrFpVe/dvU48+J+sMLDs+oz3Cw/c+N2U?=
 =?us-ascii?Q?gWCNZC+tmLNRqScnX420KB8n12f+oCxBM7U7SCLbC3vtxc3JFc/FwdxDEzqv?=
 =?us-ascii?Q?D1mBULcNqG3EGEAZ/U5xI11S7TBmx+7+zJ5NSu6E/MRFaMQpxpaiQdszPK10?=
 =?us-ascii?Q?SVQClpCJSdR1+s0SMkUyIk09wA5tml9nLdpF4Cylz0s1qcuKYY9/Ppzugynt?=
 =?us-ascii?Q?JN3C7R7d1nOldCPQh8uRCzS8yjtj+D3iCrCxMcG6xytgAHxBqpJVpIpUo+Dr?=
 =?us-ascii?Q?BGxmF9GbF7jHFaY1K8o55T+WhWLGKH4IBAVQ1dYJBcxQKTH/KsEgvBvvlBB8?=
 =?us-ascii?Q?pUeHa50GzawSFHkqIkuqe+aUcNL8sNJJgjDfd+hk4WFHoUePTSqTEKI1y2J6?=
 =?us-ascii?Q?dw7xFDFGeG8nGafIUk5lrvYqXFlR8dQW1RzkR3vZK5ZQuRY+bhTCNnVLvGjL?=
 =?us-ascii?Q?Oyx5cYYoWjaqAd36YMinm6/RO+f5tNH4Tudf05S00ezemIUijruzCETp12w+?=
 =?us-ascii?Q?6dhb+t3FRwT//eYPb9SWg+uMVbkgxT/iANsiWbLb7jUy1isrBLv9JK3ciEaW?=
 =?us-ascii?Q?nR0qNq1MBrEZDxR4IMJw4aGfyy24p7kLrIBryOizFLQI1ggYOS4y3SLAD4l7?=
 =?us-ascii?Q?0CMClbEe5XkgqBb/mVWbYo1o3TuXaIFFPBKICkzgaG8rBM4k0V6KAddDOexI?=
 =?us-ascii?Q?co77V9yMIHKxkfflz+xKSHjRBkCymIVKQYeJ8Djfub59ERkraxX78Eore8+4?=
 =?us-ascii?Q?ANTIfAZJ01Zyf5mWmSMlvzq7+q9+2h+EPMT8rDXfwB/ofrtxs9BLPrFkIK5H?=
 =?us-ascii?Q?FoI3t4nAqlsZoLpKIwjoak4NUYFauk6C1nxWToDVe57WW97j+IVZkfuUmnxV?=
 =?us-ascii?Q?UEBoS1YSBetPy15YK6JxapdtyT7bM0A3zjM3449RqVeVjXtder+zbY/kIYyY?=
 =?us-ascii?Q?di+vFuylzj8DZmSWbp++RR1QKusvEOswT31XpxsHIUmtE+9XsOs5CGuKIsRC?=
 =?us-ascii?Q?ZLU5ltXJFGDt+jdosXESk+5V2rCgUGDLwKoRPHbPnc8gOHiT+mYST+vxLl9h?=
 =?us-ascii?Q?TnOdVwhPxNZRpHc7tnCzBOQiX7YkTAwvpJjwH0qt3bLg+a6zh1vj6gd0eu8n?=
 =?us-ascii?Q?uJeHw0NfDeO6KR5P1SvD/fvHqrzfgyQifgLQCq1i/FagWG4WxAX22tXQRvez?=
 =?us-ascii?Q?Dj/Uzrw1UNhXuEiRFMaec925WJaKGUWT749dqC8qXwch3e5wvbbrkS+jEQa/?=
 =?us-ascii?Q?xDp5zkkGLod+4NG62mHvBiWDsVZRSToyLEaZ8zRn2v+PrMn7AdXMVu2lQlLF?=
 =?us-ascii?Q?HbN0GgklDekkeuGAQAjZRZwx4o2llZPQCR6aWZWPb2abibe5YKZY+I5dizxH?=
 =?us-ascii?Q?y/+mLJcF2V7gr2rhHCBmF6kPnpJq5IIGpcRmYE7NTXIq9J7Cr4ZhyF/QkWkE?=
 =?us-ascii?Q?6udMlr5+XMVGerrjyx8/FMZHNXxXUTiLy7eiPMj+80kGwyrsqe6vlP7bgIc6?=
 =?us-ascii?Q?cw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8946.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d03cee-0404-404c-0c95-08d9eb707320
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 02:04:04.9511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /CmVdErgRk2Mw+sP3DluBla7eIpYY0+2CXJyKYUd66JtcvTRgFDPz+bCj1ZgwynGUDUpXo4yKsUYBCJLAmiVfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3664



> -----Original Message-----
> From: Arnd Bergmann <arnd@arndb.de>
> Sent: Tuesday, February 8, 2022 6:10 PM
> To: patchwork-bot+linux-soc@kernel.org
> Cc: Leo Li <leoyang.li@nxp.com>; SoC Team <soc@kernel.org>
> Subject: Re: [GIT PULL] soc/fsl drivers changes for next(v5.17)
>=20
> On Sat, Jan 8, 2022 at 11:00 PM <patchwork-bot+linux-soc@kernel.org>
> wrote:
> >
> > Hello:
> >
> > This pull request was applied to soc/soc.git (for-next) by Olof
> > Johansson <olof@lixom.net>:
> >
> > On Thu,  6 Jan 2022 21:37:36 -0600 you wrote:
> > > Hi soc maintainers,
> > >
> > > Please merge the following new changes for soc/fsl drivers.
> > >
> > > Regards,
> > > Leo
> > >
> > > [...]
> >
> > Here is the summary with links:
> >   - [GIT,PULL] soc/fsl drivers changes for next(v5.17)
> >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.
> >
> kernel.org%2Fsoc%2Fsoc%2Fc%2F6b6db66fb373&amp;data=3D04%7C01%7Cleo
> yang.l
> >
> i%40nxp.com%7C62efc03616da4c8aada408d9eaeb4281%7C686ea1d3bc2b4c6
> fa92cd
> >
> 99c5c301635%7C0%7C1%7C637799118421931562%7CUnknown%7CTWFpbGZ
> sb3d8eyJWI
> >
> joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
> 000&a
> >
> mp;sdata=3DP%2BRay%2F%2FGtKfCRBdqkK5hnniR83WXJx%2FaW%2FINNGLws
> Ig%3D&amp;
> > reserved=3D0
>=20
> Hi Leo,
>=20
> As you probably noticed, this branch did not make it into v5.17-rc1 becau=
se of
> a mistake on our end, and I have now dropped it from the for-next branch.
>=20
> Most of the commits here are bugfixes, but I'm not sure if you still want=
 all of
> them in 5.17. If you can send me an updated pull request for the importan=
t
> fixes, I'll put that into our fixes branch, and wait for the rest to come=
 with
> your 5.18 updates.

Sure.  Will submit fix patches in a fix pull request.

Regards,
Leo
