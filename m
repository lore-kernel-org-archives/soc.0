Return-Path: <SRS0=hyep=3E=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EBCC4332F
	for <soc@archiver.kernel.org>; Fri,  4 Nov 2022 10:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85C17C433B5; Fri,  4 Nov 2022 10:50:09 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7285C43150
	for <soc@kernel.org>; Fri,  4 Nov 2022 10:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7285C43150
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:c5ee:bf27:9df:5172])
	by laurent.telenet-ops.be with bizsmtp
	id gAq4280132kjr6L01Aq4SS; Fri, 04 Nov 2022 11:50:04 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oquGx-002mVM-Iu; Fri, 04 Nov 2022 11:50:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oquGw-00HWF8-PG; Fri, 04 Nov 2022 11:50:02 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v6.2
Date: Fri,  4 Nov 2022 11:49:57 +0100
Message-Id: <cover.1667558749.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667558738.git.geert+renesas@glider.be>
References: <cover.1667558738.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.2-tag1

for you to fetch changes up to 7dd1d57c052e88f98b9e9145461b13bca019d108:

  dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC (2022-10-28 14:43:12 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.2

  - Move renesas.yaml from arm to soc, and document RZ/Five support.

----------------------------------------------------------------
Lad Prabhakar (2):
      dt-bindings: soc: renesas: Move renesas.yaml from arm to soc
      dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC

 Documentation/devicetree/bindings/{arm => soc/renesas}/renesas.yaml | 5 +++--
 MAINTAINERS                                                         | 1 -
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/{arm => soc/renesas}/renesas.yaml (98%)
