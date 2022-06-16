Return-Path: <SRS0=6Buh=WX=fujitsu.com=hasegawa-hitomi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB72C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 09:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E924C3411B; Thu, 16 Jun 2022 09:03:48 +0000 (UTC)
Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com [216.71.158.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22A88C34114;
	Thu, 16 Jun 2022 09:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22A88C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=fujitsu.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1655370226; x=1686906226;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xcIsdM/AvEwP7rJWbGG7mvfNQxd0hpjS4GhRkW8lrtM=;
  b=IIZT0u+ef5sXH7khSocARTXcUoIDv+3oWXLQ0GgabX6bFFvb4HsE3JmP
   3x4h8Kq3ML75pC2wuIsd/Z2gmgW3QyMEIItCopM9AoRL2nXY2Inj4tou3
   BpHq+Rv46CHZwa+2sR0QwvqtYrWFHsAnh3uXvTOY8QOaQcgAqz2ul/szu
   qsTLvH0AlMHd+k0ITf/UEtuuBbVF9eJzoEkitkQiWXTxQx1evc7iU+y+Y
   gPJzDvJd+9WQ5Mgv9qi1IoHS/Vxj1mfPPdEPmeTIY8GJ6xFWUISBmwtaU
   3S82NmuKeJ54guIBRGdSBNoIczkYznvP3gQmyUbaXvyimR2LywG3EIlmP
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="58174072"
X-IronPort-AV: E=Sophos;i="5.91,304,1647270000"; 
   d="scan'208";a="58174072"
Received: from mail-tycjpn01lp2168.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.168])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 18:02:27 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HW63Vik95h35e9n2V3/IHJe1WDUmLxS0dd4SL5FAuoVGQRCdByz02W87gSbqLvj/gSpPrfpUxIxDU92+83tbwGMA9aUvlnpmC87DYJBWSvNHgDQLC1pxQH7LDt5aampywpOiAcOFepoDp6ts797CS3Q4wX9Aewus07L9oM8JCsQ3qaq2UlS6ao0HgjYAqBPDWuEnxw/h2YiF5ngQqwIBv6Xy4DDeMWJ195phKWCimL166n47ZYL4woVW+EDJgOasaTIhk612/jzL/2lPp7MJSUAcSYT9B2dmsbHV0zyR1JaLtxueISbHOUtXvT0aeFpnn2lBuStJ3/LrSPobuqowdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcIsdM/AvEwP7rJWbGG7mvfNQxd0hpjS4GhRkW8lrtM=;
 b=VXpZJX7KHAmIbiOuH1N+AyiirwJh/sJ0wi9J3gDpeSjaH/PrvYLhOeleaEuK9F7lUVGSkD3xeI/awEN9yR3PokUsIpUlT7rX9OBqaWjjC1pc3vdhLzrwRnIMcj2/W/olIyKPfSDFG097KQcGexuzH+nTaeZJExcDNJUaDoRfcY7ySEtvze40rnNPCq7DF//85CX5F4ogFaTreRoYWIeKMWP7EjeqAE9TxhT9Mx4QuzmQrF/wuZY3e1XUQ82mW1sWhOBVQ9CBjF1TRFjrt/1MQSp1yAaNya1CLjM/uW9sPxKoTco5iwZABCRRs6BAQQvoC9lHeThhroqKP5vZvQls4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcIsdM/AvEwP7rJWbGG7mvfNQxd0hpjS4GhRkW8lrtM=;
 b=Ee1KW+A0Xh61q3pw32lmR9YNjeuFUb7BRFrSz+c/UAwYQrlwODpteLORVi7sGn+8ba1O/S5zk7poUUoRIGm8WyORr3YnZCo2BUCYY8IfwPhCqUI+LzhNpx+5B9C/pRoHdF0DhdJzPAuBPu7ndFGCxpA5pPoo00jXDLUM/O+rB9c=
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com (2603:1096:604:13e::5)
 by TY2PR01MB3658.jpnprd01.prod.outlook.com (2603:1096:404:d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Thu, 16 Jun
 2022 09:02:23 +0000
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::9517:537:b076:800d]) by OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::9517:537:b076:800d%5]) with mapi id 15.20.5353.013; Thu, 16 Jun 2022
 09:02:23 +0000
