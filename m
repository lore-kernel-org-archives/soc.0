Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010015.outbound.protection.outlook.com [52.101.201.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EE527144B
	for <soc@lists.linux.dev>; Mon,  6 Apr 2026 06:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775457222; cv=fail; b=njgX/57gPmNcUXGF2hJbtLdxoIUaNchkSa6W2dpyTjTXNwArQMwGLiWnzyPPI9Yj3w6emJ2Ry0JHzKUCGL+gwRPIDd+qgnpxbZUY1//HalJrdY6aaj1tC+Oe7cdF7VjVBwXJ/5disStMhaUoafc1DmeEH5VNkbjnuwBNQ17kjCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775457222; c=relaxed/simple;
	bh=41MtF/83DG1Uj4hcxCWH1RavUtFHeH3itwwVvTZ11uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I7YiETBw03FvEsmkM/EQZXBfcrOy6egr3QdCZWxuMYlBIqh6KjmQebxqT3R1EIeJG3m1UAi+mX2eOIDTSOmWg5vFAne/EJpKT1XTjV36u9HJcZMT+bUy5RPH+YVAvlNUvPLnsOgDptUPPRd5muNQvtOq7L/eX59DJGtrD1Qu7RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wRdFAONv; arc=fail smtp.client-ip=52.101.201.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wRdFAONv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqF51v9hyxuS9AMU/MxL9eKFZcWa0m93EGsF4dl8z8IDwezmGrCHSSHWTzWiNUitlrx8fCbscbdEgxAJNPIPZ+Q+StUsUxBwFA6D1NKuvezsIIycwCTIeFKeG0/tpDSdJjpov7AAHNt/pShA5mnaZ0n6FpGJWCxAROrpQoiT5BQd2PySiKa2WtsOxlYWN+CEPlo4tv8Xip8KgaHf5F484zHwZ/fylwgIyXHktnqjxa/ZPaaTAzVUTCeWqsRuGgIUXmug+l4NJxPQM5Nl2nUJVUcVHYGxCPJwyWB80GEdaO6rosxtC7qawsyP7BOIHvayEN7X8rMCF0esXn4CNPct6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6kdWCFQGhso/9sCzQu2HJHKfgv2F+U+QjFNPPaouJs=;
 b=onS5F3dpGKFAbEUep9zFWoUl2OffqNVkPtV3TeNjlOW6O4bsi5Q32jOow5wMBIvRXgykLkSoS1YOCxPZzOlxSkEnsJhggFfiA5kdu9q+RvnP3jlR/e/uKmGxq9PxHFwgEiDPW8leun7pbshnBwKLlOnGeuaNmRe8ABgp8gHlfYYZ4BzC/mo1Wwa4cRMnnwD81PR5gFY41O2QVfKdHprNqhMR8E5NMpjHAlkUubImeQTI4p28r14vaX3h1TItWew9nRbm4k3PzaZBBUO1YwP2XdM4OZYoyPkwufjKIPVIDTk3HuSlr3tVQ6w0hyI4HiGNRpQMGp3XBLckrZ1CXGar+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6kdWCFQGhso/9sCzQu2HJHKfgv2F+U+QjFNPPaouJs=;
 b=wRdFAONvxV5jHtz2nlp5lXJNHEkmSpc+/P4pXI6xsQbeymbHCerTTr5LmSanAn9oOGSq32HLEYtnccjgHJXTavUPnV2Qd7sDAwIy/UQgscJt/qqrBKQPnb+matWUmQvhMIzfMkzV6uxt3utOCdHV14JkPIzHHugWS9HmqsCtI2M=
Received: from DM5PR07CA0119.namprd07.prod.outlook.com (2603:10b6:4:ae::48) by
 IA4PR10MB8612.namprd10.prod.outlook.com (2603:10b6:208:55d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 6 Apr
 2026 06:33:38 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::c6) by DM5PR07CA0119.outlook.office365.com
 (2603:10b6:4:ae::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Mon,
 6 Apr 2026 06:33:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 6 Apr 2026 06:33:37 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 01:33:32 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 01:33:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Apr 2026 01:33:32 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6366XTJe243894;
	Mon, 6 Apr 2026 01:33:30 -0500
Message-ID: <f70d16ec-f472-4b96-94d0-43eb4acffff8@ti.com>
Date: Mon, 6 Apr 2026 12:03:28 +0530
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: K3 updates for v7.1
To: Arnd Bergmann <arnd@arndb.de>, SoC <soc@kernel.org>, arm <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Tero Kristo <kristo@kernel.org>, "Nishanth
 Menon" <nm@ti.com>
References: <e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com>
 <1ed625c0-e977-42d4-85f0-91e90a4c3547@app.fastmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <1ed625c0-e977-42d4-85f0-91e90a4c3547@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|IA4PR10MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe5e0ea-24cf-4061-0827-08de93a66f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xiZ39vWuiupUPkN56WFVNyrDO0wLh2iQ8vPqK3wY1J0mPrmmXzIWaaoQt+mOQ3s6K8n8XIrM2qv8FV8SaDk/p1kwDwxVPVPuYqNAoDo/KWJwonHwsQEhw/VF5+Cp6CPop1CMWwvAqgAW0+SBRpJOeciOxBUY/xteLPZZ/45hkYZnu9N7jTcqlIvGreYnJIcK49BJMAZxq65vvi6y0Pu29nYUIj/PoaNYiv0TUgKElZZPJaAuKo+ZmokwPECI4cF2MjBJBGmlm0cbwwqsy5tj2x/1bJ64PpfxXyJF9kXUUG8P3Y5nmOrWNE2bp00zSmMSYBeKn0uuKNcH/+0MGit47LAlfpMdvST7+qlhz+LqRzWxEQx5bizgSn3PoNTLxtUhutdOorXsp80cQhaSv5jbAjamoWwX909ODSg8ktcO9HHSorQbrCRIbJvxXG61V1eG/trFN9bHJMK/ywkOYQ9iPN1Axz3Q1qp1Yt+d/wRBtC28mpWa0NWyawJ6HVXFIw06S3PwRDsTKXn2C/4vYS8tYZU89hcUVHUPa95OM5RYY8e+4Icu+pW4Xvlf2u2FmR0sMkzZquoIvl1WzjWq/JZxs8XaOAGjtxge3w1rx99K38buwDQpxwCj+PHAcqqHnOrylEM768dhvugHMAysck8kbOPJSlvLNPvmd1D+wEHS9zcgLBk12O7Y9nD0jjIZvXHhy5WQhI9NQeFPMC9p8HnW5swq7aITGj8CUcEO3DDWVaTktGpD+6CNaGjbx6b80R1/s/gMlmz4nLYNmnGUT4w8pw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oJJOHH80HZykyO/qNHCUq0Aw++854nveBxeytEHZZb6glCOD++XSY7dd1mpxxzo6/5GnGoEKy2z2W8A0MRiS4db/pt/A3qixeycdr5RM5WEDas+n4eHSd4mX37HR3jDjMoDkew9cuP9bi9ECu/2Da9Bto0Y5s+kGzofmZkTmddboX+tt19uVuhsSXpXY82NvxgwWxhpQbrGDlCKjZPW4au5cuv/LERs9YzZ3yzd4qufXBEXneL6l/YZIUZjUlEW/hcJw7OXZ2561J0g9tDSOJYGP4DSvuvRcUMlWR3WzzYyMnTek3f6Tg4QeKZ8dL6HgOL6XyUDqAm2HOwAEiTeDjQQrLP3jqCp6DSo7Jvg8hzFnLoVxjcjPb9WoNhj9UQSpmcxZNq8ClDcGFrQfdfdXdnDmzUSIBdG5V0aOfwvyaDa5Zppc51C6dfVIZaLSLSo8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 06:33:37.4739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe5e0ea-24cf-4061-0827-08de93a66f63
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8612

Hi Arnd,

On 03/04/26 03:30, Arnd Bergmann wrote:
> On Wed, Apr 1, 2026, at 19:14, Vignesh Raghavendra wrote:
> 
> Hi Vignesh,
> 
> I've merged this now, but I see that there are a number of
> patches that look like they should have been part of an
> earlier pull request for 7.0 and possibly backports:
> 
>> Generic Fixes/Cleanups:
>> - ti,min-output-impedance addition to all K3 board DT files
>>
>> AM69 Aquila:
>> - Fix DP regulator enable GPIO
>>
>> AM62A7-SK:
>> - Fix pin name in comment from M19 to N22
>>
>> AM62L3 EVM:
>> - Disable MMC1 internal pulls on data pins
>>
>> AM62P:
>> - SK: Disable MMC1 internal pulls on data pins and enable Main UART
> 
> Can you have a look to see if my intuition is right on these
> ones, and make sure they get merged more quickly in the future?
> 

Ah yes. These are non urgent fixes in terms of impact on functionality
(except AM69 Aquila one perhaps), so decided to club them into the v7.1.
But, will keep in mind to send them earlier next time. Thanks!



-- 
Regards
Vignesh
https://ti.com/opensource

