Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6301BC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 18:19:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F0A864F44
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 18:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F0A864F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BganCBmBczm4acJu1E8XlOuDL/l9uT4S6ue6nytQyik=; b=sNztCJeJOAN29cgnJQxTDGpnB
	Ux1ue2LCcXZMz0ZSldgk5O0ah8XOpcqi1axIOzXq2lW0IFNJXi/DEAoLodziw3bOMFz0Qu4rN7QYl
	uwjBaYdj5D/v+IdNVLVPE/N+l/pQVo2lymHRvKg4tSm8YYBAvL7P+2pTjzLGKf+9w1Hyd0ci8DH/6
	tPaZ+etj+5MvxS0WSKfgjvfk057Slaek/LAq0GjC8lV0tiQyBMC/mYDZwkTLSON0W7/Dln0HFnjXP
	q4kWauVgJw9DXTSuOKJQxT8YqvhPbkZftLBzDlIcSL4ipccoT8RDa4HgUUUja87y5Y6y5PCP4Hb/Y
	wE90t+XAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7jD8-0000CA-4g; Thu, 04 Feb 2021 18:18:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7jD4-0000BS-Th
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 18:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1612462710; x=1643998710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mS6rEgMwGeeKjHBoaN7R/2Q2r4gA+qYjzKdedI7YHq4=;
 b=VdHu5QLhOcXa/I+kP/qEByXgrhZVBbBIkeFwRNtu1pm5lMgEx+kS+t66
 WB43UjtS3un4aXrh49ca6Og+/gFdrPAf93o6AXACP5xNWK+TcomuP9y5k
 vnRT1caICrd3VZkP23k+f+mKYo8DXauGZQCfvvEJgp1WyAd8BV7qoJ87/
 OMHsRVSxt7dBZ0nxVCIK5Y42sjp8ihklU7CCxqSzb3QaIE8fJk5HzpODm
 zesGWFOLh0Jp29114Yjkq69A0zKb0f2MZsf883KhY/VhCzbSFM7XLVyib
 LseBaExSu+Hegp3N4Z+fPDEoAOtW2dLJMQUl5wmxuKgt+fjQqbm11ib24 g==;
IronPort-SDR: T8HHXIcYR3aA2Tgf1jid6I4+sAzawDgoJGp4c9PobZS+TZieIoBHEfOwlZq6hv1PyAIXb2LbcB
 fb99yOdOyNV7xZ2BRdSBE+oqTmfyr3uHTUkFq2kiQV89d5D2O/i5oNUdqSi526jBVXl2ECv6GU
 jJXpm0Gr6jxuUF0I30irvfeGVTYINA6OPsOAA19Tg8rx52wTMWlju2bfJnxSbOVYxnTmCVrVHM
 lB+OMXi45ibvy5Hu0LobDmgvUHecGf6Wr37WiwV9+PKfveTtpSg2Y94PDoS9C7UFoI/v7MEYhR
 xJ4=
