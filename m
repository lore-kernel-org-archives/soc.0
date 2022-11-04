Return-Path: <SRS0=hyep=3E=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AD4C4332F
	for <soc@archiver.kernel.org>; Fri,  4 Nov 2022 10:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65C84C433D7; Fri,  4 Nov 2022 10:50:15 +0000 (UTC)
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9876C433D6
	for <soc@kernel.org>; Fri,  4 Nov 2022 10:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9876C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4N3cpX16bZz4x4Lw
	for <soc@kernel.org>; Fri,  4 Nov 2022 11:50:12 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:c5ee:bf27:9df:5172])
	by michel.telenet-ops.be with bizsmtp
	id gAq32800Q2kjr6L06Aq3Nv; Fri, 04 Nov 2022 11:50:04 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oquGx-002mVL-6S; Fri, 04 Nov 2022 11:50:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oquGw-00HWF1-Oh; Fri, 04 Nov 2022 11:50:02 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v6.2
Date: Fri,  4 Nov 2022 11:49:56 +0100
Message-Id: <cover.1667558747.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667558738.git.geert+renesas@glider.be>
References: <cover.1667558738.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.2-tag1

for you to fetch changes up to b3acbca3c80e612478b354e43c1480c3fc15873e:

  soc: renesas: Kconfig: Explicitly select GPIOLIB and PINCTRL config under SOC_RENESAS (2022-10-17 12:18:49 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.2

  - Let SOC_RENESAS select GPIOLIB and PINCTRL, so this does not have to
    be handled in two (soon three: arm/arm64/riscv), places.

----------------------------------------------------------------
Lad Prabhakar (1):
      soc: renesas: Kconfig: Explicitly select GPIOLIB and PINCTRL config under SOC_RENESAS

 drivers/soc/renesas/Kconfig | 2 ++
 1 file changed, 2 insertions(+)
