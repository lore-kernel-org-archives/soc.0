Return-Path: <SRS0=TaMd=W7=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAEAC43334
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 12:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0B61C341CA; Fri, 24 Jun 2022 12:01:58 +0000 (UTC)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F394CC341CB
	for <soc@kernel.org>; Fri, 24 Jun 2022 12:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F394CC341CB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4LTwhY3385z4x11Q
	for <soc@kernel.org>; Fri, 24 Jun 2022 14:01:49 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.186.194])
	by michel.telenet-ops.be with bizsmtp
	id n01e2700D4C55Sk0601eDA; Fri, 24 Jun 2022 14:01:42 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o4i0I-000gWZ-8o; Fri, 24 Jun 2022 14:01:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o4i0H-009mq1-Rr; Fri, 24 Jun 2022 14:01:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v5.20
Date: Fri, 24 Jun 2022 14:01:29 +0200
Message-Id: <cover.1656069632.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656069631.git.geert+renesas@glider.be>
References: <cover.1656069631.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.20-tag1

for you to fetch changes up to 7e1ab5a8a3b51c9d819246987a4710a759c3cc67:

  arm64: defconfig: Enable R8A779G0 SoC (2022-06-13 11:02:47 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.20

  - Enable support for the Renesas R-Car V4H SoC,
  - Refresh shmobile_defconfig for v5.19-rc1.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Refresh for v5.19-rc1
      arm64: defconfig: Enable R8A779G0 SoC

 arch/arm/configs/shmobile_defconfig | 4 +++-
 arch/arm64/configs/defconfig        | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)
