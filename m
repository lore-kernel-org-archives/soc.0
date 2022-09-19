Return-Path: <SRS0=xMIe=ZW=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F59C54EE9
	for <soc@archiver.kernel.org>; Mon, 19 Sep 2022 12:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DFC52C43470; Mon, 19 Sep 2022 12:04:14 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C3A4C433D7
	for <soc@kernel.org>; Mon, 19 Sep 2022 12:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C3A4C433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:ed67:3be8:ebe5:696d])
	by andre.telenet-ops.be with bizsmtp
	id Mo432800Z0GZoLL01o43sy; Mon, 19 Sep 2022 14:04:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oaFVL-005cI7-8O; Mon, 19 Sep 2022 14:04:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oaFVK-00GClw-QJ; Mon, 19 Sep 2022 14:04:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas ARM SoC updates for v6.1
Date: Mon, 19 Sep 2022 14:03:55 +0200
Message-Id: <cover.1663588781.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663588772.git.geert+renesas@glider.be>
References: <cover.1663588772.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v6.1-tag1

for you to fetch changes up to c2ce1e734282662c0b3117e4f26b831d30370bcb:

  ARM: shmobile: Drop selecting SOC_BUS (2022-09-18 14:51:10 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v6.1

  - Drop superfluous selects of SOC_BUS.

----------------------------------------------------------------
Lad Prabhakar (2):
      arm64: renesas: Drop selecting SOC_BUS
      ARM: shmobile: Drop selecting SOC_BUS

 arch/arm/mach-shmobile/Kconfig | 1 -
 arch/arm64/Kconfig.platforms   | 1 -
 2 files changed, 2 deletions(-)
