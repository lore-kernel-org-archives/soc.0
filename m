Return-Path: <SRS0=dswN=7T=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E85C7619A
	for <soc@archiver.kernel.org>; Mon, 27 Mar 2023 08:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E471AC433A1; Mon, 27 Mar 2023 08:57:27 +0000 (UTC)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6163DC4339C
	for <soc@kernel.org>; Mon, 27 Mar 2023 08:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6163DC4339C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4PlRXF40BSz4x1G9
	for <soc@kernel.org>; Mon, 27 Mar 2023 10:57:17 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
	by andre.telenet-ops.be with bizsmtp
	id dLx82900Q1C8whw01Lx81N; Mon, 27 Mar 2023 10:57:10 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pgieO-00ExYx-Ri;
	Mon, 27 Mar 2023 10:57:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pgif6-002ath-Cd;
	Mon, 27 Mar 2023 10:57:08 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v6.4
Date: Mon, 27 Mar 2023 10:57:01 +0200
Message-Id: <cover.1679907057.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679907055.git.geert+renesas@glider.be>
References: <cover.1679907055.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.4-tag1

for you to fetch changes up to 93582bdfd0cf5aeeb4451ade1076a455c53d8a85:

  arm64: defconfig: Enable RZ/V2M xHCI and USB3.1 DRD controller support (2023-03-10 16:41:43 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.4

  - Enable support for the Dialog Semiconductor DA7213 Codec, and the
    Renesas RZ/V2M xHCI and USB3.1 DRD controllers in the arm64
    defconfig,
  - Disable support for the obsolete R-Car H3 ES1.* (R8A77950) SoC in
    the arm64 defconfig,
  - Refresh shmobile_defconfig for v6.3-rc1,
  - Enable additional support for RZ/N1 platforms in multi_v7_defconfig.

----------------------------------------------------------------
Geert Uytterhoeven (3):
      ARM: shmobile: defconfig: Refresh for v6.3-rc1
      ARM: multi_v7_defconfig: Enable additional support for RZ/N1 platforms
      arm64: defconfig: Enable RZ/V2M xHCI and USB3.1 DRD controller support

Kuninori Morimoto (1):
      arm64: defconfig: Enable DA7213 Codec

Wolfram Sang (1):
      arm64: defconfig: Disable R-Car H3 ES1.*

 arch/arm/configs/multi_v7_defconfig | 6 ++++++
 arch/arm/configs/shmobile_defconfig | 2 ++
 arch/arm64/configs/defconfig        | 4 +++-
 3 files changed, 11 insertions(+), 1 deletion(-)
