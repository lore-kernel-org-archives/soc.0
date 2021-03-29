Return-Path: <SRS0=I5Nz=I3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DABC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Mar 2021 16:55:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 910946191F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Mar 2021 16:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 910946191F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x1tLWRB92WT+U+XQGueJcHmPdMvgJ/z0yPuHNljNPj8=; b=DtyOJbAj/4TSQS2Sfy72b2vqg
	oIirWTFxPwnQ3xJ4b8aTTnX+qzIOG8fN9NYvykbhdfpEL0xCG/ENFfw5FrH7wkYccrB2vHJxLmPVx
	v8wnNpAv+SQknt1X6U8c6n9eRSBZEnW6bleU0T0FtX3cwxtxkx7t33j2nTarS3wqnPdCVlsoV8Rfn
	CwHA5ZRMh1Fh6gIy5BsoEpO2U8qk/nxLvdNvLgPGUK+rKaxioGqa5lZt9cid6nSk/jbd95US6Q7Uc
	q1Avr18OtWB4EvsRnwQkhoQgJ+wSw2ysMv88iz0Vh7JcvhArOdzic8NqJxnojSKgJWBsEXLkmlLDf
	yALcHJFVA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQv8O-000nUA-V7; Mon, 29 Mar 2021 16:53:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoeN-000YmR-47
 for linux-arm-kernel@desiato.infradead.org; Mon, 29 Mar 2021 09:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Gn2RpkEKbIp1cAMfQ0B1aVUkBWGqAegjCNf++aLyvtI=; b=Y5TZU+iVeIb9qezavejWKqva59
 cBUX2brKZbrQeqlG3pofCIxW8nHv2/WBT8hK9xsKdnwONLs2SJ9aEUzqWckFBD2HMevSTzEsvjB8M
 jU1HpSzXRSli2JkIlL8wbz4exJWbkWKNW/zm2MlAEwaVLrb+mc9PCENitdx9uqRk9BIkX83kJNQ90
 v2Eh8L7zvi1jqJEe2AWAHB3zwKBu8E/5UP9PnjnnOjWta5flNXfuAQojSQPs4U+gyO3ITXRcz1/T7
 G9DlDhb2LHLpZ+ZgedzNGZkRL+s8XhpXdDWNyOEqEorxXWRC6M2rW7MCqDaWEQBNtf4jkjlBdlem2
 AdMT7EbA==;
Received: from muru.com ([72.249.23.125])
 by casper.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQmkP-001CnT-7g
 for linux-arm-kernel@lists.infradead.org; Mon, 29 Mar 2021 07:55:53 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 304CA811B;
 Mon, 29 Mar 2021 07:56:41 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Drop legacy data for dra7 and omap4/5 and clean-up
