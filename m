Return-Path: <SRS0=s+W4=PV=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8E5C3DA4A
	for <soc@archiver.kernel.org>; Thu, 22 Aug 2024 08:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35503C4AF0F; Thu, 22 Aug 2024 08:52:13 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79FC5C4AF0C
	for <soc@kernel.org>; Thu, 22 Aug 2024 08:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79FC5C4AF0C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:410c:b78a:c35b:cd3e])
	by michel.telenet-ops.be with bizsmtp
	id 2ws22D00B22R5AR06ws2lE; Thu, 22 Aug 2024 10:52:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y0-000VWu-1Q;
	Thu, 22 Aug 2024 10:52:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y2-002L5p-AK;
	Thu, 22 Aug 2024 10:52:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.12
Date: Thu, 22 Aug 2024 10:51:52 +0200
Message-Id: <cover.1724316483.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724316478.git.geert+renesas@glider.be>
References: <cover.1724316478.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.12-tag1

for you to fetch changes up to 9f766e8f5c2366d7237735a826084569b5705cf4:

  dt-bindings: reset: renesas: Document RZ/G2M v3.0 (r8a774a3) reset module (2024-07-30 10:50:47 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.12

  - Document support for the Renesas RZ/G2M v3.0 (r8a774a3) SoC.

----------------------------------------------------------------
Oliver Rhodes (3):
      dt-bindings: soc: renesas: Document RZ/G2M v3.0 (r8a774a3) SoC
      dt-bindings: power: renesas: Document RZ/G2M v3.0 (r8a774a3) SYSC binding
      dt-bindings: reset: renesas: Document RZ/G2M v3.0 (r8a774a3) reset module

 .../devicetree/bindings/power/renesas,rcar-sysc.yaml         |  1 +
 Documentation/devicetree/bindings/reset/renesas,rst.yaml     |  1 +
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml   | 12 ++++++++++++
 3 files changed, 14 insertions(+)
