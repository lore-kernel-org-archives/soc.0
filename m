Return-Path: <SRS0=s+W4=PV=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC4EC3DA4A
	for <soc@archiver.kernel.org>; Thu, 22 Aug 2024 08:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0B2DC4AF09; Thu, 22 Aug 2024 08:52:20 +0000 (UTC)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2ABFCC4AF0C
	for <soc@kernel.org>; Thu, 22 Aug 2024 08:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2ABFCC4AF0C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4WqH570XXcz4x5xg
	for <soc@kernel.org>; Thu, 22 Aug 2024 10:52:11 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:410c:b78a:c35b:cd3e])
	by albert.telenet-ops.be with bizsmtp
	id 2ws22D00X22R5AR06ws2yp; Thu, 22 Aug 2024 10:52:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y0-000VWr-16;
	Thu, 22 Aug 2024 10:52:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y2-002L5m-9k;
	Thu, 22 Aug 2024 10:52:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.12
Date: Thu, 22 Aug 2024 10:51:51 +0200
Message-Id: <cover.1724316480.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724316478.git.geert+renesas@glider.be>
References: <cover.1724316478.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.12-tag1

for you to fetch changes up to 84542dfad12252887bc14402f2bdc6286262cbae:

  arm64: defconfig: Enable R-Car Ethernet-TSN support (2024-08-02 11:28:21 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.12

  - Enable support for AK4619 codecs and Renesas R-Car Ethernet-TSN
    controllers in the ARM64 defconfig,
  - Enable slab hardening and kmalloc buckets in the Renesas ARM
    defconfig.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Enable slab hardening and kmalloc buckets

Kuninori Morimoto (1):
      arm64: defconfig: Enable AK4619 codec support

Niklas Söderlund (1):
      arm64: defconfig: Enable R-Car Ethernet-TSN support

 arch/arm/configs/shmobile_defconfig | 1 +
 arch/arm64/configs/defconfig        | 2 ++
 2 files changed, 3 insertions(+)
