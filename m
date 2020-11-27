Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BC4C63777
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 22:05:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2153D221FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 22:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X4BZe5rs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2153D221FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IEXgIZHijmhLZ1g1Y5zWemRHfNJz/2d0A177412eLyE=; b=X4BZe5rslgW8bihluLdBuQ1TBh
	/HdsJVNqE2EYNXs1seoxWRCnwTB2K87w5f8oJ54V32Ua4GyOyZkDa2OHLWvEfWjtwhulMvnfQhByd
	xEdJrfTSVfYj3oMGbcUVUZCq0mMQlLAfWg9HUcHCzZ+yA75wQlp9ppRD/cK7SwdBe0igMzheIX11C
	H9OkiJCuuMkNqk6N+ZZzYLkFfhpCv/G2C25S606UlnshB9ETWXXv/9OgzQCOtrksxkNvDc7buxPkn
	ugWBiFc4aWAMeVZ0QpwtAmXGw9PYsOWQpte7pjjcWhJk2TAQutt+GZh1cA4iDWhyrPzHG6Q0FaZ2n
	/yiQAERA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kilqa-0006CE-Rz; Fri, 27 Nov 2020 22:04:08 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kilqX-0006Bl-CO
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 22:04:06 +0000
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A4EB4240002;
 Fri, 27 Nov 2020 22:04:03 +0000 (UTC)
Date: Fri, 27 Nov 2020 23:04:03 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] ARM: at91: DT for 5.11
Message-ID: <20201127220403.GA1735041@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_170405_850300_D327218E 
X-CRM114-Status: GOOD (  11.46  )
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
Message-ID: <20201127220403.yvSRlUEFpSvW9Xt6rihR_askfr-GP_XQcm8PtK542v0@z>

Arnd, Olof,

Here are the DT changes for 5.11 which contains non urgent fixes.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux tags/at91-dt-5.11

for you to fetch changes up to e1062fa7292f1e3744db0a487c4ac0109e09b03d:

  ARM: dts: at91: sama5d3_xplained: add pincontrol for USB Host (2020-11-24 12:11:27 +0100)

----------------------------------------------------------------
AT91 DT for 5.11:

 - fix USB host pinctrl
 - fix DT schema warnings

----------------------------------------------------------------
Alexander Dahl (2):
      ARM: dts: at91: smartkiz: Reference led node directly
      ARM: dts: at91: Fix schema warnings for pwm-leds

Bartosz Golaszewski (1):
      ARM: dts: at91: at91-sama5d27_som1: fix EEPROM compatible

Cristian Birsan (3):
      ARM: dts: at91: sam9x60: add pincontrol for USB Host
      ARM: dts: at91: sama5d4_xplained: add pincontrol for USB Host
      ARM: dts: at91: sama5d3_xplained: add pincontrol for USB Host

 arch/arm/boot/dts/at91-kizbox.dts             | 10 +++++-----
 arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 ++++----
 arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++++--------
 arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++++-----
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 ++++----
 arch/arm/boot/dts/at91-sam9x60ek.dts          |  9 +++++++++
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi     |  2 +-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts   |  7 +++++++
 arch/arm/boot/dts/at91-sama5d4_xplained.dts   |  7 +++++++
 arch/arm/boot/dts/at91-smartkiz.dts           |  6 ++----
 arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++++-----
 arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++++-----
 12 files changed, 62 insertions(+), 41 deletions(-)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
