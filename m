Return-Path: <SRS0=f/o2=FP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033E9C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Dec 2020 08:25:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ADA823E56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Dec 2020 08:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ADA823E56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i0n2OZyr9VizL2tvkmIRNgUAonRNyr82DI8/TG7uXvU=; b=pN9SwDy/B0677GEB9bzVoqe3jB
	54fSwrWX6UyRmTiL1wBZTqIXECX1ZQ/tDK6h6gdT1gcrq+WskS3FLfCcuMl4s1/WmXNnHOCmPMIWI
	uIPCzVPn/4EybH/lZZakjr9MzlnX0F781b6NmsfWZ0u4TJb0PnJuff0zAFrFytUMo3JQyv/jkHKaT
	04noKeOf7h2xQi5zYPBt9O9WsQ8H0NDIz0vIo9f0Ss26xv33KmhiP7JrqgxaQ2iZcSzgXBlshth/V
	96QIjQ/K85zpxB46yDvqPxu0/+VVHSwkclV3m4ndfZJVjmNfYk7cPWQ6sn6DLbqxgQ7WPIsdvlvpT
	6y8ZGbmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kndhk-0001CL-3e; Fri, 11 Dec 2020 08:23:08 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kndhh-0001Bc-HL
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Dec 2020 08:23:06 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 2A4C880C8;
 Fri, 11 Dec 2020 08:23:06 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL] Few regression fixes for omaps
Date: Fri, 11 Dec 2020 10:22:54 +0200
Message-ID: <pull-1607674932-973902@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_032305_621688_F1EABDB8 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 arm@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201211082254.MqSwRillsfuwY0Nb89IhQqmPwMDGyt3TUVHueVHSA-E@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 05d5de6ba7dbe490dd413b5ca11d0875bd2bc006:

  ARM: dts: dra76x: m_can: fix order of clocks (2020-11-19 11:37:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.10/fixes-rc6-signed

for you to fetch changes up to c0bc969c176b10598b31d5d1a5edf9a5261f0a9f:

  ARM: omap2: pmic-cpcap: fix maximum voltage to be consistent with defaults on xt875 (2020-12-08 15:56:24 +0200)

----------------------------------------------------------------
Few regression fixes for omaps for v5.10

Few fixes for regression issues recently noticed by folks testing
the current kernel:

- We need to disable AES for n950 as it's not accessible because of the
  secure mode configuration and kernel fails to boot

- On gta04 wlan probe exposed a bug for BUS_NOTIFY_BIND_DRIVER that has
  been around for a long time

- Droid bionic exposed an issue where we configure an invalid range on
  the PMIC that adds boot time warnings

Obviously these fixes can be merged whenever suitable.

----------------------------------------------------------------
Aaro Koskinen (1):
      ARM: dts: OMAP3: disable AES on N950/N9

Andreas Kemnade (1):
      ARM: OMAP2+: omap_device: fix idling of devices during probe

Carl Philipp Klemm (1):
      ARM: omap2: pmic-cpcap: fix maximum voltage to be consistent with defaults on xt875

 arch/arm/boot/dts/omap3-n950-n9.dtsi | 8 ++++++++
 arch/arm/mach-omap2/omap_device.c    | 8 +++++---
 arch/arm/mach-omap2/pmic-cpcap.c     | 2 +-
 3 files changed, 14 insertions(+), 4 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
