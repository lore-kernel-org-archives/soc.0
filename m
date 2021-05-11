Return-Path: <SRS0=CwTY=KG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808BBC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 May 2021 15:19:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6C63613DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 May 2021 15:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6C63613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MR6n8/sWGIsnDLSCaV4Jd1S4phU20WDZe+0EURYrlN4=; b=RD5wlKYAklnaoytLf78YRbjap
	79IkvWg8oHQ8+6g/yfEaieiaOZMgyHyW/MAWQVHAPtu+K72N90SCJTubkz6AmoELv0Krcb3r1YxHT
	SYNAmu+tVIVlrlBsdmja1ve/z8iOBtQ4QRwtCeZYdXCKbk6SIXyjp/9LZwF7G+o+xL2D1okPbw4fG
	IPMifal78jlMG5RLKR9/EeuxamYumnCPsOisbxHo0O8TO8dfUJj65wRJaOQUvSCa87jbw2X6caUv0
	6hX1Oe0OHiZ9NJuEfpF6A1aMJR9l47VWcr45oJRM7jVBLXsjPfrzbWN72fisZehX46lphtOUCYTNd
	nd2uYt2FQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgU90-000a0W-Hu; Tue, 11 May 2021 15:17:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgU8x-000a0K-60
 for linux-arm-kernel@desiato.infradead.org; Tue, 11 May 2021 15:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=x6pBh7dZr5mqi1oeEMiNKRy3kppJz0eAW+L+MRWrJYo=; b=HnZT4i0oQV1Of20dO6CgZiCZfj
 0Sq4h3dVkMNZiFbqaGDQx8sZTT8AGyzsIB8vQUDZk6ZmLfVihPBBaO7egqvfzOnH+FkUlEl8LL09U
 VUylAEv1zH9zjzhAWHCkuC6DxiTmBXLY6cXLZczmSA2aGc2jRyKRRZsgBu+8GJg3lSc2zm5NlYMPS
 EUgHvLJa+FQaXSaNqSaykcAAEf86c1LiIExnO3VKqoxt2EWu8ZbIttyX1LaA9JCSeHsGp+m4wQrG7
 Q5JD2Vqa224Ll19lHVxXTNKHUcfwzLhY+i7rGd63y93TJeNCbBRe5OEvmtGsRcvFXzaeMmkPFFTSP
 4WHiIf3A==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgU8u-009i8b-Fk
 for linux-arm-kernel@lists.infradead.org; Tue, 11 May 2021 15:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1620746273; x=1652282273;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=x6pBh7dZr5mqi1oeEMiNKRy3kppJz0eAW+L+MRWrJYo=;
 b=Ux7Rae1QBcGVeC6yEFsbALoqqljODowhPYPJaHyNykfhqMzXOSNl/LPi
 JCxue+VjqPpOvcyZsVYHbr2+W7ZiFiNjSLrE51NzZGmHSuFEMIqIzRZhj
 5IK34rlog6Y1a3mZL3bKGpWTIOx+MeY0Yq40uuBx1VaE9kQkYa9eENNVX
 GiDPUBVJdVk19wpRpQOn+m+E/jS9BlBeQEot5fhH9ddKP/1HPfMixHi9j
 jICz/bO/UJptI7LgO42V3HKoP8M3A+iP1F0n+ignL/nOv8GYnHs8N9pvh
 ootykOyCS7D6RLash7IEB/3dS6hT2gHTADsXLRq01HC5OYYGW6KPduJP6 w==;
IronPort-SDR: ISiBKsk8fV2it29FYXbbE/Ge250a5XOz2OXvqCaP7/FDrsYteGySWDR+1zY4apUymcxBxh4gWG
 J+53075M6Gz7BHwNHEPsu1ejlMPRuwrWzBGX41QgZ4kHJmnOutXW4OJRlyi6iVhjFOEQm+02Z6
 Q+b0w7k34pJO8lhNy2Q+7ZrczPpHF+iSDmdrKDfIIuBOqw0Ke6Wt33kwF6e6YhlZphgBDv/XMO
 6vC5pWAWBf88PkYdXPwdSPUDoHF25/ZgqdJqg3lJ6Sczdk1ALnHdiRtI6LylGRw5qj07+kTSCN
 Uig=
