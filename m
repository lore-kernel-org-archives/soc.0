Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568F9C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 09:27:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB14C2395A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 09:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB14C2395A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RpvtV10+o9W2tapkdycrnRvT5z84EpTNnkP5HyvOfuQ=; b=bLWoTxabrqRFnIYczX82IHqG/
	XWnvjyclUzzZtzDOBr5zQtX9QgULp6Iwf3tOspMUCkhPlTUfyRWaq8o6imXg7+2VoxMbHxdGAl6w4
	6adr4iKnoqpk1A51cY/XmSBNhEuMe+N5j26fb4clRq1cGYdPxH1uvHKeSQYtoISpT7Vmo3XaCGFWM
	jCsWprg1rSW27zkZNa4UulgB3DwcDikbavFU8Z/VkRW9ngvlMIAIMVye2V+Sx/DDcWACCLImbKblU
	zcQaPfwZc7UU/6F33S/IG0ygjAs2Yhh59FMkLBbPC9jmd8ocxY62jWGhFaSh9NIjbQckg18UEUQcc
	J9xsT8I6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2WED-00061c-JV; Thu, 21 Jan 2021 09:26:09 +0000
Received: from mail-bn8nam12on2052.outbound.protection.outlook.com
 ([40.107.237.52] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2WEB-00061E-8J
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 09:26:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kg4QNJNRH6AZKn3MtMBxN6uY+jJC49XBaFOAcA3h5+aCJBtFXgDAlLiFPp6RMSwoGZ5hJJQh4pUNt/VLORzoMxuIXdWGHJR7/dQfqfuf4ejSJcTTd3FoA4hnMIRUkDYRGjm+bgCQ0e33W5Hr1B+323MnKIi7OB6+mnTbZ0HNQMscoDjTH2SWBjPxcTwOuSNMFjvvyijFLHJuAMvqOStiP3MjpARto3e6VS1wDFn4GzWooBmfdJi3B2AF4sgeTVsGEdv1sl6ALFXDzuHCGj6shM4/oeIS3fnB3kVkXxG96Qo8fr9QLTsuj4Hewjc5xmvCUExTZDy1ztLdTD6kOQsxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQ3Gg+3Zn7mYCMiSxlvE6gso6Eeb6ZCM/zCkVKOW0Y8=;
 b=k2GTdH6Mc7cfLkLZWq1zNgik0Uexuv0kI+50FgcmGqLAqMcHzzj4Esepl+9WbEWco+Ww95Q09xuKqbvl5JR/o3KGICT60R6s4ZftT48nE+gvZMKDReY1ZjyqESdcKitESanmpp3ZM4wyR+VbQaeQNAkuTmsrfmvthRbpSrUJFmv4ckTGyd6EhonQ6fFpP9oLtYX3W3lCiHC91bF3yPiku/zRagdFWFpUX5401Get5cY5uexC93SQWt1ldR59SC/40xSlRIzeoCofFjTZXvYv2C12lvfR37bPgyViCATjsCDkPQqLD4WE4dcgi/lSk9r1aNQs+jc3Ww8eG2vGdqClhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQ3Gg+3Zn7mYCMiSxlvE6gso6Eeb6ZCM/zCkVKOW0Y8=;
 b=SwPWxKWrKOMoL2lAz1YgQjnkngqMuJJfT68cegFRAleqxTQm+vgXVZerlmhQNZT0lv0mS1B8IXDw3IqAvDmIEZ8iS14LxXUJltWbbne7/lCIMulRPSyYa1c0hT9qmSKkSq0Rp4ejEoMDqkXizotVlaWTbrztxSZy7kd2r69a+CU=
Received: from DM6PR08CA0016.namprd08.prod.outlook.com (2603:10b6:5:80::29) by
 SJ0PR02MB7472.namprd02.prod.outlook.com (2603:10b6:a03:29d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 21 Jan
 2021 09:26:04 +0000
Received: from CY1NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::78) by DM6PR08CA0016.outlook.office365.com
 (2603:10b6:5:80::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Thu, 21 Jan 2021 09:26:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT060.mail.protection.outlook.com (10.152.74.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 09:26:03 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 21 Jan 2021 01:26:03 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 21 Jan 2021 01:26:03 -0800
Received: from [172.30.17.109] (port=42074)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1l2WE6-0002OZ-SM; Thu, 21 Jan 2021 01:26:03 -0800
To: Michael Walle <michael@walle.cc>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210120194033.26970-1-michael@walle.cc>
From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 0/3] add Ebang EBAZ4205 support
Message-ID: <fff420d1-fc9a-23ce-0d07-58a3c6f10c4d@xilinx.com>
Date: Thu, 21 Jan 2021 10:25:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120194033.26970-1-michael@walle.cc>
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f52d5e02-6271-4036-c2c9-08d8bdee930a
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7472:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB7472AFF50948F47461AB390EC6A10@SJ0PR02MB7472.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0oMKDQ9Uxa8T/TysGswLKfrmWWbmyduxicZk6xOkHpaOiVb6GG4RQgpLhp6TOhigrTdLAbJeEqP1dnyFGvsQBFBSANfB8Is4yzqcW05kdz7NERT8HrTIx1nrLVCa9liXsXDm2JNvwB5H6MtkekazQWcdvJEgxuC3CWqt3MuQDYgzf6/NshuKKL1MHmuGoGb6JJ9aKHr97DG0lxgSJHS6XM4NuThcICOCXpk+a6lXNeBPMVlttTb8vl4hQO23DV6bWPv1okxHucu29U4HaBnHr7rJ/f0wdz+e4K6q0ygZUOaTSf5aX5Q5ZIRryBX8AleWz5Rc6879xHty+Hj4eL/6x0+wGpwhcH/3TxBzdoMTRDKq5BQl1g+4v7mVjwj8kOQAttn7EC/zsaNDhKI9m+z+SgZ95Zs55Y/J5lbBwRfKph9X1XSmDZwr7TGAynXkUgKrYN221JYrKim10DQ0NMFMN46I4s2VF4xYmEjkFxcP5Q98TpH88w5z5dVqVRga2uuv3lGG/JLw3elFGhLj0kFvA3ywGQzAq4CFYOvUzfuKiUU=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966006)(478600001)(82740400003)(426003)(44832011)(53546011)(36756003)(7636003)(70206006)(336012)(66574015)(4744005)(6666004)(9786002)(356005)(31696002)(31686004)(8676002)(83380400001)(8936002)(2616005)(70586007)(5660300002)(2906002)(82310400003)(316002)(54906003)(26005)(47076005)(4326008)(110136005)(186003)(50156003)(2101003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 09:26:03.9107 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f52d5e02-6271-4036-c2c9-08d8bdee930a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7472
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_042607_301343_5329BE89 
X-CRM114-Status: GOOD (  16.99  )
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
Cc: Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121092559.6Jt3ciBQJeDvEu2uAbCRnJFz-Q96TPozTIKQb4pW2Vo@z>

Hi

On 1/20/21 8:40 PM, Michael Walle wrote:
> Add support for the Ebang EBAZ4205 board. This board was once used as a
> control board for a bitcoin mining device. Nowawdays it is sold as a cheap
> Zynq-7000 eval board.
> 
> Michael Walle (3):
>   dt-bindings: add ebang vendor prefix
>   dt-bindings: arm: add Ebang EBAZ4205 board
>   ARM: dts: add Ebang EBAZ4205 device tree
> 
>  .../devicetree/bindings/arm/xilinx.yaml       |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/zynq-ebaz4205.dts           | 109 ++++++++++++++++++
>  4 files changed, 113 insertions(+)
>  create mode 100644 arch/arm/boot/dts/zynq-ebaz4205.dts
> 

any link with schematics?

I will let dt guys to comment 1/3 but series look good to me.
The board doesn't look interesting from description point of view that's
why all the time thinking if makes sense to add it to kernel.

Thanks,
Michal


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
