Return-Path: <SRS0=KCga=3S=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BE2C4167D
	for <soc@archiver.kernel.org>; Fri, 18 Nov 2022 16:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29639C4314C; Fri, 18 Nov 2022 16:45:23 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77148C433B5
	for <soc@kernel.org>; Fri, 18 Nov 2022 16:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 77148C433B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
	by xavier.telenet-ops.be with bizsmtp
	id lslC2800F29fmst01slC58; Fri, 18 Nov 2022 17:45:13 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UK-000pAB-GK; Fri, 18 Nov 2022 17:45:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ow4UJ-00FrgW-Uf; Fri, 18 Nov 2022 17:45:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/7] Renesas driver updates for v6.2 (take two)
Date: Fri, 18 Nov 2022 17:45:00 +0100
Message-Id: <cover.1668788925.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668788918.git.geert+renesas@glider.be>
References: <cover.1668788918.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b3acbca3c80e612478b354e43c1480c3fc15873e:

  soc: renesas: Kconfig: Explicitly select GPIOLIB and PINCTRL config under SOC_RENESAS (2022-10-17 12:18:49 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.2-tag2

for you to fetch changes up to 7e20044052317d5f2942b061c4cacdb6790790a2:

  soc: renesas: Identify RZ/V2M SoC (2022-11-17 20:20:42 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.2 (take two)

  - Add support for identifying the SoC revision on RZ/V2M.

----------------------------------------------------------------
Phil Edworthy (1):
      soc: renesas: Identify RZ/V2M SoC

 drivers/soc/renesas/renesas-soc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
