Return-Path: <SRS0=zXmn=M4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517DCC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 08:48:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D7BA61078
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 08:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D7BA61078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XU2pQuR3u8bK8j1HcmFOgGebhMa3Dj1cnFUHw7K9XI=; b=aQtLPk53ODd9MO
	TSBdqWdLRnn/SfsBD3nghl3ohM+U7nECEdGGXcqRlMxsp6nxq7TBIV5etTFnImCuTf8xQoOPZXoKW
	NOF/52GggsjYSOF207TZcY1nNHsX4InR8fKaMNEUCQ351/tZIkOHDT1ann9BT6JzbKogJ6EYH4wJg
	fwA5DZs7vih29fCfPmM74gE34mLzIl6uqLdePpWQPKMTXTHuFo9y6NMlc/nxlAqJINwiTuWG+hROp
	mMasBzzpofp77lBNsGezHsB/5aquNvqY6gJMkG4N+YT8/0mZ87trmvBXK7uC79yAcKKuhVQ3mjMln
	xyqRya5jLqWpXsqa3aKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBZ26-008hdy-6a; Thu, 05 Aug 2021 08:47:18 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBZ1l-008hab-8C
 for linux-arm-kernel@lists.infradead.org; Thu, 05 Aug 2021 08:46:58 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 4779F818C;
 Thu,  5 Aug 2021 08:47:15 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Devicetree changes for omaps for v5.15
Date: Thu,  5 Aug 2021 11:46:44 +0300
Message-ID: <pull-1628153040-834155@atomide.com-3>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <pull-1628153040-834155@atomide.com>
References: <pull-1628153040-834155@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_014657_387022_92C97A91 
X-CRM114-Status: GOOD (  14.20  )
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
Message-ID: <20210805084644.BZNJOOY6TRNRziRXJxl-cYS7e-B7eBE75gbyKr8LKKk@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/dt-signed

for you to fetch changes up to 8c054cd2818ea08555efe24a2ffde330833c2f3f:

  ARM: dts: am57xx: Add PRUSS MDIO controller nodes (2021-08-03 15:25:14 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v5.15

Devicetree changes for omaps to configure more devices, and
add support for new SoC variants and devices:

- Add add gpio-line-names for am335x-boneblue

- Add support for dra762 abz package

- Two patches for McASP support on omap4

- Three patches to add support for am335x-sancloud-bbe-lite

- A series of changes to configure PRUSS for am3/4/5

----------------------------------------------------------------
Andrew F. Davis (1):
      ARM: dts: am4372: Add PRUSS MDIO controller node

David Lechner (1):
      ARM: dts: am335x-boneblue: add gpio-line-names

Lokesh Vutla (1):
      ARM: dts: Add support for dra762 abz package

Paul Barker (3):
      ARM: dts: am335x-boneblack: Extract HDMI config
      ARM: dts: am335x-sancloud-bbe: Extract common code
      ARM: dts: am335x-sancloud-bbe-lite: New devicetree

Peter Ujfalusi (2):
      ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
      ARM: dts: omap4-l4-abe: Add McASP configuration

Suman Anna (10):
      ARM: dts: am33xx-l4: Add PRUSS node
      ARM: dts: am33xx-l4: Add PRUSS MDIO controller node
      ARM: dts: am335x-bone-common: Enable PRU-ICSS node
      ARM: dts: am335x-evm: Enable PRU-ICSS module
      ARM: dts: am335x-evmsk: Enable PRU-ICSS module
      ARM: dts: am335x-icev2: Enable PRU-ICSS module
      ARM: dts: am4372: Add the PRU-ICSS1 DT node
      ARM: dts: am4372: Add the PRU-ICSS0 DT node
      ARM: dts: am57xx: Add PRU-ICSS nodes
      ARM: dts: am57xx: Add PRUSS MDIO controller nodes

 arch/arm/boot/dts/Makefile                        |   1 +
 arch/arm/boot/dts/am335x-bone-common.dtsi         |   4 +
 arch/arm/boot/dts/am335x-boneblack-common.dtsi    | 135 ----------------
 arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi      | 141 +++++++++++++++++
 arch/arm/boot/dts/am335x-boneblack-wireless.dts   |   1 +
 arch/arm/boot/dts/am335x-boneblack.dts            |   1 +
 arch/arm/boot/dts/am335x-boneblue.dts             | 143 ++++++++++++++++-
 arch/arm/boot/dts/am335x-evm.dts                  |   4 +
 arch/arm/boot/dts/am335x-evmsk.dts                |   4 +
 arch/arm/boot/dts/am335x-icev2.dts                |   4 +
 arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi |  96 ++++++++++++
 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts    |  50 ++++++
 arch/arm/boot/dts/am335x-sancloud-bbe.dts         |  92 +----------
 arch/arm/boot/dts/am33xx-l4.dtsi                  |  82 ++++++++++
 arch/arm/boot/dts/am4372.dtsi                     | 165 ++++++++++++++++++++
 arch/arm/boot/dts/am437x-cm-t43.dts               |   4 +
 arch/arm/boot/dts/am437x-gp-evm.dts               |   4 +
 arch/arm/boot/dts/am437x-idk-evm.dts              |   4 +
 arch/arm/boot/dts/am437x-sk-evm.dts               |   4 +
 arch/arm/boot/dts/am43x-epos-evm.dts              |   4 +
 arch/arm/boot/dts/am57-pruss.dtsi                 | 178 +++++++++++++++++++++-
 arch/arm/boot/dts/am571x-idk.dts                  |   8 +
 arch/arm/boot/dts/am572x-idk.dts                  |   8 +
 arch/arm/boot/dts/am5748.dtsi                     |   6 +-
 arch/arm/boot/dts/am574x-idk.dts                  |  10 +-
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi   |   8 +
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts         |   8 +
 arch/arm/boot/dts/dra74x-p.dtsi                   |  27 ++++
 arch/arm/boot/dts/dra76x.dtsi                     |  12 --
 arch/arm/boot/dts/omap4-l4-abe.dtsi               |  38 ++---
 30 files changed, 981 insertions(+), 265 deletions(-)
 create mode 100644 arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
 create mode 100644 arch/arm/boot/dts/dra74x-p.dtsi

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
