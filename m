Return-Path: <SRS0=00RE=BP=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BEEC7EE2F
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 09:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB973C433D2; Fri, 26 May 2023 09:48:45 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA018C433A0
	for <soc@kernel.org>; Fri, 26 May 2023 09:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA018C433A0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:ae30:9d2b:3228:d21])
	by andre.telenet-ops.be with bizsmtp
	id 1Moc2A00A4eYoVn01MocrB; Fri, 26 May 2023 11:48:36 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q2U3X-0038ju-KZ;
	Fri, 26 May 2023 11:48:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q2U3o-00EFZc-5E;
	Fri, 26 May 2023 11:48:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.5
Date: Fri, 26 May 2023 11:48:31 +0200
Message-Id: <cover.1685094244.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685094238.git.geert+renesas@glider.be>
References: <cover.1685094238.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.5-tag1

for you to fetch changes up to 18cbbdd846c5d74bd56fd1f229d074e1f7068fc8:

  arm64: dts: renesas: r8a779a0: Add PWM nodes (2023-05-08 09:21:51 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.5

  - Add partial display support for the RZ/G2L and RZ/V2L SoCs and the
    RZ/G2L{,C} SMARC EVK development boards,
  - Add camera support for the RZ/GV2L SoC and the RZ/V2L and RZ/G2LC
    SMARC EVK development boards,
  - Add Multi-Function Timer Pulse Unit 3 support for the RZ/G2L and
    RZ/V2L SoCs,
  - Add PWM support for the R-Car V3U SoC.

----------------------------------------------------------------
Biju Das (10):
      arm64: dts: renesas: r9a07g044: Add fcpvd node
      arm64: dts: renesas: r9a07g054: Add fcpvd node
      arm64: dts: renesas: r9a07g044: Add vspd node
      arm64: dts: renesas: r9a07g054: Add vspd node
      arm64: dts: renesas: r9a07g044: Add DSI node
      arm64: dts: renesas: r9a07g054: Add DSI node
      arm64: dts: renesas: rzg2l-smarc: Link DSI with ADV7535
      arm64: dts: renesas: rzg2lc-smarc: Link DSI with ADV7535
      arm64: dts: renesas: r9a07g044: Add MTU3a node
      arm64: dts: renesas: r9a07g054: Add MTU3a node

Lad Prabhakar (3):
      arm64: dts: renesas: r9a07g054: Add CSI and CRU nodes
      arm64: dts: renesas: rzv2l-smarc: Enable CRU, CSI support
      arm64: dts: renesas: rzg2lc-smarc: Enable CRU, CSI support

Phong Hoang (1):
      arm64: dts: renesas: r8a779a0: Add PWM nodes

 arch/arm64/boot/dts/renesas/Makefile               |   2 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  50 +++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         | 123 +++++++++++++
 .../renesas/r9a07g044c2-smarc-cru-csi-ov5645.dtso  |  21 +++
 .../renesas/r9a07g044l2-smarc-cru-csi-ov5645.dtso  |   2 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         | 203 +++++++++++++++++++++
 .../renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtso  |   1 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |  79 ++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |  79 ++++++++
 9 files changed, 559 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc-cru-csi-ov5645.dtso
 create mode 120000 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtso
