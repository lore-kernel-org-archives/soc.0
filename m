Return-Path: <SRS0=Ulf+=GS=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19898C433E9
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 09:46:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C093523440; Fri, 15 Jan 2021 09:46:24 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 128AB23447
	for <soc@kernel.org>; Fri, 15 Jan 2021 09:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 128AB23447
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by laurent.telenet-ops.be with bizsmtp
	id GxmN240034C55Sk01xmNVd; Fri, 15 Jan 2021 10:46:22 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1l0LgT-003iyK-KM; Fri, 15 Jan 2021 10:46:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1l0LgT-009nD6-6R; Fri, 15 Jan 2021 10:46:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DT binding updates for v5.12
Date: Fri, 15 Jan 2021 10:46:10 +0100
Message-Id: <20210115094610.2334058-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115094610.2334058-1-geert+renesas@glider.be>
References: <20210115094610.2334058-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.12-tag1

for you to fetch changes up to 0d2a7e15d7912aa27dd3366f75d181b5141ca9a2:

  dt-bindings: arm: renesas: Add Beacon RZ/G2N and RZ/G2H boards (2020-12-28 10:46:08 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v5.12

  - Document suport for the Beacon EmbeddedWorks RZ/G2N and RZ/H kits.

----------------------------------------------------------------
Adam Ford (1):
      dt-bindings: arm: renesas: Add Beacon RZ/G2N and RZ/G2H boards

 Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)
