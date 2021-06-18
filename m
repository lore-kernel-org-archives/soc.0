Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73913C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 08:01:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A7861164
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 08:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45A7861164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcqbdLEP+JRgBCjuTfiZaKrf/S0BkdT/Q4p+72fT3CU=; b=KG8SP4l13oRtpp
	5j51V2nQt357l6mdb31UaJKQFB81qWDkFns2jsZw0xAeDU/ddBA5UYqYC3UzTAueobAxxoR1/xnMn
	KiE9VNkOD9aB5KsLUgMvNw8utwwyW7a5JCv2mY7kGAu+Ee3/to10ST9iTW3SNry/73a0s4o/n1VoC
	k/UF0WjCJknTPvvi4g18d00iQ2nn827hne8xxawNfEUPS3xg9p8X15yeX5O3KXi2u4jlaapgwg9/C
	bQXIy/PRekLmTHKytvJeIDBcb3R8BcpgiuPGfaNI8oZ2eq5z6ww/aV1uCCTKzmgiY8/oZSGUe81j5
	kWEUXf1MXT/BrCfWXYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu9PA-00DBum-I4; Fri, 18 Jun 2021 07:59:09 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu9L2-00D9rR-R2
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 07:54:54 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id C4C2C81AC;
 Fri, 18 Jun 2021 07:55:01 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/2] Devicetree binding clean-up for omaps for v5.14
Date: Fri, 18 Jun 2021 10:54:46 +0300
Message-ID: <pull-1624002812-396117@atomide.com-2>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <pull-1624002812-396117@atomide.com>
References: <pull-1624002812-396117@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_005453_014201_1BEA90CA 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210618075446.vtE1asgdX964RPXY4waahbXzLE4HJi96XNmxSv3_4Vo@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 9e7f5ee1137397def6580461e27e5efcb68183ee:

  ARM: dts: OMAP2+: Replace underscores in sub-mailbox node names (2021-05-27 15:12:33 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/dt-cleanup-signed

for you to fetch changes up to 9b11fec7345f21995f4ea4bafb0e108b9a620238:

  ARM: dts: am437x: align ti,pindir-d0-out-d1-in property with dt-shema (2021-06-11 10:35:08 +0300)

----------------------------------------------------------------
Devicetree binding clean-up for omaps for v5.14

Minor devicetree clean-up for omaps for the binding checks:

- Drop unsupported dmas for omap2/3 i2c
- Drop redundant ehrpwm compatible
- Drop am33xx-ecap compatible no longer needed
- Correct node names for ecap
- Drop unsupported interrupts for ecap
- Drop redundant ti,pcf8575
- Correct usage for ti,pindir-d0-out-d1-in

----------------------------------------------------------------
Aswath Govindraju (2):
      ARM: dts: am335x: align ti,pindir-d0-out-d1-in property with dt-shema
      ARM: dts: am437x: align ti,pindir-d0-out-d1-in property with dt-shema

Geert Uytterhoeven (1):
      ARM: dts: dra7x-evm: Drop "ti,pcf8575"

Lokesh Vutla (4):
      ARM: dts: ti: drop usage of redundant compatible
      ARM: dts: ti: Drop usage of ti,am33xx-ecap from DT nodes
      ARM: dts: ti: Fix node name for all ecap dt nodes
      ARM: dts: am33xx: Drop interrupt property from ecap nodes

Vignesh Raghavendra (1):
      ARM: dts: omap2/3: Drop dmas property from I2C node

 arch/arm/boot/dts/am335x-cm-t335.dts    |  4 ++--
 arch/arm/boot/dts/am335x-evm.dts        |  2 +-
 arch/arm/boot/dts/am335x-evmsk.dts      |  2 +-
 arch/arm/boot/dts/am33xx-l4.dtsi        | 30 +++++++++---------------------
 arch/arm/boot/dts/am437x-l4.dtsi        | 33 ++++++++++++---------------------
 arch/arm/boot/dts/am43x-epos-evm.dts    |  4 ++--
 arch/arm/boot/dts/da850.dtsi            | 21 ++++++++-------------
 arch/arm/boot/dts/dm816x.dtsi           |  4 ----
 arch/arm/boot/dts/dra7-evm.dts          |  6 +++---
 arch/arm/boot/dts/dra7-l4.dtsi          |  6 +++---
 arch/arm/boot/dts/dra72-evm-common.dtsi |  4 ++--
 arch/arm/boot/dts/dra76-evm.dts         |  6 +++---
 arch/arm/boot/dts/omap2.dtsi            |  4 ----
 arch/arm/boot/dts/omap3.dtsi            |  6 ------
 14 files changed, 46 insertions(+), 86 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
