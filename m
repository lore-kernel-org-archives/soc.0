Return-Path: <SRS0=dswN=7T=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5938BC7619A
	for <soc@archiver.kernel.org>; Mon, 27 Mar 2023 08:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D8ECC433D2; Mon, 27 Mar 2023 08:57:20 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2220C4339B
	for <soc@kernel.org>; Mon, 27 Mar 2023 08:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2220C4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.187.55])
	by albert.telenet-ops.be with bizsmtp
	id dLx82900S1C8whw06Lx8Zd; Mon, 27 Mar 2023 10:57:10 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pgieO-00ExZ3-TN;
	Mon, 27 Mar 2023 10:57:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pgif6-002atq-EB;
	Mon, 27 Mar 2023 10:57:08 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v6.4
Date: Mon, 27 Mar 2023 10:57:03 +0200
Message-Id: <cover.1679907062.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679907055.git.geert+renesas@glider.be>
References: <cover.1679907055.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.4-tag1

for you to fetch changes up to d35ad1030a6bce57234b8eea14ab17560f3c9e1b:

  dt-bindings: soc: renesas: Remove R-Car H3 ES1.* (2023-03-10 17:05:22 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.4

  - Document support for the Renesas RZ/N1 EB board with an RZ/N1D-DB
    daughter board,
  - Drop support for the obsolete R-Car H3 ES1.* (R8A77950) SoC.

----------------------------------------------------------------
Clément Léger (1):
      dt-bindings: soc: renesas: renesas.yaml: Add renesas,rzn1d400-eb compatible

Wolfram Sang (1):
      dt-bindings: soc: renesas: Remove R-Car H3 ES1.*

 .../devicetree/bindings/soc/renesas/renesas.yaml          | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)