X-IronPort-AV: E=Sophos;i="5.81,153,1610434800"; d="scan'208";a="42955131"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Feb 2021 11:18:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 4 Feb 2021 11:18:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 4 Feb 2021 11:18:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAGNQ3I8kVuWKt2qiShGe1E501MEHosotFx5aMdWcN8wNTD7QieOgwyDqs6yQFKh7bpaWfTKzsdF7efWGzVEJbT4UbmZNcLEBpE4xH4EsW+SyZjL//MPo+R9Xt2w4Lj795jQBuhfe2LxKMPtuHMVO6bZcGjA/hVoj23Zdmd5gBtjd+hJ8ZDb/dFt/xgqdxfn2eEUyHQT33cuaKAzJPZgZyXZiaLwPIPR0EYO1c+lVXvEOymMhTM0Y5NLign4nkox5Est/WbSBfu7eWrCw56nKEL2pjzFkVBGRLKFWjG67N59fslQpLbrZ6xE6Ql6mAs3H7JTmU5IkyYo7b1BZ3EFyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mS6rEgMwGeeKjHBoaN7R/2Q2r4gA+qYjzKdedI7YHq4=;
 b=kt2YWJPoiOZiFySaUljLUK9FsZSjk+Ua5DlKkPeDJrQLiNou5U9ddFP/k2JU0CoIjMuSyt2jPT2z8Sf4EaW488PtZSFak8WWrPxZ+U5y4SEMCWKWzNCUNcp4TCrSo3GTKcr1TglfnzSbM8mP+IFEy1H8nWMskIUeWZohm5kg7JvRBktV9bBBJ06l8753p4U3eLd5vNbU+c4vxbnmPe2/+cBMJ0q06zrB8ysWDONvIM7jHPdAHH+jjI3FZbA5vKUzIY6ImetpWO9vy6VewdpnHzvVQ3okjpzPu3IGEjPzktUc1hKyDHPBiPPlRMi8yOsEt+PuHfz32HNXeAwGEZH0XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mS6rEgMwGeeKjHBoaN7R/2Q2r4gA+qYjzKdedI7YHq4=;
 b=cWc10JdmgPExRjpAXgp2s3JFVi1P85VwGywlPufMe+0wB1XVzZMec21kkzCqiV8PCSuh6PtxAJYZykwyAGDf9PLHz5CxV36AFGC6eYU+PYvIbI84FroruOYfUw1HxROFmBhYmueoZyxuwcx8/gLNI1yrWCa6CQ7ihUbYTIJSLmc=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM5PR11MB1993.namprd11.prod.outlook.com (2603:10b6:3:12::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.23; Thu, 4 Feb 2021 18:18:14 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::b96e:6776:6971:80f4]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::b96e:6776:6971:80f4%5]) with mapi id 15.20.3805.027; Thu, 4 Feb 2021
 18:18:14 +0000
