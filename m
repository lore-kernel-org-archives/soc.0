Return-Path: <SRS0=B8S/=JS=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E85C4829D
	for <soc@archiver.kernel.org>; Fri,  9 Feb 2024 16:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8B22C43399; Fri,  9 Feb 2024 16:55:20 +0000 (UTC)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A049AC43394
	for <soc@kernel.org>; Fri,  9 Feb 2024 16:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A049AC43394
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4TWg2M3n8Kz4wyFV
	for <soc@kernel.org>; Fri,  9 Feb 2024 17:55:07 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:55fd:ff17:c1c8:954d])
	by andre.telenet-ops.be with bizsmtp
	id l4uy2B00K4RKXn6014uyDb; Fri, 09 Feb 2024 17:55:00 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9O-0008Gd-8k;
	Fri, 09 Feb 2024 17:54:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9S-0061GR-Gu;
	Fri, 09 Feb 2024 17:54:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v6.9
Date: Fri,  9 Feb 2024 17:54:52 +0100
Message-Id: <cover.1707487832.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707487826.git.geert+renesas@glider.be>
References: <cover.1707487826.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.9-tag1

for you to fetch changes up to 49558e814fefdf33bf0b2d1c46c30d6a3f9634f3:

  dt-bindings: soc: renesas: Document R-Car V4M Gray Hawk Single (2024-01-31 15:06:52 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.9

  - Document support for the Renesas R-Car V4M (R8A779H0) SoC, and the
    White Hawk Single and Gray Hawk Single development boards.

----------------------------------------------------------------
Geert Uytterhoeven (3):
      dt-bindings: soc: renesas: Document R-Car V4H White Hawk Single
      dt-bindings: reset: renesas,rst: Document R-Car V4M support
      dt-bindings: soc: renesas: Document R-Car V4M Gray Hawk Single

 Documentation/devicetree/bindings/reset/renesas,rst.yaml   |  1 +
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 13 +++++++++++++
 2 files changed, 14 insertions(+)
