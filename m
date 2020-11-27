Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D88C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 07:40:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6DC42222C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 07:40:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fGFrXClg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6DC42222C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MOf4ioiB2OVyCqjPlIzEFT6PeL8jZSs5Z8l75bf/GF0=; b=fGFrXClgws964jpAd6YPPfcUQ
	gG9P6GUfOLMZmMxYAdo1OBWwR+MUT4/QPm8uxWRAmId0CuTV8jvb/AHc8k5VjixGeUglJjlzp3tb1
	DMmRDwS/sFRpjr189wOmSzcT6ah/8l7yF8t3CyxSWNXUoqSYZEXQSSw64miB/7fN8HIPBNDW4lQX7
	Hxj4mOP8lPBcWTjbO7jiLYRZhUDXdvaYTQiJC7I8gb5m1nO0ivH/4ph0XAEXObqz50CRUJkvhtqAs
	8SABuqS6fGZtZSO2BWseAWx8pJBMrvznNCe+KOxq0XfiHw/4g/3oR0RMjf83w0CC2g/jBWMjmYzeB
	XWhZuaLFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiYLA-0000FC-B8; Fri, 27 Nov 2020 07:38:48 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiYKr-00009z-No
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 07:38:33 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 3C4E080EE;
 Fri, 27 Nov 2020 07:38:36 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 2/3] Devicetree changes for omaps for v5.11 merge window
Date: Fri, 27 Nov 2020 09:38:20 +0200
Message-ID: <pull-1606462656-588116@atomide.com-2>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1606462656-588116@atomide.com>
References: <pull-1606462656-588116@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_023832_064443_D34EEA4E 
X-CRM114-Status: GOOD (  11.84  )
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
Message-ID: <20201127073820.cBysyfOzMneWbX00yioPeKWImIYO7kF5rVf_BtwqEzE@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/dt-signed

for you to fetch changes up to d7356a7ab125c3a4fee521b7530f3122bc842ac4:

  ARM: dts: am335x: Fix comments for AM335X_PIN_GPMC_WPN pin in GPIO mode (2020-11-16 13:38:29 +0200)

----------------------------------------------------------------
Devicetree changes for omaps for v5.11 merge window

- Two non-urgent pandaboard updates to get gpio button and bluetooth
  working on pandaboard-es

- Updates to follow devicetree binding docs for dwc3 and pwm-leds

- Add initial support for droid bionic based on what we have for droid4

- Add second sha instance for dra7

- Add eQEP nodes for am335x for boneblue

- Fix wrong comments for am335x gpio_31

----------------------------------------------------------------
Alexander Dahl (1):
      ARM: dts: omap: Fix schema warnings for pwm-leds

Alexander Shiyan (1):
      ARM: dts: am335x: Fix comments for AM335X_PIN_GPMC_WPN pin in GPIO mode

Carl Philipp Klemm (2):
      ARM: dts: mapphone: separate out xt894 specific things
      ARM: dts: xt875: add section for kionix kxtf9

David Lechner (2):
      ARM: dts: am33xx: Add nodes for eQEP
      ARM: dts: am335x-boneblue: Enable eQEP

H. Nikolaus Schaller (2):
      ARM: dts: pandaboard: fix pinmux for gpio user button of Pandaboard ES
      ARM: dts: pandaboard es: add bluetooth uart for HCI

Serge Semin (2):
      ARM: dts: am437x: Correct DWC USB3 compatible string
      ARM: dts: omap5: Harmonize DWC USB3 DT nodes name

Tero Kristo (1):
      ARM: dts: dra7: add second SHA instance

Tony Lindgren (1):
      Merge branch 'omap-for-v5.11/dt-mot-take2' into omap-for-v5.11/dt

 arch/arm/boot/dts/am335x-baltos.dtsi            |   2 +-
 arch/arm/boot/dts/am335x-boneblue.dts           |  54 +++++++++
 arch/arm/boot/dts/am335x-cm-t335.dts            |   2 +-
 arch/arm/boot/dts/am335x-evm.dts                |   2 +-
 arch/arm/boot/dts/am335x-igep0033.dtsi          |   2 +-
 arch/arm/boot/dts/am33xx-l4.dtsi                |  27 +++++
 arch/arm/boot/dts/am437x-l4.dtsi                |   4 +-
 arch/arm/boot/dts/dra7.dtsi                     |  34 +++++-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 141 +----------------------
 arch/arm/boot/dts/omap3-beagle-xm.dts           |  10 +-
 arch/arm/boot/dts/omap3-overo-base.dtsi         |   4 +-
 arch/arm/boot/dts/omap4-droid-bionic-xt875.dts  |  46 ++++++++
 arch/arm/boot/dts/omap4-droid4-xt894.dts        | 143 ++++++++++++++++++++++++
 arch/arm/boot/dts/omap4-kc1.dts                 |   6 +-
 arch/arm/boot/dts/omap4-panda-es.dts            |  34 +++++-
 arch/arm/boot/dts/omap4-sdp.dts                 |  26 +++--
 arch/arm/boot/dts/omap5-l4.dtsi                 |   2 +-
 17 files changed, 367 insertions(+), 172 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
