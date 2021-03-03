Return-Path: <SRS0=J3As=IB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D83FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Mar 2021 20:44:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 154D664EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Mar 2021 20:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 154D664EF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MQTv5W+MT9LO/UedQCkJ491xOBMwYBir+c9W2tb17Ug=; b=beNTB/Nh2G1k0o6yuDZmL4Ex4U
	Xx1LrnebjjWs7Umiy3rJw5fJghMEz44fPgSH+7NsfzskOONlAWKOC54M2CO4FfkNXHKJo5AEy4eCR
	KiKG9NXgNAkIg7IbQF1+JJrcmDmFFnPcYk88EXpcRRrEFBev7MwrmirrSNl/1vlINvfNLc5+6aIV4
	rHkj2bMpHHH6ORtI4LfX8PlVGd5eflImUjwP2n/3jwSix7k7o6nNfN4W+AJtI3yt/F8X3OSZ9LDUL
	TNGZWmH+aIyH618K3RhRnLpjGeiZIh9r1yrcHyzveLURDffvEybr+f0SpKp1Imjfa93pezO09HHJX
	JrS1L9oQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHYGo-006SIv-1j; Wed, 03 Mar 2021 20:39:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT6d-005J7R-SN
 for linux-arm-kernel@desiato.infradead.org; Wed, 03 Mar 2021 15:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=0wAlLTvkRru+QWwsFrbdaswRt5H8DL9bVhgL24Zp9Ek=; b=boGhA7P8CnBXKfho2WrcavnG97
 Dgscd/gg/7Qt52BOmYSLmYyNxhmPzvzxQZWmaQFLJV3yIj11vw9KyVkHS9lCk+brLIc5TH1NGcMc/
 RjdqQdFN6vHNeffb9OCdEaZe4BqfklHOVnBYAaaHy9jfhKUB2FY2VBexsfeV+RxHjgP7+X9OKKXbm
 iPB8V4SRyTPjDaLFQKsMv8kVvihmC6tqMoN9UzGemz5XHf385oKdBEiauuJMpkL5cvsnCQldvutqq
 qmdRfYyETuSQYwS30NZqSGW6DDx+zqZ7W6z+vVgsvsYnpLRg1e7FkwqAQhtF/Yi57GNU6d3Irb6BP
 ZJC8tBWA==;
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHNyL-00226V-Ep
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Mar 2021 09:39:13 +0000
IronPort-SDR: bvItoi+xaAQoq6LV05Rx7n6wl43qjLQYnezp8PWsxJhsSsO87xXHawwr7s6PJkOJvCI4hogFd2
 AkBr5ccM2TVa+fTQ+5KY/q3xLo9zPs19tL/PUlJal34+eE0TVlD+I+WfJSWeSaZvRhJqkfwiUt
 Czv1opt6C4i3No4A82bnjLj7ntMz68qRQZKuAOXDIL6qTM3yhQPH1Ju6vYgtB0xhSeal1+1Lkn
 XZU7WZ8VMtnjfOvCtTBgta84ou5mEkvnK5+aDK0aRj662rgkj7cff7y+qbZBnJFBZc6R2tdMgB
 fFU=
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="21396644"
X-IronPort-AV: E=Sophos;i="5.81,219,1610377200"; d="scan'208";a="21396644"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP; 03 Mar 2021 18:38:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0277DEF95B
 for <linux-arm-kernel@lists.infradead.org>;
 Wed,  3 Mar 2021 18:38:50 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4781D6E00A
 for <linux-arm-kernel@lists.infradead.org>;
 Wed,  3 Mar 2021 18:38:49 +0900 (JST)
Received: from cn-r05-09.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om4.fujitsu.com (Postfix) with ESMTP id 0C3DB4006817C;
 Wed,  3 Mar 2021 18:38:49 +0900 (JST)
From: "tan.shaopeng" <tan.shaopeng@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Cc: will@kernel.org, catalin.marinas@arm.com, arnd@arndb.de, olof@lixom.net,
 misono.tomohiro@jp.fujitsu.com, tan.shaopeng@jp.fujitsu.com
Subject: [PATCH RFC] Upstream A64FX cache driver
Date: Wed,  3 Mar 2021 18:38:22 +0900
Message-ID: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_093913_848358_5D0640B1 
X-CRM114-Status: GOOD (  12.95  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210303093822.-IT1OQwhSgJoQgmN67q536CZDizUkz1q5vgVciWysH8@z>

From: "tan.shaopeng" <tan.shaopeng@jp.fujitsu.com>

Hello, 

This driver enables Fujitsu A64FX's cache function. 

[Driver Description] 
A64FX CPU has several functions for HPC workload and this driver is  
for cache functions. 

Loading this cache driver, control registers will be set to enable  
these functions, and advanced settings registers will be set by default 
values. After loading this driver, you can use the default values of the 
advanced settings registers or set custom values to the advanced 
settings registers from EL0. Unloading this driver, control registers 
will be clear to disable these functions. 

These functions include sector cache function and hardware prefetch  
assistance function. 
- Sector cache function:  
 Cache partitioning function which can control virtual cache capacity for 
 each characteristics of data such as temporal locality. 
- Hardware prefetch assistance function:  
 Software can provide the hint for hardware prefetch mechanism to reduce  
 the penalty of the memory access. By providing the access pattern  
 through that function in advance, hardware prefetch mechanism can access 
 the complex pattern. 

These functions can be executed according to the default values of the 
registers which are set by the driver. Or they can be executed  
according to a tag which is the upper 8 bits of the load/store address 
of application to customize hardware prefetch and sector cache. 

For more details of these functions,  
see A64FX HPC extension specification in 
https://github.com/fujitsu/A64FX  

The driver is based on v5.11-rc2 and tested on FX1000 environment. 

[RFC]  
This function only performs register initialization for A64FX. At first, 
I wanted to insert it to kernel initialization code, but there is no  
initialization code except errata, so I made this driver. 
I'd like to know if this approach is OK? Would you give me some advice? 

Best regards, 
Tan Shaopeng 

tan.shaopeng (1):
  soc: fujitsu: Add cache driver code

 MAINTAINERS                         |   6 ++
 arch/arm64/Kconfig.platforms        |   5 +
 drivers/soc/Kconfig                 |   1 +
 drivers/soc/Makefile                |   1 +
 drivers/soc/fujitsu/Kconfig         |  26 +++++
 drivers/soc/fujitsu/fujitsu_cache.c | 183 ++++++++++++++++++++++++++++++++++++
 6 files changed, 222 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/fujitsu_cache.c

-- 
1.8.3.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
