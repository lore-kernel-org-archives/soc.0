Return-Path: <SRS0=+TGo=F3=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D78DCDB483
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 12:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D8EBC433CA; Fri, 13 Oct 2023 12:39:40 +0000 (UTC)
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EFF7DC433C7
	for <soc@kernel.org>; Fri, 13 Oct 2023 12:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EFF7DC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4S6R0K4fTxz4x1qH
	for <soc@kernel.org>; Fri, 13 Oct 2023 14:39:29 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
	by baptiste.telenet-ops.be with bizsmtp
	id xQfM2A00856FAx301QfML5; Fri, 13 Oct 2023 14:39:21 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qrHRl-006Ggc-Tb;
	Fri, 13 Oct 2023 14:39:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qrHRp-002Jo2-BP;
	Fri, 13 Oct 2023 14:39:21 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.7 (take two)
Date: Fri, 13 Oct 2023 14:39:14 +0200
Message-Id: <cover.1697200121.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697200117.git.geert+renesas@glider.be>
References: <cover.1697200117.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 111287aa60004e1a58320048c89391056288c455:

  dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3S SoC (2023-09-18 09:50:30 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.7-tag2

for you to fetch changes up to c0a2c7619666ae857a52219f344fbaa915cd181a:

  dt-bindings: soc: renesas: Document R-Car S4 Starter Kit (2023-10-05 11:37:42 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.7 (take two)

  - Document support for the Renesas RZ/G3S SMARC SoM and SMARC
    Carrier-II EVK development boards,
  - Document support for the Renesas R-Car S4 Starter Kit.

----------------------------------------------------------------
Claudiu Beznea (2):
      dt-bindings: soc: renesas: Document RZ/G3S SMARC SoM
      dt-bindings: soc: renesas: Document SMARC Carrier-II EVK

Kuninori Morimoto (1):
      dt-bindings: soc: renesas: Document R-Car S4 Starter Kit

 .../devicetree/bindings/soc/renesas/renesas.yaml     | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
