Return-Path: <SRS0=F+Ro=B5=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDE9C7EE25
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 10:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87ED7C43446; Fri,  9 Jun 2023 10:06:54 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65A19C433D2
	for <soc@kernel.org>; Fri,  9 Jun 2023 10:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65A19C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
	by laurent.telenet-ops.be with bizsmtp
	id 6y6i2A00312zQ4r01y6i7A; Fri, 09 Jun 2023 12:06:42 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q7Z0d-008L2N-2W;
	Fri, 09 Jun 2023 12:06:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q7Z10-00G42w-3m;
	Fri, 09 Jun 2023 12:06:42 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.5 (take two)
Date: Fri,  9 Jun 2023 12:06:38 +0200
Message-Id: <cover.1686304614.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686304609.git.geert+renesas@glider.be>
References: <cover.1686304609.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 18cbbdd846c5d74bd56fd1f229d074e1f7068fc8:

  arm64: dts: renesas: r8a779a0: Add PWM nodes (2023-05-08 09:21:51 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.5-tag2

for you to fetch changes up to c776a2128dee50a9f10eace4a14ff894e1432a31:

  arm64: dts: renesas: ulcb-kf: Add HSCIF1 node (2023-06-02 11:36:48 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.5 (take two)

  - Add IOMMU support for PCIe devices on R-Car Gen3 and RZ/G2 SoCs,
  - Add HSCIF1 serial port support on Renesas ULCB boards equipped with
    the Shimafuji Kingfisher extension,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: dts: iwg20d-q7-common: Fix backlight pwm specifier

Wolfram Sang (2):
      arm64: dts: renesas: ulcb-kf: Remove flow control for SCIF1
      arm64: dts: renesas: ulcb-kf: Add HSCIF1 node

Yoshihiro Shimoda (1):
      arm64: dts: renesas: Add IOMMU related properties into PCIe host nodes

 arch/arm/boot/dts/iwg20d-q7-common.dtsi   |  2 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi |  6 ++++--
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |  5 ++++-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi |  6 ++++--
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi  | 17 +++++++++++++++--
 12 files changed, 84 insertions(+), 36 deletions(-)
