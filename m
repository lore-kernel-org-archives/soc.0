Return-Path: <SRS0=YIfF=VO=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7055C433FE
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 09:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 956C3C385BA; Fri,  6 May 2022 09:32:31 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0405C385B1
	for <soc@kernel.org>; Fri,  6 May 2022 09:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0405C385B1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:287c:a0f:7d45:dc7b])
	by laurent.telenet-ops.be with bizsmtp
	id TMYL2700d1UVucw01MYLdF; Fri, 06 May 2022 11:32:22 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nmuJw-0038XB-90; Fri, 06 May 2022 11:32:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nmuJv-00Aek9-QI; Fri, 06 May 2022 11:32:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/5] Renesas ARM defconfig updates for v5.19 (take two)
Date: Fri,  6 May 2022 11:32:12 +0200
Message-Id: <cover.1651828601.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651828600.git.geert+renesas@glider.be>
References: <cover.1651828600.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit dcc1449554ba8e49880507c7b761559022363bdd:

  ARM: shmobile: defconfig: Refresh for v5.18-rc1 (2022-04-19 10:36:23 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.19-tag2

for you to fetch changes up to 0b8842db35518714942fe23c13f92778d58eb085:

  arm64: defconfig: Enable Renesas RZ/V2M SoC (2022-04-28 16:56:57 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.19 (take two)

  - Enable support for the Renesas RZ/G2UL and RZ/V2M SoCs in the arm64
    defconfig,

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: Enable ARCH_R9A07G043

Phil Edworthy (1):
      arm64: defconfig: Enable Renesas RZ/V2M SoC

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