X-IronPort-AV: E=Sophos;i="5.82,291,1613458800"; d="scan'208";a="120680397"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 May 2021 08:17:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 08:17:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Tue, 11 May 2021 08:17:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fm+QL9/8WqVJUJiylv9FG8n+OG9oqkpq1BLmGok2Od5xR0jUhjAJj4Aotj+8mZp3wkNJDNvelIEe3RWDVHE4QDzdm6niDB9I+PPU1AXQ3fUxsPd6ygjPiPYzRM/05Pk4sidZTRaAXuREqGLN7+hLPT2MVXQwu+gPwWT00VdJGHslvezUDs5bwqGJBPW7FYK/woO8JStcQ5NgA1uaeDzunx/eGIQiLY5u/Gt1MGYsgAX2WVPWPMdArydO68OMY3n14IoPvQagPXKE/KMS5pPkmNbO9UGHLIis5ujGpNdrW8Tt36Z0V2+ynWTJDc/a6j4+86bfeM9+Pmk17FQg5gOWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6pBh7dZr5mqi1oeEMiNKRy3kppJz0eAW+L+MRWrJYo=;
 b=bK+ApY8x67G9LPVUOzdswOqiWwYAH9WqCalcaA9bNshZlMjyEl4D6Axqa54iIMBMI7/jPMJyZSfD2yX931uIFBeix8HtBJv2uxc3n+u6yQDc/8dgLFZqGsRuz+xP9Z2CBfeOO1unES+yOO7PyXVIuCi3Sl8yuIc0sGEKwSdKK5TUbswwcczS3IU8zjcPN9LK3aCat3GWT6t2eGd5w2PQ8f6Pb0GmqevAzp7OHs/inl1Xwv4pSYzz92bl0YUInwhIYCex3phakKkl1jHgPL3Q+NfyEjxrwl6PpTngmuZP9f871ISJPDoCacfAJRf1Smd1k8TFd14FxQpMvY1Vq+6YaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6pBh7dZr5mqi1oeEMiNKRy3kppJz0eAW+L+MRWrJYo=;
 b=j75U18RvTOpCvTnLie+tqTgHksB6MJewW7IbTRFGegUgYOc4EMpxDaz1re7ycCvseipJAy5k35NiAwMESC/ezPJw8F9sD/NtgeNGg7opvc11WNKJvgnjyZZj2M6bSFKfICZqtushIemZv/Q35bFYdIMTQWRrlcRgx/ZRM9E1G9g=
Received: from BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Tue, 11 May
 2021 15:17:39 +0000
Received: from BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0]) by BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0%4]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 15:17:39 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <Eugen.Hristev@microchip.com>, <robh+dt@kernel.org>,
 <Nicolas.Ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <soc@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 2/4] ARM: dts: at91: add sama7g5 SoC DT and sama7g5-ek
Thread-Topic: [PATCH 2/4] ARM: dts: at91: add sama7g5 SoC DT and sama7g5-ek
Thread-Index: AQHXQ1WBJ3OL0TN3Tk6rA7yEdnXREareauMA
Date: Tue, 11 May 2021 15:17:39 +0000
Message-ID: <69db39fe-e969-f637-7226-5cb63fc477c5@microchip.com>
References: <20210507152655.182558-1-eugen.hristev@microchip.com>
 <20210507152655.182558-2-eugen.hristev@microchip.com>
