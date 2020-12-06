Return-Path: <SRS0=0k5v=FK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993EEC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Dec 2020 01:40:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C3622D2A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Dec 2020 01:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17C3622D2A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aGv3XxWVMXMRYHCcW54SRwvemksS9wng92LoA2qwXD4=; b=CrOYNLzc0sCTIYZjxA47Jl0sXk
	RmT7LcTN5Wv7QSuQCBUlnTBVJ9M0tOuk5PLg4OFkZ1WfcToLF9f0sMrW1ZMPffHnmuAnI7O3bQ9VF
	l6t7mk5FLiJbHk+/DYSOAtW7EQNdRlKl2uJnx3aYZKOo3EvP42TYbvgwczKoVi8SJn4wUhSlyVMPR
	JrLJnsfZFCBKIKrJ3kleJB8Hq1zV5fQ/vK12Mhq5cAPe2bz0gfJXJv6FKiBh3XRreCO8C9CQsXMGV
	GI/L7VNP7QGJO/GAiesHFADnHr/mZuuaxCM/OGDnG35y/rjbF2emArv9+4zBM/gbjqGP5tZnUKlje
	WuoWCzZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klj0k-0000Ps-Os; Sun, 06 Dec 2020 01:38:50 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klj0g-0000PP-UE
 for linux-arm-kernel@lists.infradead.org; Sun, 06 Dec 2020 01:38:48 +0000
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 61E80100003;
 Sun,  6 Dec 2020 01:38:40 +0000 (UTC)
Date: Sun, 6 Dec 2020 02:38:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] ARM: at91: DT for 5.11 #2
Message-ID: <20201206013840.GA627225@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_203847_125600_ECA19B4C 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201206013840.qUZRQXquX33kxg7iYOgB5DeppO77NTCvMp1cKPuNl74@z>

Arnd, Olof,

Here is a second round of DT updates, Some are following patches series
that made it in other subsystems and it would be nice to have them in
the same release. Other are fixes worth having in v5.11.

The following changes since commit e1062fa7292f1e3744db0a487c4ac0109e09b03d:

  ARM: dts: at91: sama5d3_xplained: add pincontrol for USB Host (2020-11-24 12:11:27 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux tags/at91-dt-5.11-2

for you to fetch changes up to 85b8350ae99d1300eb6dc072459246c2649a8e50:

  ARM: dts: at91: sama5d2: fix CAN message ram offset and size (2020-12-03 21:44:36 +0100)

----------------------------------------------------------------
AT91 DT for 5.11 #2:

 - switch to new TCB PWM bindings
 - rework ADC bindings
 - fix sama5d2 securam and can1

----------------------------------------------------------------
Alexandre Belloni (4):
      ARM: dts: at91: kizbox: switch to new pwm-atmel-tcb binding
      ARM: dts: at91: sama5d3: use proper ADC compatible
      ARM: dts: at91: at91sam9rl: fix ADC triggers
      ARM: dts: at91: remove deprecated ADC properties

Claudiu Beznea (2):
      ARM: dts: at91: sam9x60ek: remove bypass property
      ARM: dts: at91: sama5d2: map securam as device

Nicolas Ferre (1):
      ARM: dts: at91: sama5d2: fix CAN message ram offset and size

 arch/arm/boot/dts/at91-kizbox.dts    | 45 ++++++++++++++++++++++++------------
 arch/arm/boot/dts/at91-sam9x60ek.dts |  4 ----
 arch/arm/boot/dts/at91sam9260.dtsi   | 25 --------------------
 arch/arm/boot/dts/at91sam9g45.dtsi   | 27 ----------------------
 arch/arm/boot/dts/at91sam9rl.dtsi    | 25 --------------------
 arch/arm/boot/dts/at91sam9x5.dtsi    | 28 ----------------------
 arch/arm/boot/dts/sama5d2.dtsi       |  7 +++---
 arch/arm/boot/dts/sama5d3.dtsi       | 26 +--------------------
 arch/arm/boot/dts/sama5d4.dtsi       | 22 ------------------
 9 files changed, 35 insertions(+), 174 deletions(-)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
