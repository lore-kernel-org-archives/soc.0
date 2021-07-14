Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD68BC07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 09:25:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8070261106
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 09:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8070261106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pjer63mhFPRmyyRoBFs1XaMYGQgNzQxZff0U+B81owE=; b=vrSnBlzTiiAVne
	aNvR0tBRwmByGXk8ILaZBHdTZZkOaJ0rRENNs1PykjIZp0INmPwpn/+Ulabibcun9t562AYJ9ereS
	+LD9AVgqgAEinTSix90RSNcNIcopdoDuQatMFfRbxzXAJ9sOVAflo/Rd3tmm+bnrJgPO00q8kFIgZ
	bzDmz48sGeMpCCeMxMBsvGvdZFQs7mBEM8Hg9nhRzfD7ALyMtbISICgUrXdb692eauabuY7EnnvII
	XY6jIklc6BuF52hZYLaigH0ovCbZxu8b1YmnjziHFwBEVbQFk+Knwie/N3vIHToJt02RhFxj9DjWD
	n6vwKPbXiGQlTLjQBp4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3b7m-00Ct2X-Fq; Wed, 14 Jul 2021 09:24:14 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3b7h-00Ct1V-P7
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 09:24:12 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
 by albert.telenet-ops.be with bizsmtp
 id UxQ02500h1ccfby06xQ0WW; Wed, 14 Jul 2021 11:24:03 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3b7Y-0015NQ-Di; Wed, 14 Jul 2021 11:24:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3b7X-00A35F-PB; Wed, 14 Jul 2021 11:23:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v5.14
Date: Wed, 14 Jul 2021 11:23:50 +0200
Message-ID: <cover.1626253929.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_022409_997406_29CF062F 
X-CRM114-Status: GOOD (  19.37  )
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
Message-ID: <20210714092350.YgxofnDJVyxAZ6prJ3couEJhwTBHNAcpKVsaeLr5qJk@z>

	Hi soc folks,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v5.14-tag1

for you to fetch changes up to 432b52eea3dcf48083bafa4b2b6ef5b054ead609:

  ARM: shmobile: defconfig: Restore graphical consoles (2021-07-13 09:45:51 +0200)

----------------------------------------------------------------
Renesas fixes for v5.14

  - Fix a clock/reset handling design issue on the new RZ/G2L SoC,
    requiring an atomic change to DT binding definitions, clock driver,
    and DTS,
  - Restore graphical consoles in the shmobile_defconfig.

Background for the first part: after queuing the initial support for the
new Renesas RZ/G2{L,LC} SoCs for v5.14, we discovered an issue with the
way how clocks and resets are handled for modules more complex than
serial ports and i2c controllers.  Fixing that required a redesign of
the DT binding definitions, which are a hard dependency for both the
clock/reset driver and DTS.
As all future changes to the RZ/G2L clock driver and DTS files depend on
this, it would be good if this would make it for v5.14-rc2.

Sorry for the mess, and thanks for pulling!

----------------------------------------------------------------
Biju Das (5):
      clk: renesas: rzg2l: Add multi clock PM support
      clk: renesas: r9a07g044: Rename divider table
      clk: renesas: r9a07g044: Fix P1 Clock
      clk: renesas: r9a07g044: Add P2 Clock support
      dt-bindings: clock: r9a07g044-cpg: Update clock/reset definitions

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Restore graphical consoles

 arch/arm/configs/shmobile_defconfig        |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi |   4 +-
 drivers/clk/renesas/r9a07g044-cpg.c        |  79 ++++++----
 drivers/clk/renesas/renesas-rzg2l-cpg.c    | 110 +++++++-------
 drivers/clk/renesas/renesas-rzg2l-cpg.h    |  37 +++--
 include/dt-bindings/clock/r9a07g044-cpg.h  | 236 ++++++++++++++++++++++-------
 6 files changed, 320 insertions(+), 147 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
