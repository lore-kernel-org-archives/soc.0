Return-Path: <SRS0=kxyi=FN=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD6CE80A98
	for <soc@archiver.kernel.org>; Fri, 29 Sep 2023 11:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1175AC433C9; Fri, 29 Sep 2023 11:10:33 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1A20C433C7
	for <soc@kernel.org>; Fri, 29 Sep 2023 11:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1A20C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c2e7:1eb0:4c87:ebc6])
	by albert.telenet-ops.be with bizsmtp
	id rnAN2A00B1EgHdD06nANVH; Fri, 29 Sep 2023 13:10:22 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qmBNd-004qNi-5T;
	Fri, 29 Sep 2023 13:10:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qmBO2-001frF-5B;
	Fri, 29 Sep 2023 13:10:22 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/5] Renesas DT binding updates for v6.7
Date: Fri, 29 Sep 2023 13:10:14 +0200
Message-Id: <cover.1695985425.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695985418.git.geert+renesas@glider.be>
References: <cover.1695985418.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.7-tag1

for you to fetch changes up to 111287aa60004e1a58320048c89391056288c455:

  dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3S SoC (2023-09-18 09:50:30 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.7

  - Document support for the new RZ/G3S (R9A08G045) SoC variants.

----------------------------------------------------------------
Claudiu Beznea (2):
      dt-bindings: soc: renesas: Document Renesas RZ/G3S SoC variants
      dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3S SoC

 .../devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml         | 1 +
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml          | 6 ++++++
 2 files changed, 7 insertions(+)
