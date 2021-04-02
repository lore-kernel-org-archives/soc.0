Return-Path: <SRS0=C12w=I7=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F29FC433B4
	for <soc@archiver.kernel.org>; Fri,  2 Apr 2021 10:37:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F34D961107; Fri,  2 Apr 2021 10:37:30 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAEAF6112F
	for <soc@kernel.org>; Fri,  2 Apr 2021 10:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAEAF6112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
	by baptiste.telenet-ops.be with bizsmtp
	id nmdS240034A7w6i01mdSwB; Fri, 02 Apr 2021 12:37:28 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lSHB7-00CQRR-Ll; Fri, 02 Apr 2021 12:37:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lSHB7-004Bkq-0e; Fri, 02 Apr 2021 12:37:25 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas ARM DT updates for v5.13 (take two)
Date: Fri,  2 Apr 2021 12:37:15 +0200
Message-Id: <cover.1617359678.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi arm-soc folks,

The following changes since commit c8aebc1346522d3569690867ce3996642ad52e01:

  arm64: dts: renesas: r8a77980: Fix vin4-7 endpoint binding (2021-03-16 09:58:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.13-tag2

for you to fetch changes up to 2b35ca2fe605f85aa1a52c713571baf04a5f434a:

  arm64: dts: renesas: ulcb: Add cpu-supply property to a57_0 node (2021-04-02 09:22:35 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.13 (take two)

  - Video IN (VIN) and Camera (CSI-2) support for the R-Car M3-W+ SoC,
  - LED support for the Falcon development board,
  - Preparatory display pipeline support for the R-Car V3U SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Dien Pham (1):
      arm64: dts: renesas: salvator-common: Add cpu-supply property to a57_0 node

Geert Uytterhoeven (5):
      arm64: dts: renesas: falcon: Move console config to CPU board DTS
      arm64: dts: renesas: falcon: Move watchdog config to CPU board DTS
      arm64: dts: renesas: falcon: Move AVB0 to main DTS
      ARM: dts: koelsch: Configure pull-up for SOFT_SW GPIO keys
      arm64: dts: renesas: r8a77950: Drop operating points above 1.5 GHz

Kieran Bingham (3):
      arm64: dts: renesas: falcon-cpu: Add GP LEDs
      arm64: dts: renesas: r8a779a0: Add FCPVD support
      arm64: dts: renesas: r8a779a0: Add VSPD support

Niklas Söderlund (1):
      arm64: dts: renesas: r8a77961: Add VIN and CSI-2 device nodes

Yoshihiro Shimoda (1):
      arm64: dts: renesas: r8a779a0: Fix PMU interrupt

Yusuke Goda (1):
      arm64: dts: renesas: ulcb: Add cpu-supply property to a57_0 node

 arch/arm/boot/dts/r8a7791-koelsch.dts              |   8 +
 arch/arm64/boot/dts/renesas/r8a77950.dtsi          |   5 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          | 314 ++++++++++++++++++++-
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |  72 ++---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |  39 ++-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  43 ++-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   4 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   4 +
 8 files changed, 435 insertions(+), 54 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
