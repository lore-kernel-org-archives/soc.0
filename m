Return-Path: <SRS0=GdFq=DO=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C378C00528
	for <soc@archiver.kernel.org>; Fri, 28 Jul 2023 11:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11E91C433D9; Fri, 28 Jul 2023 11:57:13 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26245C433C9
	for <soc@kernel.org>; Fri, 28 Jul 2023 11:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26245C433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
	by laurent.telenet-ops.be with bizsmtp
	id Sbx62A0060d1nm801bx66Z; Fri, 28 Jul 2023 13:57:07 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qPM5U-002mIj-Mv;
	Fri, 28 Jul 2023 13:57:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qPM5h-00AqNm-S1;
	Fri, 28 Jul 2023 13:57:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas ARM SoC updates for v6.6
Date: Fri, 28 Jul 2023 13:57:01 +0200
Message-Id: <cover.1690545142.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690545139.git.geert+renesas@glider.be>
References: <cover.1690545139.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v6.6-tag1

for you to fetch changes up to bfb345a7bdc186ebbf2b9c53215f0f7b9bdba9fd:

  ARM: shmobile: rcar-gen2: Drop unused OF includes (2023-07-25 11:11:42 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v6.6

  -   Drop unused OF includes.

----------------------------------------------------------------
Rob Herring (1):
      ARM: shmobile: rcar-gen2: Drop unused OF includes

 arch/arm/mach-shmobile/setup-rcar-gen2.c | 1 -
 1 file changed, 1 deletion(-)
