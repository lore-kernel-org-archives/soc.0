Received: from mx08-0063e101.pphosted.com (mx08-0063e101.pphosted.com [185.183.31.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AEA26157B
	for <soc@lists.linux.dev>; Mon, 12 May 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.155
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057127; cv=fail; b=BtvD6vkUiGRHuV6yLS8p9zCaCUXDUYXBvkjKnfvz2WUjN9fv1Xsp5plfTABNmlG6eaiSnfWkfRsA9CJ+1ezQwG36j2BKOQAtwK2hpgHUfqXP4ihwF3iK5NKAxelTc2GKFrkbxi8B7j8gbyvIkVjz698ntaINZw0/u/TzQe0pz6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057127; c=relaxed/simple;
	bh=in1P6rRoT/qqgCiKJTQf+nb16MPh8b+BzhoFRPBw4uw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ufaadXvcQoogo3dnsQepz+RNm5MebLncTOhn+x5yYrTcDY59kudaT2HhQlbea97GMJv7OI04sEcMn39w2C+5vc5mgZLMD7Z52jLwnzI7NFkgqExrNQD5iZagss4+QR5GBcXyUZw6Vs7orkGuS1xnCdw2lkCqMKudJefMa8PvAFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=CR8RcBzW; arc=fail smtp.client-ip=185.183.31.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="CR8RcBzW"
Received: from pps.filterd (m0247494.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CDV0jL015137
	for <soc@lists.linux.dev>; Mon, 12 May 2025 14:33:23 +0100
Received: from ma0pr01cu009.outbound.protection.outlook.com (mail-southindiaazlp17010006.outbound.protection.outlook.com [40.93.131.6])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 46hv4sgwsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <soc@lists.linux.dev>; Mon, 12 May 2025 14:33:22 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIc+Z+7TMYyCn8IPrONoOLonkMY77BWakFTPCLnlprohrpdq5bdadpRhMLJgQsiCTS2mWhZrMrcobDD89spJWdWjAmKes5JBKY6ArRzqS8Mvip14AXUr+TevKcfr+YJyYYy/10PhdFlcx6Fx+g7QOfGDzwQG529wN/QDplBpvygFfkvqzvYPyK3UHfgY0bPgymzRPC5OqWB/3niJwAldEFkxA7iDaHA/NTIaZtw0+uBEmtfItY2w+SmOggkAGqynuuTYOKY0qlVNl/nJajrjQeGovGGTQ8GLQW1w8ZQ/DxSHyWPsfLwVVbv0m/hfrw4lakt/+6yAMG49P8MQWD0m9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihJZSUzx0xqOMdbwFm92SRqaSV5ElEhva604C+Jkqw0=;
 b=LlBTkDs0vN0VYyNTYWFbOr4Bi+EYUy24/F6jz5V9henfrQAPP2OMurKLzYgynOXhyyLfBeDLYxDDGp/ZAxRlbh/QQEdlmtjTrJKi0J4T0q06KVIAuB3ghhv5xe0pRLqRX6cHKKV0DSID4BthjHDXC95X/NEYc/tJbDLhMnfBXk+wN1hdmnlpuWuC3uZYlkoc/wQDPWCDI12ZzBtbtReLJPwU3bkQ0b7uHqUgQ218PbIFIOER5ramDO5SZn91Sh8GyqtFkAn7AjGk+pmUg+WFtGSrI/pn8kNf7bwHpdcfMT7MdnkTs7WSW9zDA8j8lcL/K1eucbxQjsWnDC2FI3dWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihJZSUzx0xqOMdbwFm92SRqaSV5ElEhva604C+Jkqw0=;
 b=CR8RcBzWHqK3DWdVOQilVqQ2H653xPBFYSChhixIFeTd91bxEgLiarVOJxTWzXMV7kTo9P9GT8lY8/P/Ah4doZ4kF6qajJ437OKnlQ/fzeXea1te5l2axoazvLyAkrA03bH/I8pDRR+Neur/b1BYZ2d87u6po0u50cR1Hy+pVxA=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MAZPR01MB7574.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Mon, 12 May
 2025 13:33:17 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 13:33:17 +0000
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
To: "soc@lists.linux.dev" <soc@lists.linux.dev>
CC: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Subject: [PATCH 1/1] arm64: dts: blaize-blzp1600: Enable GPIO support
Thread-Topic: [PATCH 1/1] arm64: dts: blaize-blzp1600: Enable GPIO support
Thread-Index: AQHbw0Jrr42yYs4YLkeSc3vNgspbhQ==
Date: Mon, 12 May 2025 13:33:17 +0000
Message-ID: <20250512133302.151621-1-nikolaos.pasaloukos@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|MAZPR01MB7574:EE_
x-ms-office365-filtering-correlation-id: c10b3b9b-5d08-486d-10d8-08dd91598df6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?B+BPphQXw/sl3bd/W04Eu/l2YRcW0o8Xa+qIYzQEPOxFIzfesTirKDO8kK?=
 =?iso-8859-1?Q?oWJcU1FgTJZ9ghYCHg0yM1UHS0Mr5NmdiatYWE2J0tRBArJDyxpI5+fNVn?=
 =?iso-8859-1?Q?zAvWx7fldyO3T7YJemxJlhSK+LQ6aSnzhbGtEQhWRCIdnhGEqOJ5AuNgL1?=
 =?iso-8859-1?Q?QUpJJjVPziDxdEaOocGTX518106J8AtEZxD5f8065O0aZqLhWzmg4mCJMZ?=
 =?iso-8859-1?Q?W25B/4rTNQjClVE2Yi2LJm33y69cL2yD6Bxpgs3MEEcSi6VgpifTUBVvGj?=
 =?iso-8859-1?Q?THMYa2tYPDahzkn11/z4YJE0N2W8Y8thDhcgtNW6WdIUnGftKK3bOBg3/j?=
 =?iso-8859-1?Q?WtAKvI3Y1wy4TwsQf7fl8+C3qj8efzXK3LpyNb4qeXL9V2kWojWQsHajnr?=
 =?iso-8859-1?Q?A8xbbwD7THuBsOr612cyADduXor21kiO2CLfagbSrfCYsEJ6N7P4+eXQNU?=
 =?iso-8859-1?Q?+Cyh3z46TTAydY87/QfUgWeve9E2a0cZucwZAgLqryhWEUG11LMSGeuZEZ?=
 =?iso-8859-1?Q?GSQMdBvr1oTTarDBnsYf1Uqf1/KeiBWjo/GH9JUyb7EAs9SyCh2KDHa7R9?=
 =?iso-8859-1?Q?Ij5xA7nJ7NC1pGAS5AjHzW75XpqZ6rRnMCpushAEWPiTUM/ro8q/9xXZKi?=
 =?iso-8859-1?Q?Y6FAW1/x4NzZ/Yn+S+z0/chGP18sAfxvYXEHIP3jeTXCxBnMIKg0FjOOuJ?=
 =?iso-8859-1?Q?l5HsFTX/Y3v8HwielGBrDmY93pMHrbU/UN+VktHWxnTXNjCD6dmAhcnaQV?=
 =?iso-8859-1?Q?NElgE1+6TzMxx0QOedch2V8/qWZy3l6c8Ab7W24BwCDVHZ+9aZqHReYk5i?=
 =?iso-8859-1?Q?0BM2eW/T31v9KHF9lHke0gYRDdrT/k7gLcBdJHUFFlIb9y3eqmr7wroimb?=
 =?iso-8859-1?Q?+giK27OawBTl9BVJjGRazzVCSGp8VPeXndrIKYA0R4m8BKwDxvLBTntnJW?=
 =?iso-8859-1?Q?wZPEBDgwlAGWMMxKB+K4YgAx6xvXzq8gxc/qsRDSUUE8lKZI1Fu/KAIzLN?=
 =?iso-8859-1?Q?YvkK/tfCyllv86CAOwmtoTJ9KFN/sdYeFQA1ld5xIf2r9oHDICDU0tdfCb?=
 =?iso-8859-1?Q?ixph9KpKJ9rM1CdPmFdRLyPek8XM/JfKVusCJNBqjJTzTIx0qpYOA4O14z?=
 =?iso-8859-1?Q?9NnyFEgqpRm9PeGQuBr+r+caf/s7OpWU1UkqPsiO9N9EvrXKK7fDow7XwS?=
 =?iso-8859-1?Q?J53Xf3R3+K35pAekDmOoVrSA8vgvz7U6fRtrKHnifPwzVhBUOTuvEO97ko?=
 =?iso-8859-1?Q?+LTYKsUjFfz2WPMp9la5Hcp8XvePjG5mWtpOJY7amQ24npsFy5AjChyixv?=
 =?iso-8859-1?Q?5H9UMS7eE011nSbdC7Y1KCk55V8FJQC9CbD/zHLmhkjC/iQU9c2Tpjwe4V?=
 =?iso-8859-1?Q?gfNZ9j5+/e7df5WYYzCSq1hQZCxgcssakI6dlvxFZ/tVk02lQKq+2Owy0N?=
 =?iso-8859-1?Q?2l/aMlQM133rYXqYbd2NRHBDIDqhue9NnxOEU/oLR1iIjmumbKaGi2sb82?=
 =?iso-8859-1?Q?53dfaT5VEIQQ3vtPbZQ+snoIQQJcCULJz1sJ8TbBFjZIyrHclQYI6WPztG?=
 =?iso-8859-1?Q?z6pDCWs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?swae/OEkt7pJZf2DfcC9M0Gmr2Nd+2GkRa2rkNCd7BudIYk3ERRSNslAXb?=
 =?iso-8859-1?Q?e4P9bTTrFPmE7/IcQ/AXm3MeAyJXETRhSgjy4LZwLr55B4GPNWrVU4drzS?=
 =?iso-8859-1?Q?dTXNpXZysx8DxjXPUcm8BNzTmn6APDeq8SVpVZeHaS2PM6Sa57GNVNFV9j?=
 =?iso-8859-1?Q?8e6n2y4KroJf4MmdCXT19WGqml7zr4pgahEBNRTwSuKpPDYpa9eD5aOCoQ?=
 =?iso-8859-1?Q?fGLZh9tkhGPG3MUi2Tv+LkZ+Cy996dYMbTDQmSa7k+7NLU5RfLCLYT22eJ?=
 =?iso-8859-1?Q?zOSxH1IFy8+fgEbGHBB6cMWxn9vQFUkzCmex/qzYYJ6XVYmlKSwod9Js6Q?=
 =?iso-8859-1?Q?9yg3njRciQ3Ylc5YAFycZ+OhxX9/t/fS5L4RFgU5eKKjZXRQ0pxzjoGKRo?=
 =?iso-8859-1?Q?mdul1P2JB9NFo+aVcU0DCzghEyRsl3frnnEB3GqdRWAoYh7PSRfdyTVOWs?=
 =?iso-8859-1?Q?Gg80CoypWWGVTtJOsMPIWr3hpe66kgjntJZW/ERz8/OkpQgB6XAOA8Y+Q2?=
 =?iso-8859-1?Q?xZa7RnA4hvgxYvLVv/wXGYplKxssdc15bXcoLh0D6qRKuOpULE1APi2eFn?=
 =?iso-8859-1?Q?ZlIpQ1WSipRT2yMcNwGevpIk56Yil8+aexyqNaIYsGL3I+yrKTPQC88u/V?=
 =?iso-8859-1?Q?cycMTWf/36eQZqrse00IOMAS7SKUB8T43mFw7R6eil60JXiDPQY6Vqp//n?=
 =?iso-8859-1?Q?inoDMGX883bVgMro282QlRCa45//U+/85pmFTMNtNzLoqBgYZx9G7mkHfK?=
 =?iso-8859-1?Q?G318PgmUkM3DecoJISppEtlTG9BjtPV1oLcQSRz9AifNOELuu2hglgZmzB?=
 =?iso-8859-1?Q?bJzEF2rt9J5LH9QnG5j0HWRbpqXxr8tFjMyJNPuG/uetTbT8WYjN3GvOV/?=
 =?iso-8859-1?Q?MSKkrUlSOwp90S9xeqb5NM+k/r7rwnVZYvO8TCbC1DSYK3xfNPiPaejQjB?=
 =?iso-8859-1?Q?/cu6sI+KXL3qxr73pfDHTMOOWTZH5RVRTNJev4GF07k9Pc91GYYsOWCd52?=
 =?iso-8859-1?Q?Fep17i+jRU2dR5jGUTcwdRndWh8hkCzk/W+JlkpByJepXyGjNxGDRUKu1Z?=
 =?iso-8859-1?Q?w2W3ReyaRTdzsOAgfmZXpzp2EFZdke2Rt6hCg6oBMkKRG5eRN5JKuR4kfo?=
 =?iso-8859-1?Q?eD6wCg4E85dWLjr3z6nIu3uMbmb4MwwDBGVoIl6L+oAMLiARPbmbevJyJD?=
 =?iso-8859-1?Q?xV7i7bmSts0QqV5CCX5WEa+yidxcVvTkRzcArSAQdZwpZvsmlswiYflH28?=
 =?iso-8859-1?Q?M2jrx8rUXzc/0xQmvpO+opwNVIuljvfA/OxuSc5RVzwZOEKX0S59SUf1l/?=
 =?iso-8859-1?Q?OmCHWE2fokMBcs/ROHbauRUbudig+ycIOLQszN1J/XO2y12+sj6RJmAFF7?=
 =?iso-8859-1?Q?e3xp9MDuMxtDjSoIbWhL8f0bhGQqMOaZZh0tBLaTUWjtOsUpkbWYEuhQNa?=
 =?iso-8859-1?Q?aVSmAiuXGXkFysqgtULmuj5iqdV9/VlymqHuvKXcEEvzomdbUjgg6eVLeD?=
 =?iso-8859-1?Q?fK3cnlt4Cyar2+ip8ToY4bV1Go0EMEkMby/nnvi2Nc8AlKqMYAOvWfFLkz?=
 =?iso-8859-1?Q?Pg0u1h0Fhz211z43gGi0KA0zlwOg2zFix5eMhgPbSh7DIoon7iqq/aFxt8?=
 =?iso-8859-1?Q?gn/5RZZimXIKNYo3PjI7C+qdElvIpvMIHANDfQRygVwuBKTHA0KQO4GQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c10b3b9b-5d08-486d-10d8-08dd91598df6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 13:33:17.6196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnrNYJaIU3YrTzpaeF44+9IfuXiU88uA0GAm8AVyb8asR+fgpu909OLwUJoUB38GMxdf1vxw6/3Pke+gbC8xDw49B6Vbl4solGquoFMD3Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7574
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE0MSBTYWx0ZWRfX2lAU0latsApA lRVmhQmv5va3dS4/fyYonXY79UPCEfwPxBybbWUHRbG4E5Ikqja/7aDqz3ymFHtBM9+QzphuEoV jUk/ClU1PmgLFG+9/9sqRirlQCxI+NUGRutvvBrLvnJuk4KPtaoU/dmTP58X+eCVf1+1ISzayWp
 LXCaV0vasdFs17daMtEG3gEda9r7tJuwb/W2mf23xM85pkV6x4FbDw+Cc+oVf4yAEGg6QT7jEPS PjSlZWSPfBlC8hbGlc1CITrELPY7OpGoGQ9JZzhTy2QSHCvJarMUxLfGyjGW0/ov5/b7zLnRToI 1RzarwWSmr99pAuo4sFzwb58/ZWFNHfhGDQp6wcvHWbW2O/M1nd4cyCk/7dqgdglzO2S4E75MIn
 8L2tbMd9mAAHgJQ+ainx5hPHZR1IjzWwAUSIoFKYqumQVzaOGCGGuymSzAvw4iQAIOisBtuO
X-Proofpoint-GUID: vhYFq-lzXbO6mGzF-4RqPemrKTXf3amf
X-Authority-Analysis: v=2.4 cv=dqjbC0g4 c=1 sm=1 tr=0 ts=6821f8a2 cx=c_pps a=TXs1g+7sIME2BPo3OSn30g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=-5LYVjoNHPMA:10 a=VwQbUJbxAAAA:8 a=SrsycIMJAAAA:8 a=yoqqhO14B4WZ-qjJOywA:9 a=wPNLvfGTeEIA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-ORIG-GUID: vhYFq-lzXbO6mGzF-4RqPemrKTXf3amf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Reason: orgsafe

Blaize BLZP1600 uses the custom silicon provided from
VeriSilicon to add GPIO support.
This interface is used to control signals on many other
peripherals, such as Ethernet, USB, SD and eMMC.

Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
---
Hi Arnd,

Could you please pick up this patch? Initial review happened here:
https://lore.kernel.org/all/20250327-kernel-upstreaming-add_gpio_support-v2=
-0-bbe51f8d66da@blaize.com/
The rest of the patches have already been accepted.

Kind regards,
Nikolaos Pasaloukos
---
 .../boot/dts/blaize/blaize-blzp1600-cb2.dts   | 36 +++++++++++++++++++
 .../boot/dts/blaize/blaize-blzp1600.dtsi      | 12 +++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts b/arch/arm6=
4/boot/dts/blaize/blaize-blzp1600-cb2.dts
index 7e3cef2ed352..fb5415eb347a 100644
--- a/arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts
+++ b/arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts
@@ -81,3 +81,39 @@ gpio_expander_m2: gpio@75 {
 				  "UART1_TO_RSP";	/* GPIO_15 */
 	};
 };
+
+&gpio0 {
+	status =3D "okay";
+	gpio-line-names =3D "PERST_N",		/* GPIO_0 */
+			  "LM96063_ALERT_N",	/* GPIO_1 */
+			  "INA3221_PV",		/* GPIO_2 */
+			  "INA3221_CRIT",	/* GPIO_3 */
+			  "INA3221_WARN",	/* GPIO_4 */
+			  "INA3221_TC",		/* GPIO_5 */
+			  "QSPI0_RST_N",	/* GPIO_6 */
+			  "LM96063_TCRIT_N",	/* GPIO_7 */
+			  "DSI_TCH_INT",	/* GPIO_8 */
+			  "DSI_RST",		/* GPIO_9 */
+			  "DSI_BL",		/* GPIO_10 */
+			  "DSI_INT",		/* GPIO_11 */
+			  "ETH_RST",		/* GPIO_12 */
+			  "CSI0_RST",		/* GPIO_13 */
+			  "CSI0_PWDN",		/* GPIO_14 */
+			  "CSI1_RST",		/* GPIO_15 */
+			  "CSI1_PWDN",		/* GPIO_16 */
+			  "CSI2_RST",		/* GPIO_17 */
+			  "CSI2_PWDN",		/* GPIO_18 */
+			  "CSI3_RST",		/* GPIO_19 */
+			  "CSI3_PWDN",		/* GPIO_20 */
+			  "ADAC_RST",		/* GPIO_21 */
+			  "SD_SW_VDD",		/* GPIO_22 */
+			  "SD_PON_VDD",		/* GPIO_23 */
+			  "GPIO_EXP_INT",	/* GPIO_24 */
+			  "BOARD_ID_0",		/* GPIO_25 */
+			  "SDIO1_SW_VDD",	/* GPIO_26 */
+			  "SDIO1_PON_VDD",	/* GPIO_27 */
+			  "SDIO2_SW_VDD",	/* GPIO_28 */
+			  "SDIO2_PON_VDD",	/* GPIO_29 */
+			  "BOARD_ID_1",		/* GPIO_30 */
+			  "BOARD_ID_2";		/* GPIO_31 */
+};
diff --git a/arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi b/arch/arm64/b=
oot/dts/blaize/blaize-blzp1600.dtsi
index 7d399e6a532f..5a6c882b2f57 100644
--- a/arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi
+++ b/arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi
@@ -120,6 +120,18 @@ gic: interrupt-controller@410000 {
 						 IRQ_TYPE_LEVEL_LOW)>;
 		};
=20
+		gpio0: gpio@4c0000 {
+			compatible =3D "blaize,blzp1600-gpio";
+			reg =3D <0x4c0000 0x1000>;
+			gpio-controller;
+			#gpio-cells =3D <2>;
+			ngpios =3D <32>;
+			interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells =3D <2>;
+			status =3D "disabled";
+		};
+
 		uart0: serial@4d0000 {
 			compatible =3D "ns16550a";
 			reg =3D <0x4d0000 0x1000>;
--=20
2.43.0

