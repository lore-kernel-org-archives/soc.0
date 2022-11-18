Return-Path: <SRS0=KCga=3S=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7495BC4332F
	for <soc@archiver.kernel.org>; Fri, 18 Nov 2022 16:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4803DC43145; Fri, 18 Nov 2022 16:45:33 +0000 (UTC)
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55F79C433C1
	for <soc@kernel.org>; Fri, 18 Nov 2022 16:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55F79C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4NDN1v2zQLz4x7k8
	for <soc@kernel.org>; Fri, 18 Nov 2022 17:45:23 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
	by andre.telenet-ops.be with bizsmtp
	id lslD2800229fmst01slDAx; Fri, 18 Nov 2022 17:45:14 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UK-000pAC-RR; Fri, 18 Nov 2022 17:45:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UJ-00Frgd-VK; Fri, 18 Nov 2022 17:45:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/7] Renesas DT binding updates for v6.2 (take two)
Date: Fri, 18 Nov 2022 17:45:01 +0100
Message-Id: <cover.1668788927.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668788918.git.geert+renesas@glider.be>
References: <cover.1668788918.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 7dd1d57c052e88f98b9e9145461b13bca019d108:

  dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC (2022-10-28 14:43:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.2-tag2

for you to fetch changes up to a884f187760ee0c6033296aa50845e2d1e0e8430:

  dt-bindings: arm: renesas: Document Renesas RZ/V2M System Configuration (2022-11-17 20:18:21 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.2 (take two)

  - Document support for the Andes Technology AX45MP RISC-V CPU Core, as
    used on the Renesas RZ/Five SoC,
  - Document support for the Renesas RZ/V2M System Configuration.

----------------------------------------------------------------
Lad Prabhakar (2):
      dt-bindings: riscv: Sort the CPU core list alphabetically
      dt-bindings: riscv: Add Andes AX45MP core to the list

Phil Edworthy (1):
      dt-bindings: arm: renesas: Document Renesas RZ/V2M System Configuration

 Documentation/devicetree/bindings/riscv/cpus.yaml  | 11 +++---
 .../soc/renesas/renesas,r9a09g011-sys.yaml         | 43 ++++++++++++++++++++++
 2 files changed, 49 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g011-sys.yaml
