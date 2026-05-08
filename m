Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023128.outbound.protection.outlook.com [52.101.127.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D1E3101A7
	for <soc@lists.linux.dev>; Fri,  8 May 2026 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237537; cv=fail; b=AQD3xLwXKACbnX905SLJsbbssFM+glmYQzqyLnRfBR9ztVN+2vNhJ07yYLVb1L/GoPhp4xPVKeHcnUU3J9MdoltE30XbuJbCiaGEk9oTMycSfp1zaoKP0jvgbWYUOIqjgJyubywRlxuKivGEhAOUwmqHUrK0LqPow8AaAacnN1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237537; c=relaxed/simple;
	bh=XYxMDar+iX9LZff+sCGW/lTHTk1oqF+Yuj2FVg9s04A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyS3Xru2A55LL16E3BqxF/GigPFI9sDjAXm3Q4j28yB2+bMshQY0hTP9wE2HRQ39tNPLf6jIQUW7skW4dQTfZYkezT/w2f555m7aKOIKs0V6bjQCIy0c4znZpDvZtjdtNGWE8xsN141P5Fsl5PpoqJqL2VUnD31vUVrxAl+Itng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wk+UaORXQbL0bl04UtxLxXQSBgIY6AAbK4lXKkoTQC0rBoEjT6z9ZM+Bug0y6zxuvB9yOiCWb1FKYEaT5+CkMJs/osD1BMoXJKH4Mx8R/u7fjxzSFf3OWN/48fjwemc0KTEmtS248xAiL/0YUEUn2QNW8l4YcxJ4Wq65gikUAERtHP6lYQ/a9EFvu0GjDx70PQlU0wzuR+wGyMqbtWSLqwQyNEy/+DibSuNdJPOeAMrwpFgjxpz3Ye3tK1hAaU99BZEZDHCniG8uta5sLy33PhyNzJA6YU2iq7PoLow/M/usxkD7MjZdIDcpLQ7lwPSpbC2VUtA+RobRwzxYFg2dkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vZmC+9SZKWHrjKici082v9uuZBZ70T5AKKG3EYriJ8=;
 b=pRxKee8lNQqQZGgoPqMj4NnOJwHeLUhzvihAphlbaCq8paFCm4sLrHDlpLDJdlOOYrNjYevavekDMZuJFrVI4KHLfCAxCFGawG7YwwVq9Dgk/DSh97gwEUgIE8t9zOegmUcp167/nocAqXFVXWcoSNaKliBC6CYfz3dH5jfbqALdH0doPU/wfdS6bAVauqe1K0Z3olN6zQCgqvho6UvtA49U0usnBoX7cHIYZeD71Ms/lYXJnXesVPV9lTFuPl+SDq4pIdUzb76jPilN7J/kW7s2SBpiAWmxNhrvT0Q8xh2SyJhOyAvKYuXlKJpZH5ZO3KmRP6cw5t/ipYss3BZLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0004.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::23) by
 SEZPR06MB7225.apcprd06.prod.outlook.com (2603:1096:101:231::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Fri, 8 May
 2026 10:52:10 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:4:140:cafe::40) by SI2P153CA0004.outlook.office365.com
 (2603:1096:4:140::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.5 via Frontend Transport; Fri, 8
 May 2026 10:52:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 10:52:09 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CF65B4126F80;
	Fri,  8 May 2026 18:52:08 +0800 (CST)
Date: Fri, 8 May 2026 18:52:07 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	soc@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: manual merge of the cix tree with the arm-soc tree
Message-ID: <af3AVz3CsHJM7jTf@nchen-desktop>
References: <eed505a9bd38a5fd015e2d18a57fdeb0@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eed505a9bd38a5fd015e2d18a57fdeb0@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|SEZPR06MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: f6569ed4-22a8-431f-f099-08deacefda95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TDUG5BURfBRKonAS9cDjhdPaYcW3dDJ+5arkbzCax3Z3YFSqu4ARENr3xlnltT4hMfzqX/wwHVOl06ITMizZ5Jb/V0d+B22nqcL6K2ADeHAGHP3rYVg8E7il61ZtkcvtFxCPVcJGhHshmzJsU7JRz5Qv2A+FQwnCQ+R4qS8PNnGzx/MKYSXw7kSqF0Eujt6TqgY+78q4+ZHEKa7JM5ij+gjiOWB20TfPMEFkL1rvnL1j0y6H+EA2G6yurZ6fdXrdV+YI4B4BcRVZp0Pqohs1c+U7PKnobPgcO7S+BucClR5LxbDKaZTvruCB2tfTAe9QIayA0X2GX26x7az4YsaJ+QQi3s1g/JXzwv7IfekM3mH65KwM05E5V18AyAVKELgKbvXQ60BvR3yTXwVhxqAoihDsL5JGF5B+WLUDwGfd65oZBaO7sqs2a8GsP/YgPTSHo1ul6dNgvI7dHRWgSzc35QoxH0Pk40OJ4IpansEzw/WKN6KnzHjl6JZyfBsRiMtRTRI5XaWib6RejOYSiAv6oPv7JFEJuZyQYkyAMz6FpdGzUDZ/K5NdtMdVi7qd0WM6H3tELKhobtP90Fu/hpFPXUCbqm8nJ631X59fkuvGNpYvkb1glX/wP0Qx1XJ9gj36HjDpBx5R0nBH2XwxvpjRNqBFnwRtbsQKSrcVisdnni1I/JPgckM0NCEDNN7p+hTjg7lmlOSLVNBr/OX50rqFvQRWJz1uJW+/a6gOhzenLHw=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V5avWxTKfVBV9kJq5M+fNrptJdTySYLIwYVNNGUi9bdH6bmyQ4+7RBuReeqs6ob4Dhu+Jm6gp1oltNrHfixI70KnOAWxSgV7UfIG/6OX1O2g7wJjagNZHiQxbS+lT3Zv/y/KCQJzQr/7bFoE5HUiz2ei5bhmbQzik1BX3KxD7DbHacyKQ74pzbL6j5DsMfu38h3fpj2ABefDbw1n/F/U+DrEDiZ2v9aK5yq2q7Zn+i3Kwf6GXjboIkdqr8FfJXF2dERdOWk5nPaCOt/pPYzW2ultHgi+Pfsrb6eyTI8wHlPn+qQGob5d51H60DIeCpASw23hTB0rfIlL8R/rLypxg5qC+t+dmbWAmdH3Zt5yRtX/0tZYL59VVa8PL6uBU+zc3SjXuLuxodCqbrWPNSXDh95XnVhy9D1T0sfibEPFriXiB9FuIDkplNTsxaye7lL7
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 10:52:09.5565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6569ed4-22a8-431f-f099-08deacefda95
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7225

On 26-05-08 11:12:23, Thierry Reding wrote:
> Today's linux-next merge of the cix tree got a conflict in:
> 
>   arch/arm64/configs/defconfig
> 
> between commit:
> 
>   f54f7979ff88 ("arm64: defconfig: Move entries to match savedefconfig")
> 
> from the arm-soc trees and commit:
> 
>   f4f1e3bdb5f9 ("arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe host, and Cadence GPIO")
> 
> from the cix tree.
> 
> It looks like the patch from the cix tree somehow partially landed in
> the arm-soc tree, even though it wasn't pulled yet.

Hi Thierry,

Sorry for about it.

The above CIX things defconfig changes have reviewed near to Arm64 v7.1-rc1
merge window close, so I have not sent pull-request for it, and it left
at cix's for-next tree. These two days, I rebased cix's for-next tree to
v7.1-rc2, and this patch is on top of it.

Arnd, I deleted this patch at CIX next-tree. Would you please help queue it
in your soc/defconfig:

https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/
branch: cix/defconfig

Thanks,
Peter

> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 094bb9cd8764..e5f1901ee408 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -701,6 +701,7 @@ CONFIG_PINCTRL_SM8550_LPASS_LPI=m
>  CONFIG_PINCTRL_SM8650_LPASS_LPI=m
>  CONFIG_PINCTRL_SOPHGO_SG2000=y
>  CONFIG_GPIO_ALTERA=m
> +CONFIG_GPIO_CADENCE=m
>  CONFIG_GPIO_DAVINCI=y
>  CONFIG_GPIO_DWAPB=y
>  CONFIG_GPIO_MB86S7X=y

-- 

Best regards,
Peter
