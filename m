Return-Path: <SRS0=6t5u=KX=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B81DC4708C
	for <soc@archiver.kernel.org>; Fri, 28 May 2021 10:35:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B948B613ED; Fri, 28 May 2021 10:35:55 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6B46139A
	for <soc@kernel.org>; Fri, 28 May 2021 10:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6B46139A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:751e:82a3:f2a2:3459])
	by baptiste.telenet-ops.be with bizsmtp
	id AAbs2500Y20MPSF01AbsAe; Fri, 28 May 2021 12:35:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lmZqK-00AD9W-Ft; Fri, 28 May 2021 12:35:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lmXtT-007G67-Sp; Fri, 28 May 2021 10:30:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM defconfig updates for v5.14
Date: Fri, 28 May 2021 10:30:49 +0200
Message-Id: <cover.1622188834.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622188833.git.geert+renesas@glider.be>
References: <cover.1622188833.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.14-tag1

for you to fetch changes up to 9558487e7d976c1b92b2bc66fb4d901b1d35437f:

  arm64: defconfig: Enable usb2_clksel for R-Car Gen3 and RZ/G2 (2021-05-25 10:04:39 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.14

  - Refresh shmobile_defconfig for v5.13-rc1
  - Enable R-Car USB2 clock selector support

----------------------------------------------------------------
Adam Ford (1):
      arm64: defconfig: Enable usb2_clksel for R-Car Gen3 and RZ/G2

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v5.13-rc1

 arch/arm/configs/shmobile_defconfig | 1 -
 arch/arm64/configs/defconfig        | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)
