Return-Path: <SRS0=3d55=G5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B801C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Jan 2021 13:33:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3437B2247F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Jan 2021 13:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3437B2247F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jtZE2CZnR6HLpciXIqTBlJQmRkxlSPPH7DfYc363YF8=; b=dKYO1BeRy4rZ/U1DkTKdklfS6
	w2SoJy3NDUOrCb+rQ+LkYa1rbEU/Y22Mo5+wRzVDtrqY0XSl9FYEs9sB+/0rnxhpng7y43WREpysn
	297EqWAKEdeyKewZyOrfKf2XzqPLWLIocj1tksoSjZQoYl8Xx1ISRkhIyRsKROCNStkzWPgZjdxa0
	mx7b6t98IqcDPFfPVHSNHmO67KVllHo69Aqj0ssSrgYh4Fqy7QUbRGioSakAWA4/riqSIZ90Sn9Ig
	P+s2YJJVdhbZl21zGbomV+HiqV5ZNfH3wB5aWk36bTd5ATXrYExh0GZlFX5NA4gwjp0Wk5DwAqlaW
	lPwF9zQ6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4ORS-0000Wf-Lw; Tue, 26 Jan 2021 13:31:34 +0000
Received: from mail-dm6nam11on2089.outbound.protection.outlook.com
 ([40.107.223.89] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4ORQ-0000WE-MH
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Jan 2021 13:31:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7bnKWAndy79UDuQoQDZPdyEiFeYKiF9t9FGzpnfnutFM4nlQD+B+MsowLwXHZ2yC4ctFHRJzZf0l6dmC57N7oX3Nz+qxxop5+YlEtG7MUBdWra3lZV5CnMHDxcqdeMvyj8BJo9Tpv3r34xubjlWOGT4laGYkMWHdOEipjxc1YnFfo9dgSlPnhqqiX4N7e8XX49KiqlSBwVeztmR68KVBpt+921YfH9t7g09LIobJDv4GFuuJ/6lhpQ/vtXchm1zeN8TaF0QHNbMAjkG8Fie4DrPdCGFasV922kKGCvdh+tEXNnk3i12Xefi0S8aQktgr3BqlRl22NYhxl0bOBbECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Pp2k/NVh3nxaf4qwoAb6Tugz99Owemk5UPc8qRhpyE=;
 b=m9Nt6hCA01qdEn/Od9ScGxSdtIdVlkTa3DSFpHhNjs8AqijmMfL+Ndo+UI0gSiLOwAMQHDchAkDg9+DqkBjZSTXMHV6OkgRuQjXk1S97GOPDnEbKr/T0zrTWBIRGB1gfQJg3Ydpq4zzcPKMIz9p9KyrGqFW2ytANotZex1caZK8KbOcpYKWUxjJ1f1XwXs/gpAZHwyxOuBGrLodXUlJ7o0eLTqFwWJzEDSCl5UWu9FhiA7tmVtkxkzYE0bUgT2VGGJ8193s9YwvG1H/3JpW1jbk1umjWf2HuHglfAFP/060zgiBOKJWGbb1oKTDHYhjuoLuF9rC6Lz+QcpoMrVFLMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Pp2k/NVh3nxaf4qwoAb6Tugz99Owemk5UPc8qRhpyE=;
 b=aG83L1f4Qt6uzEhotGHxDfJvDSI10IOj+LIVTcwdPstjXBJJJJgxlS2f7hhfQ0fiKcWOAmBEzCwPfBOhl1Cn4TzTF/J2nr1c7t6l75g3S6Smsab79fOkrwb8l8daJwtjoM1yuaqFHRZygq9OJUN9wva6bpDZa3kjAHJ/EvzO2FE=
Received: from BL1PR13CA0175.namprd13.prod.outlook.com (2603:10b6:208:2bd::30)
 by MWHPR02MB3390.namprd02.prod.outlook.com (2603:10b6:301:6b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Tue, 26 Jan
 2021 13:31:30 +0000
Received: from BL2NAM02FT031.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2bd:cafe::70) by BL1PR13CA0175.outlook.office365.com
 (2603:10b6:208:2bd::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.6 via Frontend
 Transport; Tue, 26 Jan 2021 13:31:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT031.mail.protection.outlook.com (10.152.77.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 13:31:29 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 26 Jan 2021 05:31:29 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 26 Jan 2021 05:31:26 -0800
Received: from [172.30.17.109] (port=58936)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1l4ORK-000082-HY; Tue, 26 Jan 2021 05:31:26 -0800
Subject: Re: [PATCH 0/3] add Ebang EBAZ4205 support
To: Michael Walle <michael@walle.cc>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210120194033.26970-1-michael@walle.cc>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <6a9ce151-820a-a280-7137-804837f4b5a5@xilinx.com>
Date: Tue, 26 Jan 2021 14:31:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120194033.26970-1-michael@walle.cc>
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96f943ff-90be-400b-1cca-08d8c1feb06a
X-MS-TrafficTypeDiagnostic: MWHPR02MB3390:
X-Microsoft-Antispam-PRVS: <MWHPR02MB33903EBA4A69A0A8C3E35218C6BC9@MWHPR02MB3390.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F/JhTSG6jwTnW0EsIfHfqRS4V8RjMLQwwRkCZFewjEVkdS3+4skmhPf90n9ORfrzk7m9GmNQzBHe2fM2isE5q/vrAr0JWAjP8bQr9n45hRrPu1cpCro/0SuQNbbGldWdFUlD2a1QepCMSnkVWmDpwD9LKM9pOAEkrCZ8zxQxeFhIDHxJg7M8BtmBDF+43aaW5U/2QQeIy2NC8oX3A4EVVN/6VCC5iZgQaw3Uoz1WUARMKlVouq6g4ejwWMbYAPzE2dYdn6ChsAfqTvK7fQVUfRTE3RMRHhbzpjmeEh7fQWciiNmTCyqrKvgrDhFWAZyyjp1hARsZawVvJpildTcBA715G6gZJNTb7zIisV9tLVgQBiBTcnzFvLhebmLFl4RetR6XAJui3/w0knmBJ8EC1OUMzcm2tHc53hrN55jtD4XVPc0tNQZyv/72Pe1ktbROHzKbzVz+DoRfrrZM7A6mOvxNMywk6CPeB0I+xDQphNyGzUkJzAepoDG5BpwmYfcP1RMFToSsKLcEbZiUV77CV9m2LOPniCvzA+ke98BNCyFmFHpMBQgzQRFnv0UcNEu+9wo27hFGPrc7jfHW2+NasFIUJrPRa/am5zDbP3GPaPZyLXVirdRNei2OX3eXFxMwWm06EZD2A1tbPyFaZ2RUReOfGv0XGwXQBLMMmlo5pjc=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966006)(36756003)(6666004)(8676002)(36906005)(186003)(8936002)(4744005)(82310400003)(31696002)(9786002)(7636003)(83380400001)(478600001)(31686004)(2906002)(82740400003)(356005)(66574015)(426003)(4326008)(44832011)(336012)(110136005)(53546011)(26005)(70586007)(47076005)(70206006)(5660300002)(2616005)(54906003)(316002)(50156003)(2101003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 13:31:29.7103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f943ff-90be-400b-1cca-08d8c1feb06a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT031.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3390
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_083132_741177_0EFE88DA 
X-CRM114-Status: GOOD (  15.87  )
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
Message-ID: <20210126133123.Rov8x4zZ5tWJa9RLRBaXFQq2HH8hXpu4dqIxCw7jvOc@z>



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

Applied all.

Thanks,
Michal

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
