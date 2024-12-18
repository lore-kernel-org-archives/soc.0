Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2125.outbound.protection.outlook.com [40.107.215.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6F6487A5
	for <soc@lists.linux.dev>; Wed, 18 Dec 2024 02:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734490558; cv=fail; b=pD5PHtBi9s10LoYvJoGWMqW38CqLBEBpNeM88VAiCwSRnlhGPq+aksyw9AJ6rrU8A77KVdWwVHniEjQ4vSG2HInTa5WlDxmSDUxFeJi49Cg9/mYjObGd3frDApak4vIqjd0ASG+vlhvUagYTACPqMXoI1oeg+/ue9hlh4Xn4Sik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734490558; c=relaxed/simple;
	bh=wxk4KRmw70JPVbMB4hfSxOXGK+Mha6IeEkxXxcEZW28=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dty7Gw/qdmdqhcwj+mSTJeRIYsbQSYjVbI7N2/hrPtNk1v1m1GjItS+BLyPVOpk1hLt8PmCy29wGZMtMy+Q14KdIPOrymWAGb+H6n5hh01WqZgLw6bNWZ+yHEdnARxQ7/aPEUc4n5JNT+SfNX+aahcT7vJHsQY3ZKDuALkSSM0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=UziW3Pt4; arc=fail smtp.client-ip=40.107.215.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="UziW3Pt4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFquna8xxH7IFDfZ92gfe2TEOPIYNEOWYiOkDLXny1o8I4B82Q2xLR13hTvJAjKJeQh736wlMSdoqpp8XZD3G/KjXfGVSfDNGlnuXe+lxmeqWIFKchXh0AdsQA7Tqtbgt750WVptBq8ieecbJSMX+nG2bidDzCDaDWsIs/tbIgyEycP8hzjWc4kqEgDqIPTs/BeAEn92Y+CmJ08V0W9IAZe5sDlIFPz+IV8Qs5yoGKIFrnbdClKcVpWLtn3bVPu9XlTEJM+w26m9WsShjuN9Cjb4c1VNVfbeJfv1i+s4aiz3IwvDjJ4FKzzX3X/ELryNnUrd1o8ckAQBuTRIeojTNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxk4KRmw70JPVbMB4hfSxOXGK+Mha6IeEkxXxcEZW28=;
 b=az4J6mXnMAzeDsJL3Vx41XLm00ipGCW39KSgpc6h4h2zgHcuZ8wRZRFDHTzaaxUHGjE2WxITtOAPXj7NSJnPBr5jarmLRhi1wUqXOYuzjrlCsfq6kKKUTiLtS9mBCdbHiFMssP34xzSdaVvdh2B+fpM0KLCyoBuFoT8FR/bEcu9tK9zZ6tgJPJo+gY9UfHaVeG/VbcSnXJM2CoRMf35UOEFFVY/U1vk0TVLoXSwnGDCe3Op7JjthEMyi8/MDysppDYEgVdu0HoRNRvIw6inZyt4YBBpKdTPHGk5pkU2IO/J9D5DgIgwcqbcNcTvZyQGe5+Fh3uXiJuM5Gy57jtNyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxk4KRmw70JPVbMB4hfSxOXGK+Mha6IeEkxXxcEZW28=;
 b=UziW3Pt4ECQGkw92mo0g7EVyaIM7u7moJcpoJMfRW9YHoq0x/lnc3XDIs+jAu9isEjH8Xr8HlkAtuTMsG58R12PH9iW6t3BZk4GPX/zCMGLcF4tXKHIRAIb/xt0+eQfJS9WouTPZAELXJDahZIvwJadLL7IE10h1Pi+jihkk6yvhBHeTJNQSRdpI8eEwE8ZnU/TGNXY7q0j7F9rlWp5+Uhe8UsZjeIXCdeOxtqIsivQ9Sm66LSCuTrFoHuRirY4M3GvHDzAQpLbX8AGrHpLAjRQHwqxXQ0Cc58Dg29P3pjXfMVQY86NcFUaW4WX2DCvFjXEjvGTp08rw+DrgMCdebw==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by TY0PR06MB5802.apcprd06.prod.outlook.com (2603:1096:400:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.11; Wed, 18 Dec
 2024 02:55:51 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%4]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 02:55:51 +0000
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net"
	<olof@lixom.net>, "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"konradybcio@kernel.org" <konradybcio@kernel.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"johan+linaro@kernel.org" <johan+linaro@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: RE: [PATCH v3 2/6] dt-bindings: arm: aspeed: Add ASPEED AST27XX SoC
Thread-Topic: [PATCH v3 2/6] dt-bindings: arm: aspeed: Add ASPEED AST27XX SoC
Thread-Index: AQHbTK3khu4rVfXiK0CGLfkjNNC4MrLj0HKAgAABQwCAB4Rd8A==
Date: Wed, 18 Dec 2024 02:55:51 +0000
Message-ID:
 <PSAPR06MB49495C182D0B64687E0174A389052@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20241212155237.848336-1-kevin_chen@aspeedtech.com>
 <20241212155237.848336-4-kevin_chen@aspeedtech.com>
 <7289a50a-e139-453f-a512-3dd68a0839a2@kernel.org>
 <7b991fca-6e2f-454f-a94d-6a583854769b@kernel.org>
In-Reply-To: <7b991fca-6e2f-454f-a94d-6a583854769b@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|TY0PR06MB5802:EE_
x-ms-office365-filtering-correlation-id: 7073d45d-d9ea-4457-3011-08dd1f0f7bc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2w1WEVUOGZnVHJhSFQ0cTNBRk9sNThVekVKWU12ZDhRVkxFOVhmUE5HQUY3?=
 =?utf-8?B?UXpqZ0FxRmRSdFRWVFpUU2thU3I0NDlHV0I5aFoxWEt1TGhtVW4vQmw4Wnla?=
 =?utf-8?B?WDN1Z2FiMEZVdTRJLzFubi83OE45NVhtU2gvaFFxQ1VmRGZmNnNwZytHbjdV?=
 =?utf-8?B?SkhLZzdPaHFwYnkrdDYzdGR6SGJzWHRXUFpJaTE0K2pKVng0WklpNWVrZ1RG?=
 =?utf-8?B?V1lPUXZCLzZaTlRyREIza2c5QnBJOUVyK21oN1dZd2lCVjh1RktrczQrU21a?=
 =?utf-8?B?bWlJSHB4WElaSGQ2cnVkYVRWTDBYd3YwNUlUeWlDWUNjVE9QNlV0cHRrYTl3?=
 =?utf-8?B?STJIaExjUS9tblZVMUJRaTJWTHJwWS9LQkxJM1liK1lyenhEVzV0c0pXSTIv?=
 =?utf-8?B?SXdPTzFuVTh5UDFCK2JCR3hPRGdwM1NQNU54dmhXNGtqYkxpQ2k3N0tnMGhC?=
 =?utf-8?B?WHR6dFMzU3d5aWZ2R21NclhxalBCNkFjekZ0QU1VSHBIbkc4TE5DWkhtWk05?=
 =?utf-8?B?NWoycnBsbFo5QXZVYnZBRHlaNmE0c2VKdG5odjhRV0NORGxaUWhDaWZkdndo?=
 =?utf-8?B?R1U4MXNrUzlRZjNFOU0xMy9lRGNoT1Z4TysrZkhHOGN5VXA2ek8yOWhlWUUx?=
 =?utf-8?B?bUZSVjcrbGxUbitPRXlma3RrMWQwc09BcE9RU1U5MHlBSm9sb2Z4c01Bb0tQ?=
 =?utf-8?B?b2o2ZVNIekxmNXZMaWFPc3BnallHb2dlVFM1bmxPeFp5R01sRENBOEcvakYw?=
 =?utf-8?B?aTVFcHU5dXlKeks2TmtlNHdTTEM4RVdxVE01akpxbnZxSTNva0kzdHZxTkxa?=
 =?utf-8?B?QUZLd0NUenhkTDNuaVVuWUJKa0dwT2lhNTA4YTZwY0RGMVZEQVpvaW9veGlI?=
 =?utf-8?B?TkxpdHd2ekpWOWY4SzFCZlE2QWpLa01Jc0s5cWZlQm45UHR0OVNMOVdxbGNV?=
 =?utf-8?B?WkxLOFZXNFVnTENtQ2p6OHZ6T3IvM0k0R1R5aFBsWUZSZnV6YUxvWTVYMUxM?=
 =?utf-8?B?amc3eFhQOS9OOTVvQ1R2Q1ZjVjVmSnNCazc3OWFrcGE5Y0FyOFhsMXFlTU1o?=
 =?utf-8?B?bWhxc0NyaGw1UVM2UzdhLzA5WUxvc0RuTWxpbWdtYU5IS1NDbEZqK3dxWllQ?=
 =?utf-8?B?bmtuSitqeTFGa2dGZ2xZTk93ZU03TTV6ZmJUUm5mY01EN2orcDhPMnN6ZWtY?=
 =?utf-8?B?akNJZXVMS1JmbE1xKytJOUkxWkdMcVNEUWlOOEJ2eWRqS1BDNmxTRzVtUjda?=
 =?utf-8?B?TWczL2xaN3B2ZitRRWJXY3p2NFBjeEVPc3lwbTJyRG5zeEtxQ2x6U0p1Z1Fw?=
 =?utf-8?B?Qkk1YXFyYU1mOUpyOS9YRHhrWEU2emo0LzZkWmIvajdzdjIxZnFrZGMyb0Za?=
 =?utf-8?B?ZmJiV3YrVHV3TGMxbVdLRXhWcjZnMm5ncG5xUHpWUTl3RkZ0TzRLd0RGSzFj?=
 =?utf-8?B?N2dPZDI3MlE1WlRHZDA1UGhZSUhBUVV2ZzFzdFJhNklIYU9ON1dHZ2FoNFlD?=
 =?utf-8?B?ZzVpelduc3U3a21wdHFob241YitpMXBKTElnWW1ucXorSGhHZERJL3ZVMGZU?=
 =?utf-8?B?U2JYNXdDRFRKalZ2UzlyMGFISEJwTXp1R3JQM0JVOGFCdWtoamhEVW00Mkp6?=
 =?utf-8?B?a0tqUHhJQVVBSW1ybG0zcUpmaXhzeDg5dWpPeFE4dCthREdHVm9mMkgxZWxq?=
 =?utf-8?B?LzdMWFRJWVg5SkliaFN5dDBCeXNDNUJYQ2RacitpdzU1NVc0Zi9oQ241MXAy?=
 =?utf-8?B?cXFwNEdjT3ZuTEdvMVMvWFp0c3JXeVhuVmZkNGFnU2RnOHpVT1JxQTF0NGtv?=
 =?utf-8?B?K0FIK0h3bGQrRFZEeC9yREExblg1Q3F5RW5BMytqeUtEeGI1M01HZ2p5SGh4?=
 =?utf-8?B?a3h2WmM3OHgxTlBzMzF4L3BGRnc2c0dGSU04SFZtSjAxWjBhNDIvUlhGUFA0?=
 =?utf-8?B?YXB2K3RvbGNYdnFJb3ZaR0k1Q2M0MW9OQWp5dWdGek91UGJKNmt5YjRVUzli?=
 =?utf-8?B?cTRzMlExU0pRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWhMZ3d2MmZQeHNySWcwYU5RZG5wNG5NSFpjdWpwc0MxQTkyaGNMbFF5Qkg0?=
 =?utf-8?B?bE5VSWpaSmtRcVJlREVMaUwvVkJVVlN6NTVFOW5HYUdTUUJyRndMSjlvRnBG?=
 =?utf-8?B?MzBhTG1ZaCtGMm14VWVVZnhUQUpSOGE2TXZnUmUyNnBxbHB3bTUyWjZtclpJ?=
 =?utf-8?B?cmtyaUNuRXI5UDhid3U1QzVPVVdrUzJsd1ZQaHhDay9RdU9vcUZtVlozZ1Nh?=
 =?utf-8?B?cHVTVUtnMUZEWUlDZ1Bvc0UxbTNGK205dkp5UFR4Y3dtM2RNcTFkWjIrc04r?=
 =?utf-8?B?TnpGZTMyM0oxWHdHQ0ErbVFFQWFSREVkTHJiQ3NtVTJ4Y3pmaWR5cWZycWRW?=
 =?utf-8?B?alhLb0RvSWk3bm5pSWk3Rk5pczQxM0FLd0o3eVJsYlVMdVR5Qkcxd3oycUZE?=
 =?utf-8?B?VHBEKzJmeVhLZXFEaE85NFVjT29qRElHTWhNQkZBdk42MWkyL0R1bGdOakJm?=
 =?utf-8?B?Rmt1Umw4eUJqamFvd2U0WlUwYTFBWXNJY1hTUlBYWUo5NENEOGZNMVo5TkI2?=
 =?utf-8?B?QlJrUDVJOUpZMVRad3ViRTdVQ0h1R2dkK0Y0QTZ2R2lWZzBoWjRJSHB6Rlg2?=
 =?utf-8?B?cXFXYWFxaDljd2JLbkF3Y2VNZUozZzFKVmtNeFBuOVZ0WnlGMzRyc2ZvMVlI?=
 =?utf-8?B?cmN5K0twcjNhUFhhQUFEUDJtalF3YmxSZVM4SFRUZk80YXVJaU1QS0JpUks3?=
 =?utf-8?B?S1lXRFFaRE9pWXRyd2E3SkRYMnAvQXhPTDE2OVZNU25seTN2K0VuTGR6OXZV?=
 =?utf-8?B?TzlFWU5JTWpDTEJETjFmWUg4UXhKRE1Nb1FFS3VLWnVTUFRmZ2w2TVZLRTI0?=
 =?utf-8?B?eFhxeTI1QU5rYXRBOGF6OFhGLzNieXVGUGNwL2lybTVmUzg1N3FxSmZ5c1Za?=
 =?utf-8?B?L2hPREpBZXZjL0huVVBnRzMyU0JWdWorQjh1c1JsMVhCRzBRblEzRTRvdGoy?=
 =?utf-8?B?QUcvMUxVWmpDZVV1MVBaZjkxZzlrR2QvTEZPSG5hRDRTZjV6SnVYQWoxQmo4?=
 =?utf-8?B?UnUxVUdiM0lRMDE5aHd2UGFwOXZaTW5zTWpPc0FYOUtMcXNPVkdRZGlEMWsr?=
 =?utf-8?B?TDNkR21TcDdPczVXQ3dseEJNUGhIUnl3NVpKZkJKL0xpUUYrM2p2K0c0dksz?=
 =?utf-8?B?eGIvV0orU0Q1R2VmSG9TQTRnUU84WEZmMTFrbUlLdXVaQTZ6NzJyWmtueTNB?=
 =?utf-8?B?KzNzVC83Ykw1MmNubFRRTlFXMjRZc3Y4ZWorcStPbzlDdEFoaTQyOHNpWU83?=
 =?utf-8?B?QTVVdWk5V3B6TXQ0amp4ZFdqbVJia0JrcGpXRWU3czhvc0U2RHdGWGwvM2hL?=
 =?utf-8?B?SEJ6OStpMlEybU9yTk8zSS9IUkVRNFZUZFlXcWtDUzZzQ0ZnUUVZZnNnMkU4?=
 =?utf-8?B?YmtSZno1cFYrbis1ZzZabVRzNFdTb09UU0V1L2lMeTB5SmRHN2VRd0RKOE5P?=
 =?utf-8?B?ZkxUVGNIN0gwSWF2cHkrNE9MRm9BQmNScjVsc29uWWhIV0FFTThhNHdGR29K?=
 =?utf-8?B?dytTZWVrYmEvZ3R5RXhoSUZhRHJPWW5QTkIzVFdjanV6Yk42MFNzSEY3bEdQ?=
 =?utf-8?B?Q2hnOXJQQjR4TU5JNy81SFI0dFdHR2ZaZXp0bmV1Y09VQ1Z3WExVN0VxcTRs?=
 =?utf-8?B?ZDFZVm1FcDhhcm9zSzZrTEpzUFhSNW04RFM2QjBxZ0FlRUJkR1YzMDBuUjZs?=
 =?utf-8?B?V1gyWWlxbTQxQmh6djJtYkdaZDk2by8ycXhqZ2VrTGw1RzFNVWNUdnpxZTh4?=
 =?utf-8?B?Z1pVUXVCajNZKzlBUjFJWHQ3YU5OWWtMSjluOXpsMnhKNHdFR0IvbmY3MmNj?=
 =?utf-8?B?ckxRY2NkUG9rZmc4VzJXZXUxVlpVK1hpc2ZSYU80dUlhRStzenh4cUphZFdj?=
 =?utf-8?B?V1VtaXJDMVN1dFErYlhUVkF5MmRlOXZDdTJXR2xadWR2VHR2aWdpWEF5a2kv?=
 =?utf-8?B?RnA1Tko5ZUYzSWtZMExZUUUzNG94eDlzWjJRc24rYW5UMjdrNEJLQ3FXUVBF?=
 =?utf-8?B?dmlZSDBmZUJyTWV6anhMRURBNk8rdnBaaEZwckJvRWxOc01sV2VRekVyZG5D?=
 =?utf-8?B?MVorZ3FYR2puL3NxdzVRT0J6Y3llUGlWNklnM1hxNXE2a2IyWTRGbW5DN2ha?=
 =?utf-8?Q?wXctiOvMCPO/uQzQX8MmfYla4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7073d45d-d9ea-4457-3011-08dd1f0f7bc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 02:55:51.7582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ucVO++14HswcVzG8YpS4LJtJV8BM+JS58N066ZwDhG661ez2fJn282aoNe+BDmLEBrTlTPqSlDbmfHqR06BCR3E9AFU5pxxBMOhdaInbk1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5802

SGkgS3J6aywNCg0KPiA+IE9uIDEyLzEyLzIwMjQgMTY6NTIsIEtldmluIENoZW4gd3JvdGU6DQo+
ID4+IFNpZ25lZC1vZmYtYnk6IEtldmluIENoZW4gPGtldmluX2NoZW5AYXNwZWVkdGVjaC5jb20+
DQo+ID4+IC0tLQ0KPiA+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9h
c3BlZWQvYXNwZWVkLnlhbWwgfCA2ICsrKysrKw0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlhbWwNCj4gPj4gYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FzcGVlZC9hc3BlZWQueWFtbA0KPiA+PiBpbmRleCAy
ZjkyYjhhYjA4ZmEuLjIwMTkxZmVlMWY1YiAxMDA2NDQNCj4gPj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlhbWwNCj4gPj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlhbWwN
Cj4gPj4gQEAgLTEwMSw0ICsxMDEsMTAgQEAgcHJvcGVydGllczoNCj4gPj4gICAgICAgICAgICAg
ICAgLSB1ZmlzcGFjZSxuY3BsaXRlLWJtYw0KPiA+PiAgICAgICAgICAgIC0gY29uc3Q6IGFzcGVl
ZCxhc3QyNjAwDQo+ID4+DQo+ID4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBBU1QyNzAwIGJhc2Vk
IGJvYXJkcw0KPiA+PiArICAgICAgICBpdGVtczoNCj4gPj4gKyAgICAgICAgICAtIGVudW06DQo+
ID4+ICsgICAgICAgICAgICAgIC0gYXNwZWVkLGFzdDI3MDAtZXZiDQo+ID4+ICsgICAgICAgICAg
LSBjb25zdDogYXNwZWVkLGFzdDI3MDANCj4gPj4gKw0KPiA+PiAgYWRkaXRpb25hbFByb3BlcnRp
ZXM6IHRydWUNCj4gPg0KPiA+DQo+ID4NCj4gPiBUaGlzIHBhdGNoc2V0IGlzIGp1c3QgY29ycnVw
dGVkLiBZb3UgYWxyZWFkeSBzZW50IGl0IGFzIHBhdGNoICMxLg0KPiA+DQo+ID4gUGxlYXNlIHJ1
biBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgYW5kIGZpeCByZXBvcnRlZCB3YXJuaW5ncy4gVGhlbg0K
PiA+IHBsZWFzZSBydW4gYHNjcmlwdHMvY2hlY2twYXRjaC5wbCAtLXN0cmljdGAgYW5kIChwcm9i
YWJseSkgZml4IG1vcmUgd2FybmluZ3MuDQo+ID4gU29tZSB3YXJuaW5ncyBjYW4gYmUgaWdub3Jl
ZCwgZXNwZWNpYWxseSBmcm9tIC0tc3RyaWN0IHJ1biwgYnV0IHRoZQ0KPiA+IGNvZGUgaGVyZSBs
b29rcyBsaWtlIGl0IG5lZWRzIGEgZml4LiBGZWVsIGZyZWUgdG8gZ2V0IGluIHRvdWNoIGlmIHRo
ZQ0KPiA+IHdhcm5pbmcgaXMgbm90IGNsZWFyLg0KPiBCVFcsIHlvdSBhbHJlYWR5IGdvdCBoZXJl
IHNhbWUgY29tbWVudHMgYmVmb3JlIGFuZCB0aGlzIGlzIHRoaXJkIHRpbWUgeW91DQo+IHNlbmQg
ZXhhY3RseSB0aGUgc2FtZSB3aXRob3V0IGltcGxlbWVudGluZyB3aGF0IHdlIGFza2VkIHlvdS4N
ClBsZWFzZSBjaGVjayB0aGUgZm9sbG93aW5nIG1lc3NhZ2UuDQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sL1BTQVBSMDZNQjQ5NDk0M0YzRjM0ODgxRDIzQ0VFQkQ5QTg5N0QyQFBTQVBSMDZN
QjQ5NDkuYXBjcHJkMDYucHJvZC5vdXRsb29rLmNvbS8NCg0KT3IsIGhvdyBkbyB5b3UgdGhpbmsg
d2hhdCBpcyBiZXR0ZXIgZm9yIG1lIHRvIGFkZCBhc3QyNzAwLWV2Yj8NCg0KPiANCj4gVGhyZWUg
dGltZXMgc2FtZSBpc3N1ZS4NCj4gDQo+IE5BSw0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5
c3p0b2YNCg0KQmVzdCBSZWdhcmRzLA0KS2V2aW4uIENoZW4NCg==
