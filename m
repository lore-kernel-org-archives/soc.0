Return-Path: <SRS0=DHcj=WQ=fujitsu.com=hasegawa-hitomi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37ADC43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 07:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BBBFAC34114; Thu,  9 Jun 2022 07:49:30 +0000 (UTC)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com [216.71.158.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A81BCC3411E;
	Thu,  9 Jun 2022 07:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A81BCC3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=fujitsu.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1654760969; x=1686296969;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VubtE6YTtI2qHHupDh82NSHEsUXiwp7XwVfKeuDAV+g=;
  b=YPfV0oB+G6TzPcPgP9f69YlouyNU2cj62XI8jHm5ahtqo6booHBCmVq4
   UBLpwxdWhVdwWB+QHi1P291TZMo6K0OOp4ftxTtNzbpqDzka16CF+aNod
   Xd9RAIDhG1hDs/BlLlfCpjf5Arp8s01UxE5/ZkICw2o8ItT6aoCEXkl8p
   WMyUboclsuV8ioPTFU5hrzn4nkz8XOSMPtPCJXv8iDAtyGzaXQ61K/qho
   XyC9tCxkgYS1hdf/StwL492xEIfhblxWO/9fTwKpYp/YfDDRgBIxAfIVr
   S8cqAJfvorv+vFCpLuBWwRHuzbGQB4lwaq8CBgeaJYYUTHXIKfY1E6+vv
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="57655064"
X-IronPort-AV: E=Sophos;i="5.91,287,1647270000"; 
   d="scan'208";a="57655064"
Received: from mail-os0jpn01lp2106.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.106])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 16:48:15 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBZN8I9jO54SMA1tMcRh3Pg80USAL3zt5wwZrd/UCw5f+arZjfB7QKyPvu+4P7tPxRDq3RpWaJrfvJbUlAWw0ckmoNBNNi8U3jz6effkqij6elWgNBkt6h5smycWuK7nY/ndzsrJG7oyOMASuLSEG7NoQ1KQ/O/aSr0qyes0WnFm8FVqFks9nFzmrmrhLPMTl/OFDQSbg0CtBxUfHi42vWNu1lYzxhQ/jylE0mTjxjhjwBcziPBDZe6lVHPNURopcIqxFtZWTHP282A2a0GUrNKKERrGd5Fnmzn39CZ8jQ+G5zfbuDy/dGm9qtXSTjpitIsccQQh5tq40Sr8wuhpzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgT4CqzzARnwwxGiIVd4EPxjJs7V58inAhMuIVJkVVk=;
 b=j8LVhk0JjItOTCxpNbBmeqh2UXfi9BvsSu8p5l3CsCNi54d5UW+3LdRqPbMplSerw2RU5i8F0Ixn9DLrC+/8YDyk3/A6w8qq0Tf+niEpmRhFF0ldFDnTz3zwkhzIIIBsfdFOWhoYxZzDY5swluZYlj8fF464mMe9ChU3md+34F+SdSEfL8yfbKesnEYV9y6qKeAqSlsDalg8PXMM1AzAOQ8kSJa2MVh74fDkhzudlULlgDfk5nisVzAvOHiBt04vb2tXFMUOPqbXWrENShAJHqCI0OPD/hgpAKIuP6/ueKIx0m4/ALK8kTkMOiUrNCn4GmWT7ckPmtS2xh81SBR7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgT4CqzzARnwwxGiIVd4EPxjJs7V58inAhMuIVJkVVk=;
 b=O1LE31amaDjvcrXrXqF1hQZYIzbiDxm9Q+z72Pk4F+q/aSaxFe5EzkJ/nBEi1iRFAGK5gVVhTfbP/iAR+NcdqpUzfrox+YHJdTgYH8EWknXoFv0lWZoxro5qo1pY82YZWfgjIjRpx5i7mh7avmB+0n4pLqUSd5cW/Tw9Sv8aMXo=
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com (2603:1096:604:13e::5)
 by TYWPR01MB8637.jpnprd01.prod.outlook.com (2603:1096:400:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 07:48:11 +0000
Received: from OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::9d45:c509:9a59:4892]) by OSZPR01MB7050.jpnprd01.prod.outlook.com
 ([fe80::9d45:c509:9a59:4892%9]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 07:48:11 +0000
From: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "soc@kernel.org" <soc@kernel.org>
CC: "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "sumit.garg@linaro.org" <sumit.garg@linaro.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"jirislaby@kernel.org" <jirislaby@kernel.org>, "daniel.thompson@linaro.org"
	<daniel.thompson@linaro.org>, "dianders@chromium.org" <dianders@chromium.org>
Subject: Re: [PATCH v5 0/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Thread-Topic: [PATCH v5 0/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Thread-Index: AQHYbB0dItZUwDIVn0uUDdP+vR74oa1Gz/i1
Date: Thu, 9 Jun 2022 07:48:11 +0000
Message-ID:
 <OSZPR01MB7050A4DC1D432E4575B040F9EBA79@OSZPR01MB7050.jpnprd01.prod.outlook.com>
References: <20220520074119.3574753-1-hasegawa-hitomi@fujitsu.com>
In-Reply-To: <20220520074119.3574753-1-hasegawa-hitomi@fujitsu.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-06-09T07:48:10.563Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
suggested_attachment_session_id: 08bc62a3-e618-a736-acc1-07059c939c3f
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acaeea9e-98ad-451c-4204-08da49ec66d6
x-ms-traffictypediagnostic: TYWPR01MB8637:EE_
x-microsoft-antispam-prvs:
 <TYWPR01MB8637F0805724867B368E9650EBA79@TYWPR01MB8637.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LFb5PEEJPQdMP+kl65eFjc1WHgJ/E2T+LwMq6EakZt2wfUi8i+voIIXm2ZmJaSaXsczRXGQ36Bxc9MXyWQahapEnqJ1aru+CKngXrKhpcYdY1xinOIFQ8c9NhR4AVlQGNm1NLy3IxtkMLFCEhx7WXxDdg6spuOUWhhfZR8ZHuOVaGslj1u/nJuRt7ivr0Jl7pwSP38oQVM7GMdcGrYJkRbfSqVDJsBh3lLQUmxbEi+MLsq4wSFJ9ONO8oLJrb8+M4HoCAOa4CRji7uhcOiabVQBo0EXL3HfjupupgPz7tfDHSeyayt2mylyCd/5Jh+UmKMTVAXI7g0s3Sdrwr0eYKKFUJbLanSsNBiIiqvP4ZHaFtpldzbT9QuUOM7Eg3B89F08CbIAhj3R0aNyHRdfba5cSxTJHuiOYu2+opiySVgTOwPi1vIpUVfu8Jiz/FZN5KWEZ43wDrfG6AemVU3HYucD8GcY0zx6HeMKHJR5uZVxEUGf0r/Ol6ksCyk/c1U+T8pZvx18J+X+Sic8PRSoyWCxebH66J5ykRvVzddOBvBpuPVSgjGhvxxOfmLUEtHe0uFQu+B6aCe4n5tzZML2chiQsp84wRwcgxJFuckf0r/yc/S1YZoGeWdI/EQEBmKWAPaCO+FHovkyAMtHciF0yRqFuq7x1/ehuIciY5aYgj9xxgolTVqcSR7teN+whzgqkv4TqEWA48DKBe47XcTmU3lyKT7aJPQPWwCk2gsmdfa/3HSuop7eXOKELIkhUUAqeCCU0Yk7DcP/OWYRcoM9wUPJE2Oxm8ZvpzP36P54sJO5cTF3C/8uv6Lf3Y/lfu7WVnX8qLunBi635SlLtxogoug==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7050.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(122000001)(52536014)(4326008)(66946007)(66556008)(8676002)(64756008)(33656002)(66476007)(66446008)(2906002)(76116006)(8936002)(966005)(82960400001)(5660300002)(508600001)(38070700005)(71200400001)(7416002)(83380400001)(55016003)(110136005)(38100700002)(26005)(9686003)(316002)(54906003)(85182001)(7696005)(6506007)(86362001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?bm4vRzdDVkxaWGxEQXkvZWdCdi9sbnRqcU1zNWZwald4ME9icjVWNm1i?=
 =?iso-2022-jp?B?QzF6RkUvbkZ4YlNqZ3FKSDdEYU56RW5PdnR0SXJkRmdqdnhYMEh0R3Rn?=
 =?iso-2022-jp?B?cDl5TU9oWlZRd1RET2tIeGxRaTJ4Wld1cHN6cjQrcVVJY2kvL2V2anFp?=
 =?iso-2022-jp?B?SkNhK3RIalk1VCtDS1pIVlpmNlRGclJ4eUk2eG0vSnllNHRReVlRcVpj?=
 =?iso-2022-jp?B?anVKSWlwOERTWi85ZG82VVI5eEppTXZVVWV2TmdQWkpDOHk3cTJvaFJ3?=
 =?iso-2022-jp?B?d3lvbk5nNFZDOWNCSjNjSjg2Z0hadlAvVUR6d3Q5ci9TT21ZT2J2RjJS?=
 =?iso-2022-jp?B?VVNiK3JSWVgzTUxTM2J6UHdWTWdHY2xGd3d0eTNYNkJvYmhKdWxJeTZZ?=
 =?iso-2022-jp?B?MVVzVzlBNFlBcnRDbjArc09DaWhWUVFubWd0OFNuR0ljeWt3ZzljdEhK?=
 =?iso-2022-jp?B?MnM2VWlYUUlGM2p1enFzMUo4SDdQOHhtczNoaFIzWnZtemx0V2RyVlZL?=
 =?iso-2022-jp?B?ZGw4QjB1OEtGK2t0Z2psVU5lVi81VGxuZGo5ajVwbGpUZFF1NmRGSEIx?=
 =?iso-2022-jp?B?UjhNbk9IY3haUWN3bkZGb09RNWxId1JaTEZjeCtJbEptakJ0RnJJZUxX?=
 =?iso-2022-jp?B?WXNOS0U1OUJkakhIUWN2Q2tMeUZ6NG9NTFdBK3Z1VnpuaDJVRzdmM3A0?=
 =?iso-2022-jp?B?WW1mNlF2VHdNMXhsTmgreG9OUXhnWmZCM09sNEdhemlkdTl1MjJ3dndH?=
 =?iso-2022-jp?B?R1pZN2pnSlA2eCtxd0VGenJUQlBLNXpOYXo1VmNWLzRMaGRzTk9nTU5P?=
 =?iso-2022-jp?B?OXlvcDdHMWUvT01MOG9Yem5xTjZ0THQ3Z0xOZmpEazlmSzVTOXpjVjgx?=
 =?iso-2022-jp?B?bnVLMHdONGxuQW0ybnlYRExnWlpmdmNmK2xHdXlwTmNFNzdRZ1piQldK?=
 =?iso-2022-jp?B?K3FrZkF5QnhlMmE3OGxrc25NejVnYXArdzdLRmpMS1ZRQUI1ZkZqMXE5?=
 =?iso-2022-jp?B?WlJpdHVheExoRS9UZWpsWkd2dEFPa0ZQUmFmdGdBRlV6ajZDQXZacFlh?=
 =?iso-2022-jp?B?NzVsL0thMTh0ak95UjI0RXVmZUc3WFp0WCsyMUE0bGJ4d3IwOWRWclIx?=
 =?iso-2022-jp?B?MEYxYVJGT2J3SzRsRU1hTmNiQ1BsdytVSy9VcGNZZVJjaXJvK0doRjdr?=
 =?iso-2022-jp?B?eER0MmVPKzliQVVoWlhtN1Q2YjFJQWZVb3kzU21JTU85ZWtzaWtrR2d3?=
 =?iso-2022-jp?B?UVlSc2J5Qm9QWkRQQXc3d0hvclc0aXBtQkxoeDFyenE0OWZrRzFCWUlX?=
 =?iso-2022-jp?B?SXhaMDg0SGJpclZRdkxuYndlaXlnOTdXTEJiRjlMZytQQ3F6UFF1cTR3?=
 =?iso-2022-jp?B?MVFtL21ET1VvMENySC9ZZFBOVVQzcUtydER1Smh6UTNVNnZ6elMvLzBx?=
 =?iso-2022-jp?B?VmxNOXRxVEJoSy9wOWQycDZycWZ2QzRvNllacjF3WkFIeWN3V0ZoeTJh?=
 =?iso-2022-jp?B?NUtDRjkrWXpDNk83ekhUaVZGQWRrSzdmRlpsMFJXTTVnQUhrbXVISUpM?=
 =?iso-2022-jp?B?UVFybFhtUTJnUkJ5TVJ3SzdTNjF2L3p6YWFqZk9CYytQeVU2c3NEZWtX?=
 =?iso-2022-jp?B?VGUrR1RNbnhwRCtGbVRyaHlGaUNBSERRSEs5WXNONkcwcnpNbW1odzhN?=
 =?iso-2022-jp?B?UDZEQmc5MklRRmVFQndGSXVKRGxjV0h3NDhyOGpQYm5VZ3hON1V1K21P?=
 =?iso-2022-jp?B?czNxbTF0d2dkMkU1aktoVkpCNjJLaVJZQ1pqMzdWclRlTDB3ZUJlZEZn?=
 =?iso-2022-jp?B?V0lSandJdUt5Nk83NDFuR3UzOFFnS0NzaHVWNEhEMG5jTWd4SDhxNG00?=
 =?iso-2022-jp?B?N01ZZ1lEL1oxb2hSZ0lvVWZ3MTRGcFc3anRPUHRIZXFSWWc3V1hJaE1m?=
 =?iso-2022-jp?B?ZXpHZTJiRXdKTWJac0plNkdBU2hkcTJMbTM2WGVnbVJIUFdQYWFUbkRI?=
 =?iso-2022-jp?B?VnF6NjJDSFh3ZkdzZ3p1NlhYbVVHSUxKV2dsYVVPbUYyWEFDMStWOEFG?=
 =?iso-2022-jp?B?V2ZtMmRSN2JGTldHOXpqZDJpeGplM0RXbjZocER6UTZGZjhaU2syNy9Y?=
 =?iso-2022-jp?B?emlZYVBSYVJOUWRFc20rT2hJS0pQKzc3a0ZIS1VOSzJ2enppWXo5Mlpy?=
 =?iso-2022-jp?B?ZVpUSHZoM0NKVEhaRlJrVTlMU0pMZVpFRCtVOG5QblpNS2dFcUloWEMv?=
 =?iso-2022-jp?B?YjE2MWUzUk9EcFZqREZDY0dJcVo4Z29XUms5MmZGYUNZeHR0V2FVVVFn?=
 =?iso-2022-jp?B?bEFEdjVKbVR1bExycEZ3dEV2WmNUUGw3ZVkzT3NheWx5V29Tb0E5a3kz?=
 =?iso-2022-jp?B?R1VtS1VuY2RxbURVM0ZNNjNlR05zMnNrMFl6SXUrOFlMVi9MQ1hZYytt?=
 =?iso-2022-jp?B?NkptaEszdkhRRzlDUG1LNzdlYkJ5QkxnY1F1ZFBUM2NoR3o0SFhNNTcw?=
 =?iso-2022-jp?B?eHlvUytpV0o0aG5wMFdHaGh1Njc0Z3NYUHJvZ055WlR3ZWVVYmI3Vm5j?=
 =?iso-2022-jp?B?LzJscVVuUT0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7050.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acaeea9e-98ad-451c-4204-08da49ec66d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 07:48:11.2461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Xr9CZAaTGoJQ/y7dmEEUyp4JRMwyUwmBjWOH2m8htlK991iEZoykMN2d7vVjXLCOAoxnd96b1O5FBvNXZnWKSkizjOTFZq6YglKau+GbLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8637

Hi=0A=
=0A=
Do you have any comment?=0A=
=0A=
> The interrupt is set using pseudo-NMI if it is available. Arm has a diagn=
ostic=0A=
> interrupt feature called "Arm Generic Diagnostic Dump and Reset device", =
but the=0A=
> A64FX does not support this feature and instead has its own device defini=
tion.=0A=
> =0A=
> I tested on FX700:=0A=
> $ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT=0A=
> [   86.259226] lkdtm: Performing direct entry HARDLOCKUP=0A=
> :=0A=
> :=0A=
> =0A=
> Send the "chassis power diag" command from the management server using=0A=
> ipmitool, the following message is shown:=0A=
> [  138.433544] Kernel panic - not syncing: a64fx_diag: interrupt received=
=0A=
> :=0A=
> :=0A=
> =0A=
> Changes in V5:=0A=
>  - Fixing issues raised by Jiri and Greg.=0A=
> =0A=
> Changes in V4:=0A=
>  - Call the panic function instead of sysrq. Prepare a handler=0A=
>    for each NMI/IRQ and call nmi_panic()/panic() respectively (as in v1).=
=0A=
>  - Fixing other issues raised by Greg.=0A=
> =0A=
> Changes in V3:=0A=
>  - Exclude Sumit's patch.=0A=
>  - Retest in v5.17.=0A=
> =0A=
> Changes in V2:=0A=
>  - Include Sumit's patch.=0A=
>  - The handler calls handle_sysrq() to use the sysrq feature to cause=0A=
>    a panic.=0A=
>  - request_nmi() and request_irq() now use the same handler, and=0A=
>    the function name of the handler has also changed.=0A=
>  - Use readl()/writel() instead of readl_relaxed()/writel_relaxed().=0A=
> =0A=
> V4:=0A=
> https://lore.kernel.org/linux-arm-kernel/20220511062113.2645747-1-hasegaw=
=0A=
> a-hitomi@fujitsu.com/=0A=
> V3:=0A=
> https://lore.kernel.org/linux-arm-kernel/20220331092235.3000787-1-hasegaw=
=0A=
> a-hitomi@fujitsu.com/=0A=
> V2:=0A=
> https://lore.kernel.org/linux-arm-kernel/20220304064324.331217-3-hasegawa=
=0A=
> -hitomi@fujitsu.com/=0A=
> V1:=0A=
> https://lore.kernel.org/linux-arm-kernel/20220218092010.1327309-1-hasegaw=
=0A=
> a-hitomi@fujitsu.com/=0A=
> =0A=
> =0A=
> Hitomi Hasegawa (1):=0A=
>   soc: fujitsu: Add A64FX diagnostic interrupt driver=0A=
> =0A=
>  MAINTAINERS                      |   5 +=0A=
>  drivers/soc/Kconfig              |   1 +=0A=
>  drivers/soc/Makefile             |   1 +=0A=
>  drivers/soc/fujitsu/Kconfig      |  16 ++++=0A=
>  drivers/soc/fujitsu/Makefile     |   3 +=0A=
>  drivers/soc/fujitsu/a64fx-diag.c | 154=0A=
> +++++++++++++++++++++++++++++++=0A=
>  6 files changed, 180 insertions(+)=0A=
>  create mode 100644 drivers/soc/fujitsu/Kconfig  create mode 100644=0A=
> drivers/soc/fujitsu/Makefile  create mode 100644=0A=
> drivers/soc/fujitsu/a64fx-diag.c=0A=
> =0A=
> --=0A=
> 2.27.0=