From: <Claudiu.Beznea@microchip.com>
To: <arnd@kernel.org>, <linux@armlinux.org.uk>, <Nicolas.Ferre@microchip.com>, 
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <nathan@kernel.org>, <ndesaulniers@google.com>
Subject: Re: [PATCH] ARM: at91: use proper asm syntax in pm_suspend
Thread-Topic: [PATCH] ARM: at91: use proper asm syntax in pm_suspend
Thread-Index: AQHW+w8qQUwoH91XlEGs7R8gkYKHo6pIThMA
Date: Thu, 4 Feb 2021 18:18:14 +0000
Message-ID: <c7e601ab-03c0-7b20-9678-3f9f4615836d@microchip.com>
References: <20210204160129.2249394-1-arnd@kernel.org>
In-Reply-To: <20210204160129.2249394-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [213.233.108.88]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80926142-59a2-43f4-15d3-08d8c9393d01
x-ms-traffictypediagnostic: DM5PR11MB1993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB199344A0959F1ADF0D46910687B39@DM5PR11MB1993.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ++vkoc2lnFJ7WKplb4iC6fZ/D6YnTPJUN91fALo0A8fvNVq0CMbvOj7KkFqvOE/eu13Eb323ClVzDI1S1cw50wLmQeyAU6lu4IEYjGZGPSXhK0hR/a4VwzgvdBrz4lZiu8I3tjlhLMwXF0Nwb9ncwwOvYogSRQGbt1eS7czf4aU2JzbWFoctaOrWDmg4k4vh8BmjqC1dyD26m7M55iIZx0qYau2XDnItxfm37iCfe7/BHSNQ2cXHtT54HKCna6gqXLU4WrrVyjWKnhXPzEweBdFzNK5VXTgoUSRn62reFvsoe97DKz8zYNns44/mOGky9cNkez8FvPt9oZzQZWDH46Skqoibv2TOUZz6jUHg+pLt75HObH2p0aBXtX6hWnmuuEknwrNl8KpFwD1418toRcSaLMBxh4ZufEvnkkeZAn8VROoh592KuNitsjiquaBfv19UaLl4asVO7+2ObGmX83SmIShU6R5G9joNF+oxh1xVwULu6b1cjRJTS3XJR0Qj2/Ca+wsfsP/HopEKc6wOF/0+AXIQAAEcMOVO186zz72ZY1T+s5xXsdaTeb+p63GrlmokWC52VEa0BCw6foNZiM4MHq4yUAsGINVRerXf/PE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3420.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(136003)(396003)(366004)(376002)(31686004)(53546011)(26005)(4326008)(6506007)(186003)(31696002)(71200400001)(86362001)(2906002)(6512007)(8936002)(2616005)(83380400001)(5660300002)(36756003)(54906003)(66476007)(76116006)(66556008)(6486002)(64756008)(110136005)(91956017)(316002)(66446008)(7416002)(478600001)(8676002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?R1F1R0JqaGlacEh5Z2poV0hKWjFGUGV4Q043bEdRVGNNaS9ndSsxR1FCN0pP?=
 =?utf-8?B?YVpBeWppNjYrTWo2YW9EVWlvQU9GM1luT0hDMlFEWE1uVXVBSUhXMDU1cjdN?=
 =?utf-8?B?Q3d3bTNwdHdnKy9mNndzV0RvaVp4b1Awc2dJZVk3RGJTbEY1NXRzd3B2MjIv?=
 =?utf-8?B?LytDOTZ5VDlrcnR3UEduUVZRQlVkZm42a3JlNXBDSjUxdHFiUkRzYnBDeWFN?=
 =?utf-8?B?bzNoQUswaTlndXNQU1NxeDFDZEJkZ2o3S2VkeExuZXNmQ3pyclg5VUp3VERB?=
 =?utf-8?B?T3A1MWJZaG12Wm1wTEJ2eWoweTlHL1hVM0Z6TEZpd3VKV1JaNjFGQUZ2d2R5?=
 =?utf-8?B?TGlENmNwT3pzUHBUMmtFOVB0bUhLUCtkdDNIcitzL0htVzZKVWNzOEhmYTFj?=
 =?utf-8?B?UnNXZWdGUFpnUWI2VlJoTkhoMjJVcWNaQ0hQaUVOVkVyMHNHOVlaTnlQQVNh?=
 =?utf-8?B?d0JkcGdiK0V0U2VJSENka2ZoQzM0eXNObFM2ODk1dGNxcS8wQXVVT1g5eitC?=
 =?utf-8?B?dnlaei9aNk9TWm54VlBsWlh0TjZoM04yUlo3U1pCSGRGUFJvdFJjdEJ1dkpR?=
 =?utf-8?B?a3Rjbi9oaEZMTWtCRjZYNkdpNnQyT0hVWG1mT29NcVVuTTAyU0s1NGJiRGtM?=
 =?utf-8?B?NkdNcHFGbWJlZERkaUFiMVk2NjMwVzBSUzhCQ1hZUmg5azZsenNCQUgzYTBh?=
 =?utf-8?B?WEd5N2FibXRJRnZTZmNGS0pxOGZhNFBDTS92UUErZGZUQUJmRldhYm55VEQw?=
 =?utf-8?B?OC9OVWZzRWNnZEhwWVM0SlpuZmpVaHdJMzNLTWJBbUxOWVF6MWVoYTJ5dUFG?=
 =?utf-8?B?SDlzTVE3VFJPOEdHWVRQbUovaXpQS2VhWTdud2VGeElqamVPQlRxRXAxOVR5?=
 =?utf-8?B?OG5YUlc2SlExM3FadjlzNUIrZEdoV2VyV0MyQWNSZWovUHVNeXRtYmJpbERq?=
 =?utf-8?B?MmhGZkNGc1VZZFBrblZpZ1VpcDFTSUo5NlNJZXRaYThqeDcremVmdG9VVmR0?=
 =?utf-8?B?NEtyekJENEdoSEJ3eHE1TVgzWTJZNWJJRXhXS2dIbzhIZ2hJYm1sTWgvbCtp?=
 =?utf-8?B?blNuNDZ0aVRNcm44ZWxaTHh2RkNNdlVNRmNRTndHOERkMjNRdkpaZVduT2F3?=
 =?utf-8?B?aEpMYS9CeFNYMzBDQ1JaZEhGVDhOSm90YjRVUnBzZjlDOE52a052R0NyVWd5?=
 =?utf-8?B?RFZ3WDFub0ZuYXBSNzVldGUyZTZONFcrN0VPbTNnWS9NWmFJSFRGWDUrR0pu?=
 =?utf-8?B?MVpsUHJTRVAxTWFmSkprSGpJRnI3NUppUS9oMzBodkUzOW81RFRGcTV1VU83?=
 =?utf-8?B?TklNMlpWNEZVL28xeFFzY25VRnR3UVNNY2hUc1JQN0hOaGhKSVROcWpuUEsv?=
 =?utf-8?B?azJ5S01XYm5rVWJTRWM2V2dZNHhjckdyY2d2Q0svWlBrdEx5UXRSMit5Z3My?=
 =?utf-8?B?RzRxY2Y4YkhDTWZZSUN1T2lweEJNQlBMeVhVZ1RpQk9RNHdRd25uSHVKdmRP?=
 =?utf-8?B?TzI2NzE5ZVIvZDZjODdmM3RSZkFuUGJDcXo3SUpiV29UTWZ6L3RVaHkzWDdH?=
 =?utf-8?B?OGlocjVBZFc3R0ZEYURiZFlTZjFzempLRFNDTkN3dHh4QWFwMGxxTE44Wm5o?=
 =?utf-8?B?MlZ3d2FQRjJjZk4vMU02S2Y0VS94L1FSTlJnVnJpWmZRNHhFeFFSWjJOSFRU?=
 =?utf-8?B?WCtKVXpBUVAwMXFxQU54c0JhaVJJbi95RTZnUktQT1I5SStZY05qa0RHMmlU?=
 =?utf-8?B?VkUraG1abGUrdGJlMnpYM3RjQXpjWk9BWG9MUVd1R2NoUSs1UGt2amRNMzJz?=
 =?utf-8?B?eThONUZZa1ZaejNjamZudz09?=
Content-ID: <AD43F4833FCC8245888A679CE06E24CF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80926142-59a2-43f4-15d3-08d8c9393d01
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 18:18:14.5675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fi2vYrG0ksxu59gxdj07bYhsuceSjkofLfOUUtl3EgVnGRaPCtO9P02yWbJ8YJJ+abTOGMBYJSq/sT1gH4W6pT5yTvATJn4Z1H3tt4sSyxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1993
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_131831_220482_D64E49FC 
X-CRM114-Status: GOOD (  19.40  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204181814.R9Kni7FmQ68fLT-3kwMpCG61PVp3Z1mTpw9E2Gi8DwQ@z>



On 04.02.2021 18:01, Arnd Bergmann wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compiling with the clang integrated assembler warns about
> a recently added instruction:
> 
> <instantiation>:14:13: error: unknown token in expression
>  ldr tmp1, =#0x00020010UL
> arch/arm/mach-at91/pm_suspend.S:542:2: note: while in macro instantiation
>  at91_plla_enable
> 
> Remove the extra '#' character that is not used for the 'ldr'
> instruction when doing an indirect load of a constant.
> 
> Fixes: 4fd36e458392 ("ARM: at91: pm: add plla disable/enable support for sam9x60")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Tested-by: Claudiu Beznea <claudiu.beznea@microchip.com>

> ---
>  arch/arm/mach-at91/pm_suspend.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
> index 909856c8a8c6..0d467cc40129 100644
> --- a/arch/arm/mach-at91/pm_suspend.S
> +++ b/arch/arm/mach-at91/pm_suspend.S
> @@ -446,7 +446,7 @@ ENDPROC(at91_backup_mode)
>         str     tmp1, [pmc, #AT91_PMC_PLL_UPDT]
> 
>         /* step 2. */
> -       ldr     tmp1, =#AT91_PMC_PLL_ACR_DEFAULT_PLLA
> +       ldr     tmp1, =AT91_PMC_PLL_ACR_DEFAULT_PLLA
>         str     tmp1, [pmc, #AT91_PMC_PLL_ACR]
> 
>         /* step 3. */
> --
> 2.29.2
> 
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
