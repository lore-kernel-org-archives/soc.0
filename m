Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022098.outbound.protection.outlook.com [40.107.75.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EDA39FCE
	for <soc@lists.linux.dev>; Sat,  9 May 2026 01:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778289380; cv=fail; b=P0TQ64PWOrXNg2adGcHcMI6JxB4OqWnTO8xNGd9N0WOTKAZ8tnYjjdpmFrXRgYbUzfk2A5FHMHF52sSh5feg8uxgik2n2vzSR23StxuQMnc0Y8UaF3ERJXWd9WRf/VeAh/pg8H9kuSxELdrORflSZI7+sNLMy3QnpiV8eLVoAeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778289380; c=relaxed/simple;
	bh=Rm0LlE2V1xS3h2CzRblpRFYpOCBQrjnHyodKKoLEa5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=admzAhy6XbosJstWXShnosAytgb/rDYQ49w15K/uFeqNX/K0esvtW2wc3BXlFkdn+gF1xkYYsf4lcb7CZ4nPNQzUMVo83YZd1tlZVbgZcfXqJ8FhCefG4IIdRcVdA0xVbIwzZPIBY5p0v58DWTEeCf7+/lKzTrKHGlFnnVjKTjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ci70RXI0l8+bmUnl7YjdlNSl/2PtRovKw2C7An4c60chojNkL+MLYMJvXTm6vKXmn60o7HZgEoMG2uJ5xvyT4us/qbI/c0AWfgP4ZT9CECG7kjvY1YXAiQxlqazG+md4en55QsG5PeqaZbZNqgC4TxAxrViw23rwsOvE19hSCao4OvXYR4N0K7fxWg6UyemcOvQ4PCz/WLQm3EukIVK9DOvWAfh1cMMHaCFSoo+8xTIoNCOQ0x/Y8+5tBSDDhgcpDr68mdlYqHcamUtNgvNXYuj+x65VbNKVicZpVRsaLOZf4ZaKKKq5QpzPa2LZbRggrfG+rQfUno7JJwcAxCG/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozQdK9vVIWkTZbc1DjZPnCPP4nm6s/dh7F76c1HMc4c=;
 b=FI1Gs1IST36D2q7i3+P04jUGKGaP5GxMId8RCSWJado0AKlAs64WjIVxT0lW+P+IPPZiDACIaGYkcrc0L1Sny5XjS1TmC+J6ZE1j4+2+yU7+diS07o1Y10jgzvP3zuHb5oKyUJVyGCvEQEpZeh3A0wrmvoo9pgsdxsfTp/JvjjQJUOzK2HimpeN1xGkc5ZI6VHMny1ZMlvOEygUZoRlkJIhkWIwr/flQVChMLdVTKp5zo2sGhbMX9aVKU3HXPC/z8M7maADlsy0fFidHERTiTKLtDTn8O0uuSHVjOii3E3JiWkYxwy8qYcwM1BBaPlbayKhz8Zo+kwZHHdG2BQR0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR04CA0010.apcprd04.prod.outlook.com (2603:1096:4:197::11)
 by KUXPR06MB8293.apcprd06.prod.outlook.com (2603:1096:d10:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 01:16:14 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:4:197:cafe::b8) by SI2PR04CA0010.outlook.office365.com
 (2603:1096:4:197::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Sat,
 9 May 2026 01:16:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Sat, 9 May 2026 01:16:13 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D626940A5A01;
	Sat,  9 May 2026 09:16:12 +0800 (CST)
Date: Sat, 9 May 2026 09:16:11 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	soc@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-next <linux-next@vger.kernel.org>
Subject: Re: manual merge of the cix tree with the arm-soc tree
Message-ID: <af6K2w5uxcrbs3dR@nchen-desktop>
References: <eed505a9bd38a5fd015e2d18a57fdeb0@kernel.org>
 <af3AVz3CsHJM7jTf@nchen-desktop>
 <a6925bf5-2ffe-45de-9ea8-90240a2abfa3@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a6925bf5-2ffe-45de-9ea8-90240a2abfa3@app.fastmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|KUXPR06MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: f92dd10a-5c87-430b-4092-08dead688fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4PJqzsCvXe2UWwKTgUJ613fDltnz8ZqIN/iqJdt96zmmEUXA4sCoUz0gAagJrcXkLilbxCmAy+BNWbH2YxoNnYvVcJNN8Nys2bRRK6VGmCTHwi3BCd/xnxx/PZNrm0lHxAy2Is2jdY6MON1XT+V2pRbsn+GEHPNTxPPAdVBYP62gRVoAsqTV39q0y2WciK5z+g9PT2+PAlCFaWuBD4PP08f3aSfKR3kTMcfA0debB3k+wVcOAxgsH2xG6gsVj2rWNbVcewv2LTR41I9WLY3wOUWlPqu81KcJU8E3v9SiqYGp3CRjDUjiEQmvL5rKVW/7anN4OHVBUJjTypx42HvhF3yALfIHMf7ac0+HBwNuAB929owo+lGMwJg0C4Gta/hDLtg07XZJ54BI3Chv0rJZLJ5+h6q+DyP1+waUn2fqwPSChqLGjgcAd0GQJ3BuqFHUE/ch03CUQOzcecYW6h8/w0HJm3owLKN0FQnWDgj9D/sGL1a/10Fmj5lsDR2juyjwB9diOpvobNXXsNuREJ1Elhtzvalmm+St6THQ0YUxXXyfCItlnqFm2b6Lx1o2rpv1kAwy+GsAapuFo46EGMe6bobKFhOB2EBPvfgU7kzkAp2/xB/OBpr+/COKmgyj6xkodixwLYRIbMw2z1Qs042jjcOV5c1uPF7J74z4PPhpxHr7BkHrbper+kDjobKyS0xkt4KGlO5ohPuTHpZKTgzQ0fl1bkhSbTZ2ruK+8P55iDM=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dLr9ooJxzYEv8NLDANbr3HkHX8KkkPU1fP0rs6L5RCXj3zO/lEK+mFQ1a0MbZVik3lVyemaouRBf5+zzZbWoAtqsM7C8xnqEBCILzgQxC3VxWL9yOC2s8bMifFBErij3G+vh+FZZcKBH/l/EGt3WB/hLFVK2r1uo/yyoqnB2fBAPLu+AsAeRcx0okMopKW2dS4pTS7faqJeWDkxtAEzD4fzNpw4RiGNFvJirgxR6h9SYi41oyEx26d6S/X5AWuCdcgw0xB4V+dbNuz/ak/p1VZ0TaqbVJz2q3O3FPr5WiWvcW49qWMTPluERN0Kp/RGhobSPVBUOkLmXXnz2ST7Nv1bLvKYUcfCu/KRtko0upepjfUAaQHH3r0bGRkL0YFoRqNut9zWcCsdzh4/hUcMiRE7q9NsbmdAwgBPadXS6AWp2Xuh9BlNUsrEnSMdAi+dj
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 01:16:13.4416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f92dd10a-5c87-430b-4092-08dead688fee
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8293

On 26-05-08 13:06:02, Arnd Bergmann wrote:
> 
> Hi Peter,
> 
> this is not a problem you caused, just something to be aware of
> when you send the pull request, and to check that Thierry made
> the right choice in resolving it.
> 
> > Arnd, I deleted this patch at CIX next-tree. Would you please help queue it
> > in your soc/defconfig:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/
> > branch: cix/defconfig
> 
> Please send it as a normal pull request or patch to soc@lists.linux.dev
> so your change gets mered using the patchwork process.
> 
> If you send it as a standalone patch, please make sure it applies
> on top of the soc/defconfig branch. A pull request is also fine,
> and that would normally be based on -rc1. Obviously this causes
> a merge conflict, which we will resolve during the merge.
> 

Hi Arnd,

Thanks for explaining it. So, for linux-next merge confliction patch,
how to handle it better?
Option 1:
Send pull-request to SoC maintainer once linux-next merge conflict happens, and
depends on SoC maintainer's tree at linux-next for testing
Option 2:
Rebase on SoC maintainer's tree, and still keep patches on SoC submaintainer's tree
at linux-next for testing
Other options?

-- 

Best regards,
Peter