From: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: "olof@lixom.net" <olof@lixom.net>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"sumit.garg@linaro.org" <sumit.garg@linaro.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>,
	"daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
	"dianders@chromium.org" <dianders@chromium.org>, "soc@kernel.org"
	<soc@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 0/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Thread-Topic: [PATCH v5 0/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Thread-Index: AQHYbB0dItZUwDIVn0uUDdP+vR74oa1R5koZ
Date: Thu, 16 Jun 2022 09:02:23 +0000
Message-ID:
 <OSZPR01MB7050362B7F7B072AF5304A4DEBAC9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
References: <20220520074119.3574753-1-hasegawa-hitomi@fujitsu.com>
In-Reply-To: <20220520074119.3574753-1-hasegawa-hitomi@fujitsu.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-06-16T09:02:23.165Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
suggested_attachment_session_id: 14421a04-19d9-09df-5662-0577f105eb51
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee1bf605-8e52-4b68-b62f-08da4f76ed7b
x-ms-traffictypediagnostic: TY2PR01MB3658:EE_
x-microsoft-antispam-prvs:
 <TY2PR01MB3658CC0C9AD3E892BE001673EBAC9@TY2PR01MB3658.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1PrJkRL9Pz/GigMRc+GU92XJRnvZigK3r8JY3RmAqsbVnzGfC4UQmBjc3Lzq9xIlg0H/GPljSZyC43Nd9eEJDftVSNBryRDLB6WxcBjPB9tSeTULuEPyf1TlUx2VB7V/tHj4LJBGYuIKt3lM8SsmXKKy9HyBv1XvAgTQBS0QCU4CV9sxM0i9RxTSvkW3euBa/hJQGuHv7ssD4BYIj3D9dWcA1E8jlwyvng7eGskQ0dqOP2OYgd5NZlFoL5Uh1vSwR/G0gBYU6gm5bW+1jbMbCSmmWbVaTZqDezK01UG0E2m9yYD2Yw2xIXmJHRxIp23zYVU/HQ77G7KueatKg72Bfeb2JXJaoxYzznw1ggzwnNW/1TKPL5H69bDHbLZYhk6pRXE3OFxA1bXROftaWzYfk27GLISbv8R9KgA/2sojBIh7Gk3lG/+Yl0C41yRwHEOHAQ+OkXzzwHw5saCVsQIzQqxr870Bj7wzBulhz6evAQNYGjZOFCwAUSOQ9y4OIZ1hOQthRVT2c4QYhJnNHKc5Tz6Vt7xqgCn4y1vTlMLOaP5wGpIkmb1KmPl6F/vvM5lxFmcEhMB6vQAF7PUojPEnfSKIKnsje/vs5YxLEdrqpIUmYwxftIe+BFEed3xCidyIqsSm4qNheLeORtA345/mGYndMQiVklQuo7FDlBsSZeMrzM9t8bbX3ob+eD1s3FAK6KKjU9mS5RqMwCqUVWgBAA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7050.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(91956017)(186003)(66476007)(71200400001)(64756008)(66446008)(66556008)(66946007)(76116006)(8676002)(4326008)(6506007)(7416002)(33656002)(7696005)(5660300002)(558084003)(2906002)(8936002)(86362001)(9686003)(26005)(52536014)(38070700005)(54906003)(122000001)(85182001)(6916009)(82960400001)(316002)(38100700002)(83380400001)(55016003)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?NUFvR1hPK01kcXRPYUI5eWxSVGRHSGhtNEV2NzRtYmpCWDhPYWY2K3Zy?=
 =?iso-2022-jp?B?ZW9rZWlJejRhSnQ4KzY1NTBzMlpkWTIwL3BmOHFVcnRFTGppK1VNR3Uz?=
 =?iso-2022-jp?B?bGRJRWtnV0hvRlgzZkpUWEp6Vk81TEhVOFJRc1k5VzV3ajZKTG5YTWdG?=
 =?iso-2022-jp?B?OG8yN1A1enhIaUp4Z3I1cjBXbFFQQkt1QVIwcm0vWHF5VnlMYTZiTTNO?=
 =?iso-2022-jp?B?WnZ6b2xuTjNLUmlaQ1k3WGpTaHRZR2FxOXZyZ1FROEIrUVpoQkllNDlp?=
 =?iso-2022-jp?B?aTk2M2d4dXAzTmdYZGVVdVlQR3VIZEY1UHdnaVMrZnpNaEdzMCtMb2hR?=
 =?iso-2022-jp?B?WHhWb09iSVJLTmRudUcybmIwSmNTM2JXUFFyZ2dybkMzcXFnSUxrekQ1?=
 =?iso-2022-jp?B?SzNEVjJCemErckRJYjBqZ1RkalNCQXBwQVNIcnlWWk41L1RiOWRoVUp5?=
 =?iso-2022-jp?B?YXVrOVFobThKRlVUZ1F3eTVWNkdDc3QvdW02bzdRb3BxSGhHMjlDL2NT?=
 =?iso-2022-jp?B?VlJYbGV1UVhxVnJtVXJvODM0WWdGaVZMQ2YyTkJkRU9IK29sbWxFT2J0?=
 =?iso-2022-jp?B?a0xzaGVPcTQrY0Zkd3dScWZ1S2xkQktiaDZGNjRpdGlHcUMvTWM3S1lH?=
 =?iso-2022-jp?B?K2ppeDlqT3k2dGZBd2Ixc0h5UGJTK0trTm5oand5Wm9CUG1IcFRBLzFn?=
 =?iso-2022-jp?B?Z1RvVlY3VjJVYkpFT0hDaEp1anJ5bmwxWEFiRXY5djczTW1xTlZLYzJz?=
 =?iso-2022-jp?B?MGVUUWViVXF6NitkaGhtTmtkbjRVcTFkMU0wMmVNL2tyUFg0aWJhUVdV?=
 =?iso-2022-jp?B?cnZzRkplY0V0M0FmSFVMeDlEUDBCc00xRVF6QVQ0MFhaUHpJVDFubEt2?=
 =?iso-2022-jp?B?REU3Mzk1QXFXVGJsQ01HdW9ZcEl2Tkk3S2hjbVFBN21NdVAvQnZUYVBH?=
 =?iso-2022-jp?B?K2xhN0ZCdnJBcjY4ODRmY2RFcTlDTElCb01qOEFjQjJSMXI2a2l3TjBC?=
 =?iso-2022-jp?B?UDVlWUdOcXVWTGtqOEdNNGVnMXcycmo0c2phTFdsK1hDOFA3QkNNQm4v?=
 =?iso-2022-jp?B?b3IxeWRIT29MOEJzZ2MwSGVrRHNCUHFYRGY1dHFDWjJoajV1MkxQS0N2?=
 =?iso-2022-jp?B?NFZZd2N6Z3pkUDlWYUlUMDF1NFJNbUhDTVBzUFZBQ2lpa2ZFQ2YyR2VY?=
 =?iso-2022-jp?B?S1FZcUR6bUF5VEpOZEVjNHAvVnZtL3VMWTRsTE50bXBtZCsrOGtSQmxU?=
 =?iso-2022-jp?B?RzN2U1BHVXJrU3hTdk1jeEExMFJqUkZYU2ozd2lXY2kwZ2xZdUxqZWlh?=
 =?iso-2022-jp?B?MVR4clcxcjVPbW1QR2ZaZE1LOEJleFRTbG5CQ210MXNYV2N1NzVmNFl4?=
 =?iso-2022-jp?B?aFFTaHJIaUx0SENrUVNsZFYyT1NncFlIcHJGNE1vc3VsRXdRbTFHY3BX?=
 =?iso-2022-jp?B?aDVtZHEyN0Ntb2ZxRmI1M0V3cWNiSGhNRU44OFNiZVVhN0ZSUlBSeGtJ?=
 =?iso-2022-jp?B?aUhuOVhVMEJEVDgxNml6U1ZPMThPS2tGZTBjTEt5NlZTUXgyU1AzVzJi?=
 =?iso-2022-jp?B?SjFRYkt3YloxTXg5TUEwV2gwcFUzMVZCWHA0RmZoYXB3R25pajFNUzBN?=
 =?iso-2022-jp?B?S2hIT1c0b3RFNU1BL1lFSUVpZFoyTjd0bDI3Nlg4bjFvRGtWeWN4dGtW?=
 =?iso-2022-jp?B?UUNFWi9hQ0ZrVWdBSmVCNW9rSjdKcFJGek03TVJXMHBKN0lkNk9NdlFw?=
 =?iso-2022-jp?B?alV5Ym5oa3JwaDkzTmZNTEN4NHZVcVltUlFCSFE3SDhaTHI2ZFA4RHB4?=
 =?iso-2022-jp?B?cW1LODVaZ3JkeXEvNzdLeU10T3VvMS9kTUFuMFd5OFZGODJaYWg5SnJx?=
 =?iso-2022-jp?B?R0xlY3ArSUpuMVlqRUVXS3psbGtPRUNPcWVTck54M2ZFS3pTMFhxOU5Z?=
 =?iso-2022-jp?B?OFFMY04zaFl1VFN1STYzQmlGNnAyc0puTitQekVxTHMwZ1EvcFIyaTgv?=
 =?iso-2022-jp?B?Q1AyMnlCdVdSWnN4bDc5TkpwNDlLWFhyZVpaUVhzY0FmdDBFL1ZIdjNl?=
 =?iso-2022-jp?B?MGI4WTAvdVNMVU1FTldJN05oMThYbGtvL2dDc01rTUdhU0tTM0ovV1dM?=
 =?iso-2022-jp?B?d0dEeUFHWDlCSjc1VEFVUWtvWWh1dmk0M2JEa3cvYjBzMWpYWHMrcWhV?=
 =?iso-2022-jp?B?MThteWxUSmJOZWppT1g2U3FnOGhlVFFMQ2RkWlBVcS8yWnVudjg4TG1R?=
 =?iso-2022-jp?B?NnhtZzBGVmtRYWZVTUxHaWh0aDl4ck9jcjQ3TWRGOWd6SWdBNm4zSXZn?=
 =?iso-2022-jp?B?ZFlhcnVhMGR6RjJJenpjc1FRRkVabUxCVDdFT0pMVDR0WU9qM1lldUR4?=
 =?iso-2022-jp?B?Z2FSdTVESzlQaHRhOEY3SWxBZ0dwRnRwRDh1ZFRpcTU5SWI1T1pzQnBO?=
 =?iso-2022-jp?B?VStidmlJVXV6NlVzZDlOM2xiNnphN3ZURGxiTmNTSkczME5oVUtmRXly?=
 =?iso-2022-jp?B?c2hkK1BPNGhBK0VxNFhYYXJGV0VqUmxGWFRVLzBnMzhNaENwT2VSRU40?=
 =?iso-2022-jp?B?S2JYNTJqYz0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7050.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1bf605-8e52-4b68-b62f-08da4f76ed7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 09:02:23.4764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yZZYfj8HAi7xpYwaguEd5rQ67s7vaR3P+2mVfeVBT+yH0Miz2YjQNHsnbRBE6B3AuvLkcaWB2rzFpfg5d2/IjGnRuosa881BI9t/+8JTpaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3658

Hi Arnd,=0A=
=0A=
There seems to be no comment in particular, but what should I do=0A=
in order to be accepted?=
