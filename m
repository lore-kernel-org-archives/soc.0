Return-Path: <SRS0=+TGo=F3=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29C6CDB47E
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 12:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B67ECC433CD; Fri, 13 Oct 2023 12:39:39 +0000 (UTC)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACB52C433C9
	for <soc@kernel.org>; Fri, 13 Oct 2023 12:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ACB52C433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4S6R0L41ztz4x7fT
	for <soc@kernel.org>; Fri, 13 Oct 2023 14:39:30 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
	by andre.telenet-ops.be with bizsmtp
	id xQfM2A00Q56FAx301QfMUN; Fri, 13 Oct 2023 14:39:23 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qrHRl-006Gga-TO;
	Fri, 13 Oct 2023 14:39:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qrHRp-002Jnz-An;
	Fri, 13 Oct 2023 14:39:21 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.7 (take two)
Date: Fri, 13 Oct 2023 14:39:13 +0200
Message-Id: <cover.1697200119.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697200117.git.geert+renesas@glider.be>
References: <cover.1697200117.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit d2efde5cc970cd21de0f94cf03e059adc1e1311b:

  ARM: shmobile: defconfig: Refresh for v6.6-rc3 (2023-09-28 11:41:02 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.7-tag2

for you to fetch changes up to 09cfdb5a97b53d117682211a4d32a39af2e819e4:

  arm64: defconfig: Enable RZ/G3S (R9A08G045) SoC (2023-10-05 14:31:10 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.7 (take two)

  - Enable support for the Renesas RZ/G3S (R9A08G045) SoC in the arm64
    defconfig.

----------------------------------------------------------------
Claudiu Beznea (1):
      arm64: defconfig: Enable RZ/G3S (R9A08G045) SoC

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
