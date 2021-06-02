Return-Path: <SRS0=XAKR=K4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7220CC47083
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 08:07:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41CCD613AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 08:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41CCD613AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x29HPWtKkN3O8oz65ELcZH2RV8E0lJ5h1T5OkAEIMmE=; b=QauJcxkVFUrTb9
	Fxg/wp0auFny9NztkxViKaCI27KwNhdOufBU00zNsBGv1vos7eCn56hHVFnjIcVuYz6ShV80ZPo0T
	SxprxJoY4Z1m2N5ruWoSEA+vb869i1cI5W96i4oQtzI9GNr/9coq1KvSbmSdK80uqL4aAEkYJXkqP
	vf94ROdbn1ZU1ME2g664Il3BCvJ+2DwVJ9IMQofUUhoJryuGrqg6a8nB3AljQYVLtku8OVDu9w9oi
	4vhyD8ZlWVCUGAsisiDK/y5LGm3ovKt9exYyWbN0I4h4aqI5OmrLNxWhHifkGxgQqhDthua9fgHPU
	8EFRy48Q2jf4v43PzYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loLsR-002U9s-Oi; Wed, 02 Jun 2021 08:05:24 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loLA6-002GMv-Bf
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Jun 2021 07:19:35 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 74BE48119;
 Wed,  2 Jun 2021 07:19:40 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Devicetree changes for omaps for v5.14
Date: Wed,  2 Jun 2021 10:19:11 +0300
Message-ID: <pull-1622618286-677305@atomide.com-3>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <pull-1622618286-677305@atomide.com>
References: <pull-1622618286-677305@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_001934_497884_DC1879EB 
X-CRM114-Status: GOOD (  13.69  )
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
Message-ID: <20210602071911.qrAr_PTX65ZnKBEPmx_nW-MStiBt4JtVuzWcS9GStcI@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/dt-signed

for you to fetch changes up to 9e7f5ee1137397def6580461e27e5efcb68183ee:

  ARM: dts: OMAP2+: Replace underscores in sub-mailbox node names (2021-05-27 15:12:33 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v5.14 merge window

Mostly just clean-up for device tree binding checks with
few other clean-up patches:

- Drop ov5640 sensor for dra76-evm, it's just one of the
  optional additional sensors and makes hard to use any of
  the other options, TI is using the devicetree overlay
  snippets for these

- Group the phandles in osd3358-sm-red to make the files
  more readable

- A series of gpio clean-up patches to follow the binding
  documentation

- Move ti,no-reset related properties to the target module
  level, the ti-sysc driver handles them also in the child
  but they really belong to the target module

- Drop the unnecessary uart compatible entries to make the
  binding check to work

- Mailbox related updates to make the binding check to
  work

----------------------------------------------------------------
Dario Binacchi (1):
      ARM: dts: osd3358-sm-red: group in the same phandle all its properties

Geert Uytterhoeven (1):
      ARM: dts: dra7x-evm: Align GPIO hog names with dt-schema

Grygorii Strashko (7):
      ARM: dts: am335x: align GPIO hog names with dt-schema
      ARM: dts: am437x: align gpio hog names with dt-schema
      ARM: dts: omap3: align gpio hog names with dt-schema
      ARM: dts: omap5-board-common: align gpio hog names with dt-schema
      ARM: dts: am57xx-cl-som-am57x: fix ti,no-reset-on-init flag for gpios
      ARM: dts: am437x-gp-evm: fix ti,no-reset-on-init flag for gpios
      ARM: dts: am335x: fix ti,no-reset-on-init flag for gpios

Suman Anna (4):
      ARM: dts: OMAP2420: Drop interrupt-names from mailbox node
      ARM: dts: OMAP2/OMAP3: Rename processor sub-mailbox nodes
      ARM: dts: AM33xx/AM43xx: Rename wkup_m3 sub-mailbox node
      ARM: dts: OMAP2+: Replace underscores in sub-mailbox node names

Tomi Valkeinen (1):
      ARM: dts: dra76-evm: remove ov5640

Vignesh Raghavendra (2):
      ARM: dts: dra7-l4: Drop ti,omap4-uart entry from UART nodes
      ARM: dts: am437x-l4: Drop ti,omap2-uart entry from UART nodes

 arch/arm/boot/dts/am335x-baltos.dtsi              |   4 +-
 arch/arm/boot/dts/am335x-boneblack-wireless.dts   |   2 +-
 arch/arm/boot/dts/am335x-boneblue.dts             |   2 +-
 arch/arm/boot/dts/am335x-bonegreen-wireless.dts   |   4 +-
 arch/arm/boot/dts/am335x-evmsk.dts                |   2 +-
 arch/arm/boot/dts/am335x-icev2.dts                |   4 +-
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi |   2 +-
 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi |   2 +-
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts       | 132 ++++++++++------------
 arch/arm/boot/dts/am335x-shc.dts                  |   8 +-
 arch/arm/boot/dts/am33xx-l4.dtsi                  |   4 +-
 arch/arm/boot/dts/am437x-gp-evm.dts               |   9 +-
 arch/arm/boot/dts/am437x-l4.dtsi                  |  16 +--
 arch/arm/boot/dts/am43x-epos-evm.dts              |   2 +-
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts         |  13 +--
 arch/arm/boot/dts/dm816x.dtsi                     |   2 +-
 arch/arm/boot/dts/dra7-evm.dts                    |   2 +-
 arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi        |   6 +-
 arch/arm/boot/dts/dra7-l4.dtsi                    |  24 ++--
 arch/arm/boot/dts/dra71-evm.dts                   |   2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi           |   2 +-
 arch/arm/boot/dts/dra72x.dtsi                     |   6 +-
 arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi       |   2 +-
 arch/arm/boot/dts/dra74x.dtsi                     |   8 +-
 arch/arm/boot/dts/dra76-evm.dts                   |  37 +-----
 arch/arm/boot/dts/omap2420.dtsi                   |   5 +-
 arch/arm/boot/dts/omap2430.dtsi                   |   2 +-
 arch/arm/boot/dts/omap3-evm-processor-common.dtsi |   2 +-
 arch/arm/boot/dts/omap3-gta04a5.dts               |   2 +-
 arch/arm/boot/dts/omap3.dtsi                      |   2 +-
 arch/arm/boot/dts/omap4-l4.dtsi                   |   4 +-
 arch/arm/boot/dts/omap5-board-common.dtsi         |   2 +-
 arch/arm/boot/dts/omap5-l4.dtsi                   |   4 +-
 33 files changed, 139 insertions(+), 181 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
