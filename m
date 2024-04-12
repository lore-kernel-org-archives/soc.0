Return-Path: <SRS0=8Gze=LR=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269CDC4345F
	for <soc@archiver.kernel.org>; Fri, 12 Apr 2024 10:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01392C4AF07; Fri, 12 Apr 2024 10:49:09 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B80AC4AF0B
	for <soc@kernel.org>; Fri, 12 Apr 2024 10:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8B80AC4AF0B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by michel.telenet-ops.be with bizsmtp
	id AAox2C00L0SSLxL06Aox05; Fri, 12 Apr 2024 12:48:59 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvESG-00GpBx-0q;
	Fri, 12 Apr 2024 12:48:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvDj5-004eQQ-SH;
	Fri, 12 Apr 2024 12:01:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v6.10
Date: Fri, 12 Apr 2024 12:01:39 +0200
Message-Id: <cover.1712915534.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712915528.git.geert+renesas@glider.be>
References: <cover.1712915528.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.10-tag1

for you to fetch changes up to d4319f220f577156200ad43c823e22be05f34523:

  dt-bindings: arm: renesas: Document Renesas RZ/V2H(P) System Controller (2024-03-26 09:33:29 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.10

  - Document support for the Renesas RZ/V2H(P) (R9A09G057) SoC variants.

----------------------------------------------------------------
Lad Prabhakar (2):
      dt-bindings: soc: renesas: Document Renesas RZ/V2H(P) SoC variants
      dt-bindings: arm: renesas: Document Renesas RZ/V2H(P) System Controller

 .../soc/renesas/renesas,r9a09g057-sys.yaml         | 51 ++++++++++++++++++++++
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  8 ++++
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
