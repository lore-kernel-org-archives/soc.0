Return-Path: <SRS0=tBpQ=S2=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D53C433EF
	for <soc@archiver.kernel.org>; Fri, 11 Feb 2022 14:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC0E8C340E9; Fri, 11 Feb 2022 14:19:59 +0000 (UTC)
Received: from newton.telenet-ops.be (newton.telenet-ops.be [195.130.132.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22C7EC340F0
	for <soc@kernel.org>; Fri, 11 Feb 2022 14:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22C7EC340F0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by newton.telenet-ops.be (Postfix) with ESMTPS id 4JwG393C4mzMr9SW
	for <soc@kernel.org>; Fri, 11 Feb 2022 15:19:49 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d5d:ef67:a872:c0be])
	by albert.telenet-ops.be with bizsmtp
	id tqKi260043ZSXJh06qKiu0; Fri, 11 Feb 2022 15:19:42 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nIWlx-000M8j-KY; Fri, 11 Feb 2022 15:19:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nIWLx-00Gh94-Nh; Fri, 11 Feb 2022 14:52:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.18
Date: Fri, 11 Feb 2022 14:52:14 +0100
Message-Id: <cover.1644587209.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644587197.git.geert+renesas@glider.be>
References: <cover.1644587197.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.18-tag1

for you to fetch changes up to 4b4a0fd666303a06bbe159552bc055b490b77cdc:

  dt-bindings: power: renesas,rzg2l-sysc: Document RZ/V2L SoC (2022-01-24 10:45:14 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v5.18

  - Document support for the new RZ/V2L SoC and the RZ/V2L SMARC EVK
    board.

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: arm: renesas: Document Renesas RZ/V2L SoC on SMARC EVK
      dt-bindings: power: renesas,rzg2l-sysc: Document RZ/V2L SoC

 Documentation/devicetree/bindings/arm/renesas.yaml              | 9 +++++++++
 Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml | 7 ++++---
 2 files changed, 13 insertions(+), 3 deletions(-)
