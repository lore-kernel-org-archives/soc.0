Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16694C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 13:18:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B3BE239FD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 13:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B3BE239FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SEAZLyZe0LdQuFQROWhjwQ8LPZXLqGZpqeaS5L/ufdM=; b=iEsHSQuMiuWTnY0qVZw6BVvBY
	op6+Kdoz9m7yWJDEJoBsK1gA4ds2hxLYvpVCBhicJdqlPsX6URvmCMX7GweCQ0bGarjrvvTjIAO6t
	6MPLxVVpqLgAjoj3uhCyVCvr5UbrF8/0N0awYY8Tww69Ho3VNu7xnl1r3IBGBi6QQ3yGHwfjSZ543
	sWut5hxIdwZX9bmWG6ruUhRBRIiCZZxQBNwPrDNycY2B2/TZ/4cQfHGgwGWx2rg40+Jbz2+ZW3U5c
	nUgxPu9W/Hh/ZszKR/gF3SNxEp60M+zZYG6uJUiYTfkEWYYtYpLuMhZA02c2Ohm/Sja+O3B9NmIn8
	58Z1Y6Gkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2ZpU-0005M6-Hb; Thu, 21 Jan 2021 13:16:52 +0000
Received: from mail-mw2nam12on2085.outbound.protection.outlook.com
 ([40.107.244.85] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2ZpR-0005LR-Ta
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 13:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bz8u95dt58gqTHOSgHayp0CH/FWEKRMMfsWHn/v56H4tHMmvp7Dvz6sNL2OLbayjywPIcnYyjqv1VjA2GNqe5N50cN0o0pS+N325T6IfSegoFnu9nEPnuwZ8CTUnakabYQN2L47ce6TvZkZtnP1fBgQJiBQNcwT+TU6wqrovU80+L0DgVZwsTwHsBO5PWF+S6hYWpKY6cQlEeEpu7+ZrCzpJhVsFmTrJQFd9J8jiuhmtmh+D6yP+F5ch4t1AGhYkK4jVlR4GM/AUMx4WSnk4FS9Llza5mxRC8xBUjK2piGP3FmXcw2J42od7scVL8u9UojY+CTvQdx1Kpo3Zopjgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4iV8JlrChXVwJNcCPnJ3slBnEfdEFuAvc3z0g4cwaM=;
 b=LsFOG8XstqG+FNtolkda8EVlXDeOmTPowtMSdUivpPyRSEzZxepmSPPveqE77BFYlFk6b0aIHY6k+cW1zjat7qbeCj8O/ULlys/b0BAbNQD5s1upfXTR4tB5VKJUhgd3dS/m0SX7IquMmR9Rfj4Gv2mQXI2ViOCy7ZO/5c/3ZY+i3b7HCZgq5EjOD7qfPylzji1AN/DMRib8S0TxNtYYIOtt39D1LuYd0jeV8jtWR1zyT1sALynF7iDQU+ljkm6jFt8R8EZtD87qxjwHhBU+4L+KpsPtsCowy494c3yRyAJJLsR3lrK2iLC/nKH64iS+PbjdAXma8ZTUpwk728dpNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4iV8JlrChXVwJNcCPnJ3slBnEfdEFuAvc3z0g4cwaM=;
 b=Z/mv30mWdNXHitSxklq5eynbdBC+YQqQDpOlyjEij3diYuVtxEreq9lQAD9Zec8P55pBtv+A+iIobeX8k45A1OwFEiYk0oKx6t8L9pgUqjE/ISZMMEUQkm4v2lfzWw/TsAAyGi+oqc3wS6iY4U9ieU6L6v/MjubZo2o8Hc6byz0=
Received: from CY4PR03CA0021.namprd03.prod.outlook.com (2603:10b6:903:33::31)
 by CH2PR02MB6822.namprd02.prod.outlook.com (2603:10b6:610:a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 13:16:44 +0000
Received: from CY1NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::79) by CY4PR03CA0021.outlook.office365.com
 (2603:10b6:903:33::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Thu, 21 Jan 2021 13:16:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT024.mail.protection.outlook.com (10.152.74.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 13:16:44 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 21 Jan 2021 05:16:43 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 21 Jan 2021 05:16:43 -0800
Received: from [172.30.17.109] (port=33970)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1l2ZpL-0005T1-Ej; Thu, 21 Jan 2021 05:16:43 -0800
Subject: Re: [PATCH 0/3] add Ebang EBAZ4205 support
To: Michael Walle <michael@walle.cc>, Michal Simek <michal.simek@xilinx.com>
References: <20210120194033.26970-1-michael@walle.cc>
 <fff420d1-fc9a-23ce-0d07-58a3c6f10c4d@xilinx.com>
 <aa96fcaa362181d4b6fef9f1de0aa914@walle.cc>
 <0a1c6ebf-1d5b-4f06-56db-f04e87d2ae9a@xilinx.com>
 <bd86194a13882ce472764d0c91029e33@walle.cc>
 <8917c9a1-09e9-0a39-5732-da7f555ae9ad@xilinx.com>
 <df072e37bb6f3500d713be565cfa1328@walle.cc>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <cbfc4899-eb92-938a-95f2-23ca9485beaf@xilinx.com>
Date: Thu, 21 Jan 2021 14:16:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <df072e37bb6f3500d713be565cfa1328@walle.cc>
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c605587-92dc-48a9-593b-08d8be0ecc76
X-MS-TrafficTypeDiagnostic: CH2PR02MB6822:
X-Microsoft-Antispam-PRVS: <CH2PR02MB68225FF1E0499E7E055F2C23C6A10@CH2PR02MB6822.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w0ejWB0UxGQmDvvC45adH/vso9xDsSKzNutt0RMx877DGCXJ78BCDU6cVYvYjTve0B8e7EVoPQspMJjd763l7787d3aXePr0RnrFF6DfVWnl710ABEY6rqpNjvtV1qg3qxGDZLkpQIEVz01I1WoQTB1up+pjtcy71ajRdBa857xyAA0Tis+i70vOlKiT24tIOGreW0eXVnhiakZ+n03ZAl58PObLorXRkBdEFYtw9a9wjeop/Utuva96UPMmzReZ0onTMmtWLXP0op0ZZl5MojogNOyU57UyeW6Y9TAD52zn62rLhYhVrPh66izSuzOJzzuFx/KXzMfkVaTTvNJ+1vkRbseQmpnWN9LInEuESZ5plMBeXKINyqn0JE8NWHgYz/9eMWrQj+TyZjF62yPW4fgnfiFTiYZSUA+5pOiyd/p2FbJdpjiKdhFXOJiUso4+WjfplkXjAEcswmhV0N0iEYiIfk4dwz1nLTOsnZWPliIGv/IyHFV0iEt1dFnke+9IQ8sbNjbvRg87Ae5+93ZNqw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(4326008)(70586007)(9786002)(82310400003)(70206006)(82740400003)(110136005)(83380400001)(336012)(44832011)(31686004)(54906003)(2616005)(31696002)(36906005)(356005)(8936002)(186003)(478600001)(7636003)(53546011)(5660300002)(2906002)(8676002)(47076005)(316002)(36756003)(26005)(426003)(50156003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 13:16:44.1423 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c605587-92dc-48a9-593b-08d8be0ecc76
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6822
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_081649_982939_8F74B290 
X-CRM114-Status: GOOD (  23.00  )
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
Cc: devicetree@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121131640.DlN-3ZZ-2Nyt_GO2bdTEtMQLJkrLr8-cNcJokSIx2GE@z>



On 1/21/21 11:41 AM, Michael Walle wrote:
> Hi,
> 
> Am 2021-01-21 11:23, schrieb Michal Simek:
>>>> Back to your case. Board is cheap which is not all the time case for
>>>> any
>>>> xilinx board but you have only uart, sd and partially described
>>>> ethernet
>>>> which doesn't work without PL. Is it worth to have this described?
>>>
>>> I got your point. But it is at least a jump start for the users if that
>>> board boots out of the box. And yes, its unfortunate, that ethernet
>>> just works if the PL is configured. This is already done by the
>>> bootloader, because there I do have the same problem.
>>
>> Zynq/ZynqMP boards can use U-Boot SPL. "Advantage" of this solution
>> especially for Zynq is that in u-boot there is open a way for adding
>> ps7_init file which is determined by device tree name.
>> I think it would make sense to add these DTs and also ps7_init to U-Boot
>> project and wire it up with zynq_virt platform and then you can boot
>> Linux with using U-Boot's DT pointed by $fdtcontroladdr.
>> Then you will get support from scratch to be able to boot.
> 
> I already have patches for u-boot (using SPL). But my impression was
> that linux is the master for the device trees. Esp. if there are some
> problems with the board its often useful to have an in-tree device
> tree.
> 
> What is the difference between this board and the other zynq boards
> in the kernel?
> 
> In any case, please make this decision now: will you accept this
> device tree or not?

If you promise to regularly test it I am fine with it.

Thanks,
Michal

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
