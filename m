Return-Path: <SRS0=3pCC=TI=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAED3C4332F
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 10:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94FF0C340F5; Fri, 25 Feb 2022 10:24:49 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1944C340F4
	for <soc@kernel.org>; Fri, 25 Feb 2022 10:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1944C340F4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7d31:13ed:51c6:c7cc])
	by albert.telenet-ops.be with bizsmtp
	id zNQf260070mlTBr06NQfil; Fri, 25 Feb 2022 11:24:39 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nNXmB-0020l8-3F; Fri, 25 Feb 2022 11:24:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nNXmA-00DHXv-5a; Fri, 25 Feb 2022 11:24:38 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas driver updates for v5.18 (take two)
Date: Fri, 25 Feb 2022 11:24:34 +0100
Message-Id: <cover.1645784470.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645784465.git.geert+renesas@glider.be>
References: <cover.1645784465.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cb5508e47e60b85ac033edd8c52245ad51360eb4:

  soc: renesas: Add support for reading product revision for RZ/G2L family (2022-02-08 09:43:06 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.18-tag2

for you to fetch changes up to 088659ad2a830124407edc38da278010c95bcc96:

  soc: renesas: Kconfig: Introduce ARCH_RZG2L config option (2022-02-24 13:53:25 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.18 (take two)

  - RZ/G2L and RZ/V2L need PM and PM_GENERIC_DOMAINS,
  - Introduce ARCH_RZG2L family for RZ/G2L, RZ/G2LC, RZ/G2UL and RZ/V2L
    SoCs.

----------------------------------------------------------------
Lad Prabhakar (2):
      soc: renesas: Kconfig: Explicitly select PM and PM_GENERIC_DOMAINS configs
      soc: renesas: Kconfig: Introduce ARCH_RZG2L config option

 drivers/soc/renesas/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)