In-Reply-To: <20210507152655.182558-2-eugen.hristev@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [2a02:2f0f:910b:600:faed:b4c6:b74:cc75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07450609-a45b-4813-70dd-08d9148fea77
x-ms-traffictypediagnostic: BYAPR11MB3816:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3816DE4D2FF127217470826CE7539@BYAPR11MB3816.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eleEx5vSAsEHSpz1XU6sLGuNinpJwuq6VXLRkFpen1M7M5XsqyW7TtA4yzxKHTRqpSYVR4XrfjKAQFKmrO+EHpmrhyE3E7EVny0FZHDadibvvUNG4Z3CNnTAfgxB0XaxmR1oGFKZ2OW1ZgF56PDs2z4cJ619v0/M8CeH/6T+ItqgpUphHZr5Cs8vvy52PrFtukCC/sKcucWNym14ajWPVDLHYH29w+dbzoF7iPtp+YctuzZ8OTC+ef1IL5byYIEK4nF5pgACyCnB2VEoWqmyYSbQCeovj1c48TzspyBFuXVbpIHgVMq7CShft9A+JNMnTKx7UnYtzoum6TOaWYrx0qWcnbZm+2sM/V9bJJ0UJo7Zi99qWKnIkJ6UGkKWo/VsRV+zAs1YfLkjD0OsnWPypaxJCGmH9dgXykku6Ehs6hx1VsncjkwmI8gehGIsiuQ9YrVat6SfmRUlr80mc8b2VzFfDXEPTT+6idFxGCE+R0gZL5vTutIybKO+/QfpvUi5WdJ5C8udOoVD+oqjxdfv9c/ncoV6aZGteZ+F5cxl/TNVzadME9LqLHKeBP715CYJQX5fzBk8lkkjr6W2FmMRWCdjHoITTO5g38/Vs/I3ERP9vlvWjqkD2oT+XWgX91deH2M9FLNy+PEN8af4A/5ZkPcKduSS8aKSv3OTnzGidMxVIZZwnHoPpRGgdGWxhNnx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(136003)(366004)(346002)(39860400002)(66946007)(36756003)(71200400001)(31686004)(5660300002)(2906002)(76116006)(66556008)(64756008)(66476007)(6486002)(6636002)(122000001)(110136005)(54906003)(91956017)(316002)(38100700002)(6506007)(107886003)(66446008)(31696002)(478600001)(186003)(8676002)(86362001)(4326008)(8936002)(6512007)(558084003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YWtoMmxIaUx4aVA5NmJ0eS94dzlxK2QrTVlHMGhRMjdkM3V0ajhGVmRZeXgv?=
 =?utf-8?B?cjROY3RYYmdzMHRQTmRnQXprd2s1M214d2FJQUtDNzJOZkNEYlVPNnZNV1d3?=
 =?utf-8?B?cnErbmZXMnd6UjZaaE5QOHZVVUxMcUh1N09xb1RueUMzUWdRd1dqaTV2Z01F?=
 =?utf-8?B?Um9HZnhJTEs3SjhBNEhhQkxmZVRCV1NoUGR2ZmZ6SThaVG5aMjM2QlVFSUsv?=
 =?utf-8?B?Y1V1ZTdPRzZFTUU4bjVlV0FxZGtWbW9CV1NZclNxV21hWDN1aC9laFVmZGpz?=
 =?utf-8?B?S0ZlTmExUmp6ajdKRXA3MDYwOG9Jd1hPSmNpc3V6RXpQY1BESExyaDNDZnB0?=
 =?utf-8?B?RGVyYnVBeTUrL08yQ1Mxc3lIZE10cVdxalZFOEoxdEYxOEs5d24yVkI1TzU1?=
 =?utf-8?B?SkZUMHlLSGlmb2YyZGxqSlg5SjJ0M05tVU5naUtkUDhMYy9uNkwwK0ZXblVn?=
 =?utf-8?B?VmhFNk5ISmhwNUFoYnhXdDdRRWZiQmNpZDJCY1JmSU5aRGwvNnUxTFR4RmFW?=
 =?utf-8?B?MmdEdWVUZmxCTDFoc0VxUnRpbmpqQ2haam9uME9hMVVGczZESm5lK1RwRkFK?=
 =?utf-8?B?NFVTL3crVW55S3ZHTmJFVVk0YUFkQTJ5dDdUK0FzcXAvb09OTjI5WEhUclRZ?=
 =?utf-8?B?ZEd6T0NRZXRvb3ZLTXJWVlNZVTBLMlNMUEIxSzZISWxmV1dDOFR5eHFjeVBI?=
 =?utf-8?B?Y3U3NmZIeStHQmVyZVJYSkQ3TDdJcWlVa3h3T25NVERCTDhtVXR4d00vZzV2?=
 =?utf-8?B?MzBVdC9uRnVuakVoVVoxOW1yeXo2V3lhYk1WU1lidkxMdUdZcEtTb2QweWkv?=
 =?utf-8?B?elk3NXRySkxuYzVyS0VnaDcreG56ODdKd2pMYVprMk5KYU5xUVZvelg2TXdy?=
 =?utf-8?B?NWtUR0x4R1ZlRXpoNWEwbHpjU25kSXFxemJxNTZ2NTBWelpxbkJHTHpYdE5P?=
 =?utf-8?B?NGVIREo3RnJNSlZVWFEzQllzZTBEdVVVSDhQeDBFZUpTRXo4aG1oU2s5SzFz?=
 =?utf-8?B?aUc3cWg5Y1h3QkdocFlPbjRtTmgzQThKQTZSeFFGSVEwbVpKdlR0QzJheE1M?=
 =?utf-8?B?TGZPMnNiMXJ1b1dBeVZhR3ZmdXNmMFpTMUNJNUwreHZoTGhjZk1pVnNvWkFa?=
 =?utf-8?B?Nm54aHo3L25zV2ZtYmxGZDR5NnNvN1lyK1diY1RaZGE2TDRsc3VaSjhjek5V?=
 =?utf-8?B?U2lNWGI5RjRncy9RYUZMZXZ2MnB4MVlFeDA5NVk5Z3ZMUFhSaVRCQ09PVnJx?=
 =?utf-8?B?cHluOG9wa3VTL282RXZkM3luYnFmNWc1aEhxaHlick9IaWhWNlB3Q1BtZ3Iv?=
 =?utf-8?B?SkpyRTRkVFhLVUNVUEJ2dWNLeTI0Z0htN1l0dVRLTWpmVkNFaks4S0s1WG5X?=
 =?utf-8?B?NGNqbCtsbnhTaFVtN3lzcldPY0pwNkF1M09CMGpTU3VVTkdtK1FwRnhNMzQr?=
 =?utf-8?B?VjI2QUFZSHZLSWFLakNaZHo3Z0FDM1hTNjVmb2t1OSs1Wjlmc1A5SXM5NndC?=
 =?utf-8?B?R2REcnIzSzdPT1Q1YnM4eXo1dVZiWnl6S21IY2JsZ1JGUUwvNGtJWFpXQTNM?=
 =?utf-8?B?VDFNNWlBRVRHQXpQVzgrUWk5Z2ZURUFwQkFMSVpBN1lmd0NGOWpndTRCSkcz?=
 =?utf-8?B?dkJFNkgycTU0cldPdmN5SURoai9aNDBoZlh3YUtEd1FlSk9tbmQzSTdrN0Nn?=
 =?utf-8?B?NlZhMlpDaStKbHlTclIvVzZkUVdzS2ZuajV4Q2NmQ2F2MVdZd1MrLzR3bXc5?=
 =?utf-8?B?QUluNkErQnRqMEppdSt3YVNxQjg5bnZDQWhsVzl2NCt0RzlFTWZvdUovUndZ?=
 =?utf-8?Q?IlxL7q4fPMzKRdx9XHbWhR0OyOKDLsWOTjNK0=3D?=
Content-ID: <72E3DAFF8639BF4D9A8BE46BD7829A07@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07450609-a45b-4813-70dd-08d9148fea77
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 15:17:39.4721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9PidwcSE8hMc40VMleCiiSM/jIkQq+oCsZUViSfmk3zesjI1i1J6l5cHVRW8XbLhNBa3DW2Raa1KT3ucZkBCxrvn1+8+PKRc8/BwiJyajh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_081752_558374_49FEC70B 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210511151739.d85Gr9_hi5uUpJ-ZYcD36P5HN2yihnTpvb26SceLTqc@z>


> +#define PIN_PC16			80
> +#define PIN_PC16__GPIO			PINMUX_PIN(PIN_PC16, 0, 0)
> +#define PIN_PC16__I2SMCC_DOUT2		PINMUX_PIN(PIN_PC16, 1, 1)

This one should be PIN_PC16__I2SMCC1_DOUT2

Best regards,
Codrin
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