Date: Mon, 29 Mar 2021 10:55:22 +0300
Message-ID: <pull-1617004205-537424@atomide.com-3>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <pull-1617004205-537424@atomide.com>
References: <pull-1617004205-537424@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_085542_146270_235AD34C 
X-CRM114-Status: GOOD (  12.07  )
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
Message-ID: <20210329075522.JdvVbnSjaFqe8MLbjcI24DY-lV0MnGtVh7QCELkloiQ@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 083516ad540a1104a0ae5ae7e83f2a2d8e39d2bc:

  Merge tags 'genpd-dts-dra7', 'genpd-dts-omap4' and 'genpd-dts-omap5' into omap-for-v5.13/dts-genpd (2021-03-10 14:16:34 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/genpd-cleanup-signed

for you to fetch changes up to 4adcf4c28f6dc191187359bfceee5ab5fe91a50e:

  bus: ti-sysc: Warn about old dtb for dra7 and omap4/5 (2021-03-12 10:23:48 +0200)

----------------------------------------------------------------
Drop legacy data for dra7 and omap4/5 for genpd support for v5.13

Similar to what we have already done for am3 and 4, we can now boot dra7,
omap4, and omap5 with devicetree data and genpd without legacy SoC specific
built-in data.

Let's drop the legacy data for these SoCs, and the related "ti,hwmods"
custom devicetree property. As with these changes we now expect to have
complete devicetree data, let's also warn in the case if an old devicetree
data is noticed. And with the warning provided, there should not be any
need to delay dropping the legacy data as it just unnecessarily complicates
things.

The main reasons for dropping the legacy data is to avoid the burden of
maintaining a mixed boot process where both legacy built-in data and
devicetree data are needed. And we can now use standard reset driver,
genpd, and simple-pm-bus features.

These patches are based on the related devicetree changes to add the
missing interconnect target module configuration for these SoCs.

----------------------------------------------------------------
Tony Lindgren (35):
      ARM: OMAP2+: Drop legacy platform data for dra7 pcie
      ARM: OMAP2+: Drop legacy platform data for dra7 qspi
      ARM: OMAP2+: Drop legacy platform data for dra7 sata
      ARM: OMAP2+: Drop legacy platform data for dra7 mpu
      ARM: OMAP2+: Drop legacy platform data for dra7 dmm
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_wkup
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_per1
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_per2
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_per3
      ARM: OMAP2+: Drop legacy platform data for dra7 l4_cfg
      ARM: OMAP2+: Drop legacy platform data for dra7 l3
      ARM: OMAP2+: Drop legacy platform data for dra7 hwmod
      ARM: OMAP2+: Drop legacy platform data for omap4 iss
      ARM: OMAP2+: Drop legacy platform data for omap4 control modules
      ARM: OMAP2+: Drop legacy platform data for omap4 dmm
      ARM: OMAP2+: Drop legacy platform data for omap4 emif
      ARM: OMAP2+: Drop legacy platform data for omap4 debugss
      ARM: OMAP2+: Drop legacy platform data for omap4 mpu
      ARM: OMAP2+: Drop legacy platform data for omap4 l4_wkup
      ARM: OMAP2+: Drop legacy platform data for omap4 l4_per
      ARM: OMAP2+: Drop legacy platform data for omap4 l4_cfg
      ARM: OMAP2+: Drop legacy platform data for omap4 l3
      ARM: OMAP2+: Drop legacy platform data for omap4 hwmod
      ARM: OMAP2+: Drop legacy platform data for omap5 dmm
      ARM: OMAP2+: Drop legacy platform data for omap5 emif
      ARM: OMAP2+: Drop legacy platform data for omap5 mpu
      ARM: OMAP2+: Drop legacy platform data for omap5 sata
      ARM: OMAP2+: Drop legacy platform data for omap5 l4_wkup
      ARM: OMAP2+: Drop legacy platform data for omap5 l4_per
      ARM: OMAP2+: Drop legacy platform data for omap5 l4_cfg
      ARM: OMAP2+: Drop legacy platform data for omap5 l3
      ARM: OMAP2+: Drop legacy platform data for omap5 hwmod
      Merge branches 'omap-for-v5.13/genpd-dra7', 'omap-for-v5.13/genpd-omap4' and 'omap-for-v5.13/genpd-omap5' into omap-for-v5.13/genpd-drop-legacy
      ARM: OMAP2+: Stop building legacy code for dra7 and omap4/5
      bus: ti-sysc: Warn about old dtb for dra7 and omap4/5

 arch/arm/boot/dts/dra7-l4.dtsi             |   1 -
 arch/arm/boot/dts/dra7.dtsi                |   5 -
 arch/arm/boot/dts/omap4-l4.dtsi            |   4 -
 arch/arm/boot/dts/omap4.dtsi               |   8 +-
 arch/arm/boot/dts/omap5.dtsi               |   4 -
 arch/arm/mach-omap2/Kconfig                |   3 -
 arch/arm/mach-omap2/Makefile               |  11 +-
 arch/arm/mach-omap2/common.h               |   9 -
 arch/arm/mach-omap2/io.c                   |  12 +-
 arch/arm/mach-omap2/omap_hwmod.c           |   8 -
 arch/arm/mach-omap2/omap_hwmod.h           |  14 +-
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 877 -----------------------------
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 467 ---------------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c  | 719 -----------------------
 arch/arm/mach-omap2/pdata-quirks.c         |   2 +-
 arch/arm/mach-omap2/sr_device.c            |   7 +
 drivers/bus/ti-sysc.c                      |   3 +
 17 files changed, 35 insertions(+), 2119 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_44xx_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_54xx_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_7xx_data.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
