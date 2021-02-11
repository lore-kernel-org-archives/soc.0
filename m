Return-Path: <SRS0=xpWt=HN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C71FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:09:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E69F364F46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E69F364F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lX0rCWltM/kNsXhe5d2/EHItjuM3lTvrihr+16nLi4g=; b=lhnQ79iD9XGgGqJfP5rAsui+p
	ImayfdCeQ7UubrZASLehMvdbNoPkFF2d3U+kwG4F92F90pX7EMvkDMirdRGYrpUlCEI1fKsTGGOAi
	cYiVDP6QXMUFwhYhFmm89nh/ldq5S6YEjwsM92mj52m/ga3DIQLFGd29LQTyb9BZ/fyYC8CWtqujn
	MSslqHiBGaX6UFb5R+G8miG8/YkNtfVoZxagBpaB7xzFRMm6Mccv48Rb2FWBF3QSPI9vLBDtUesFI
	K2nEcYznJpevvrpSt+gknBc1WxIQvFx4X/JQOoQiXTzKnL5vdHA9aWhyAR0vI0OscjIyYDsr1fKjm
	6PKhQF45Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lADZb-0006sX-Ru; Thu, 11 Feb 2021 15:08:03 +0000
Received: from mail-bn8nam12on2075.outbound.protection.outlook.com
 ([40.107.237.75] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lADZZ-0006r9-2v
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Feb 2021 15:08:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIFy8xbHUywOHzIWOcbYh5oYvBuYTJa/GvPlCcDbE3VTZYNWRqer6jA0celYeaFuUMJX6MFrymWvkIhla9vRR3y3kwjiKSeSPPtwhbw7MiSiqNnDAUP3t/M/05y6YsQ1b2F4Bl1pVDVuEm1nyxX4NumUk7U2l2iZLp+YVD+v+SehyhVavoivxgpsB0fe1YodgRR/5AQSghdXkh2fzJ5NAMz2jpTTB6nL/IYnkLor/G0cOixCXUEW4TBdieyn686aOFEKj/PppxhASbNLh5jmwg1qPENyN/wWyv8cTJWfI/ozYnw46eUJ1rt7uIzqkZfhju16ggXCIPEfG+a8bg2//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8bDMvh1Q8Qgn9ap2Twm31uBNrulCPTbVeGQez1vv+Y=;
 b=TmtZbI301OlGqpdWUP+XYFP0c16+ZIbD8E6T3duHKNpu4AOcxnXgLEHou81YgR8cwC4isQCv01jj98uJ9KqeS3M2o7/9vWSR2jqWXTS2ucCGrfQxNbsnUX+zCzOjgXNFJLDcHCkIR0YTNsrVobSBBziEsUrHdU4XG1i0/1YuWmkfD/B4U9BeoGWI0RnsiQUuK90p2faZhB50HOgLz5RXKUGuLEPMnbMDr0h+MA4jJWxvWhN9BOdrbA4UFdEOldtFogVdgtK2hiVmiH96so4YvtX3gpnQ2Tj4o+kbIncC46tnipQbYGQl7jQ0IZFZDBR0PWkrApSKiEQAixLItA568A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8bDMvh1Q8Qgn9ap2Twm31uBNrulCPTbVeGQez1vv+Y=;
 b=jbNVBx6kzzErlstPvF1Z1M4STJGdQWqM32Ck9iIs/wyXr7CoQWCG8qheebXBUpGQUhFYQVtEgznvBYAPpgA5pZwdmOxd9NDmnav86MX5IA5l4FroN9sE4LU21+ov+lk3PzyrCOeDJwKcAvjcBqFoD+hjdWyPDczcLBWYG0Mlyxg=
Received: from MN2PR15CA0060.namprd15.prod.outlook.com (2603:10b6:208:237::29)
 by PH0PR02MB7733.namprd02.prod.outlook.com (2603:10b6:510:4c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 11 Feb
 2021 15:07:57 +0000
Received: from BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:237:cafe::90) by MN2PR15CA0060.outlook.office365.com
 (2603:10b6:208:237::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 15:07:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT009.mail.protection.outlook.com (10.152.77.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 15:07:57 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 07:07:56 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 07:07:56 -0800
Received: from [172.30.17.109] (port=33286)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1lADZT-0007oR-82; Thu, 11 Feb 2021 07:07:56 -0800
Subject: Re: [GIT PULL v2] ARM: dts zynq: Xilinx DT changes for v5.12
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, SoC Team <soc@kernel.org>, Michal Simek
 <michal.simek@xilinx.com>
References: <19e0e0c9-1bed-bba5-6c80-6903937b3d96@xilinx.com>
 <161305573925.259289.17212813544897085950.b4-ty@arndb.de>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <bd383faf-b615-329b-1357-1d1f2ef1f9d1@xilinx.com>
Date: Thu, 11 Feb 2021 16:07:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161305573925.259289.17212813544897085950.b4-ty@arndb.de>
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e9a50c6-c3fe-4f67-1a67-08d8ce9ed08a
X-MS-TrafficTypeDiagnostic: PH0PR02MB7733:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7733EA03249B8F32265606B4C68C9@PH0PR02MB7733.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c987qKVeE9YN2Fa0QHBb8zrTnI9dot/6IapCOhvqaDrQLAOM36/M+7fRHdQFG+nKjM9REaVDdYcmap1U/x46gePGIpAxkLL0A4F1NOBbW/jr4TUPwTtxOdr20x15mbhbHgSiJJjxes1adQnf0nnF9gpLqlSLeYRVppdKUNScaZ3AuF1DYoJPNzLhU1Wl4XAHVVjyc0LqiV/cGIdgLFZTT0xDMA3c5sYC1WEXj40dqG1ztxq8Uz4gFnW5SqkTnPCE3HHtesOUD+DwYNeMM5IrqECe9XvHYN4ZodBXqYNSQFXSfx/oUv2ghNXZxcEp5Z4PhyylIPGWtQPKhTYLkqT0itgESMgkkAiOaW8g3V2nxuTymVxTX149sGP5vGIdL3585V703BYk7GV6jjJmlOh6ntBJnrpUmh1Q3nYmUhRy8RNjXMMRFyc28pM2kAcoNbAGcMdSy227D5XUUTaunl371xtRjkK8fjYZoxwpSwFqlPbRu0jXuSahrhFBmmpo1jFHQaiiopav2x+p24KgdBB03GxFoQjIvr3HIDmhorrrEPTUzyC350F1ab3QT8iGpewln7IUz+AuNuA7QV1NRUjTaULv2BVu/KAi2+d3tjwUr8ZU7h7JCGiVE3I6ebnOgzSLAekG44yQljvSG8x5MTcAviX3sC+q3HgAj2R/qUcxdXW2Yp4YEAMnGV5PnEvJmpbUCM9Vestp6QSdgE42+yZr6OlgnyhSbQy4rYC46An/lm3l7zYPrD0XhyvBvlAG9yD7wCiV/ozf/Ikko8HwlxJvkgkrtTp1hiLZvHYbt8xb4FA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(36840700001)(46966006)(6666004)(5660300002)(44832011)(316002)(70206006)(70586007)(83380400001)(36756003)(53546011)(47076005)(31686004)(478600001)(82740400003)(110136005)(36906005)(8936002)(8676002)(186003)(356005)(966005)(82310400003)(426003)(36860700001)(31696002)(4326008)(336012)(4744005)(26005)(54906003)(9786002)(2616005)(2906002)(7636003)(50156003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 15:07:57.0362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9a50c6-c3fe-4f67-1a67-08d8ce9ed08a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_100801_201716_5215D677 
X-CRM114-Status: GOOD (  13.87  )
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
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210211150752.TLLL8xbkhqAYHaDCpVgTrdRsf-P-PHtnQnm1aJaTCas@z>

Hi,

On 2/11/21 4:04 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Thu, 11 Feb 2021 12:33:01 +0100, Michal Simek wrote:
>> please pull the following DT changes to your tree. The major part is
>> adding one new board and qspi dt binding conversion.
>> I have dropped one patch based on communication with Arnd.
>>
>> Thanks,
>> Michal
>>
>> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
>>
>> [...]
> 
> Merged into arm/dt, thanks!
> 
> merge commit: 78155527283ddb04bb4a5b78320c861e1035d357

I see that you have there toshiba/dt-2 which is my v1 pull request.
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/
Maybe better to clean it up.

Thanks,
Michal



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
