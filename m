Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A663C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 07:28:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 431516103E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 07:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 431516103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xz9HZNiMesWeS029XbYbCrlSbXCeBUIZQWOuwb0xWTw=; b=RoecWr83iJvfDo
	FA+bm+5XzhOF/xnVxNMBrWosXWA+qubAhacCAfKdXpjQMiQMU22OxnCYwImBc7rP18FoGpmGYDBAX
	9Rq1p5qFgUd81aUQ+wYWNhppmaRJ90hrYBCV6W3zDdUJ5mdQ4Ryq+UWis/NzSVgpbKzZCUMkbK5ih
	HLsiv07gwAlcxMwlC+bimkwfTHppT5lo0wN0TGmVQ8Ugyi2Q00M5n86am27YPrUIVGpQ/MD/hw+n0
	r1J+rPh82QpbVZTMzCqXQPQy84HtVeCCr3E+XqwWSmzYzUSrCsuaybhw+yA+wbJVRdzQmqzDjza5/
	VvxlPHEwKHokd8SmOyOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE56V-008te1-Ou; Thu, 12 Aug 2021 07:26:16 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4kv-008pir-00
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 07:03:58 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 42F5380E2;
 Thu, 12 Aug 2021 07:04:16 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Changes for am3 cpsw and SanCloud for v5.15
Date: Thu, 12 Aug 2021 10:03:44 +0300
Message-ID: <pull-1628751694-126144@atomide.com-3>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <pull-1628751694-126144@atomide.com>
References: <pull-1628751694-126144@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000357_125969_66F468EB 
X-CRM114-Status: GOOD (  11.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210812070344.zw5_2P5MHjdvkrfWtB0JQzIB1qQXk2L94fuoRpCpsjM@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 8c054cd2818ea08555efe24a2ffde330833c2f3f:

  ARM: dts: am57xx: Add PRUSS MDIO controller nodes (2021-08-03 15:25:14 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/dt-am3-signed

for you to fetch changes up to 29fabf5274bfb89124918840c79851659a25ba79:

  ARM: dts: am335x-sancloud-bbe: Drop usb wifi comment (2021-08-10 09:52:41 +0300)

----------------------------------------------------------------
Changes for am3 cpsw and SanCloud for v5.15

A series of changes to update am3 to use cpsw switch driver and
few updates to earlier SanCloud changes. The plan was to send the
cpsw switch driver changes earlier but looks like I never tagged
the mail thread in my inbox to apply for v5.15.

----------------------------------------------------------------
Grygorii Strashko (16):
      ARM: dts: am335x-baltos: switch to new cpsw switch drv
      ARM: dts: am335x-nano: switch to new cpsw switch drv
      ARM: dts: am335x-chiliboard: switch to new cpsw switch drv
      ARM: dts: am335x-cm-t335: switch to new cpsw switch drv
      ARM: dts: am335x-igep0033: switch to new cpsw switch drv
      ARM: dts: am335x-lxm: switch to new cpsw switch drv
      ARM: dts: am335x-moxa-uc: switch to new cpsw switch drv
      ARM: dts: am335x-myirtech: switch to new cpsw switch drv
      ARM: dts: am335x-osd3358-sm-red: switch to new cpsw switch drv
      ARM: dts: am335x-pdu001: switch to new cpsw switch drv
      ARM: dts: am335x-pepper: switch to new cpsw switch drv
      ARM: dts: am335x-phycore: switch to new cpsw switch drv
      ARM: dts: am335x-shc: switch to new cpsw switch drv
      ARM: dts: am335x-sl50: switch to new cpsw switch drv
      ARM: dts: am33xx: update ethernet aliases
      ARM: dts: am335x-bone: switch to new cpsw switch drv

Paul Barker (2):
      ARM: dts: am335x-sancloud-bbe: Fix missing pinctrl refs
      ARM: dts: am335x-sancloud-bbe: Drop usb wifi comment

 arch/arm/boot/dts/am335x-baltos-ir2110.dts        | 10 +++---
 arch/arm/boot/dts/am335x-baltos-ir3220.dts        |  8 ++---
 arch/arm/boot/dts/am335x-baltos-ir5221.dts        |  8 ++---
 arch/arm/boot/dts/am335x-baltos.dtsi              |  5 ++-
 arch/arm/boot/dts/am335x-bone-common.dtsi         | 13 +++++---
 arch/arm/boot/dts/am335x-boneblack-wireless.dts   |  2 +-
 arch/arm/boot/dts/am335x-bonegreen-wireless.dts   |  2 +-
 arch/arm/boot/dts/am335x-chiliboard.dts           | 13 +++++---
 arch/arm/boot/dts/am335x-cm-t335.dts              | 13 +++++---
 arch/arm/boot/dts/am335x-igep0033.dtsi            | 12 +++----
 arch/arm/boot/dts/am335x-lxm.dts                  | 14 ++++-----
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi | 12 +++----
 arch/arm/boot/dts/am335x-moxa-uc-2101.dts         |  7 ++---
 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi | 16 ++++------
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi        | 25 ++++++++-------
 arch/arm/boot/dts/am335x-myirtech-myd.dts         | 18 ++++++-----
 arch/arm/boot/dts/am335x-nano.dts                 | 13 ++++----
 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts      | 10 +++---
 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts      | 10 +++---
 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts      | 10 +++---
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts       | 13 +++++---
 arch/arm/boot/dts/am335x-pcm-953.dtsi             | 10 +++---
 arch/arm/boot/dts/am335x-pdu001.dts               | 14 ++++-----
 arch/arm/boot/dts/am335x-pepper.dts               | 14 ++++-----
 arch/arm/boot/dts/am335x-phycore-som.dtsi         | 14 +++++----
 arch/arm/boot/dts/am335x-regor.dtsi               | 11 +++----
 arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi | 37 +++-------------------
 arch/arm/boot/dts/am335x-sancloud-bbe.dts         |  4 +++
 arch/arm/boot/dts/am335x-shc.dts                  | 38 +++++++++++++----------
 arch/arm/boot/dts/am335x-sl50.dts                 | 12 ++++---
 arch/arm/boot/dts/am335x-wega.dtsi                | 11 +++----
 arch/arm/boot/dts/am33xx.dtsi                     |  4 +--
 32 files changed, 194 insertions(+), 209 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
