Return-Path: <SRS0=nAAS=FB=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5856FC64E75
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 13:22:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 156DC22245; Fri, 27 Nov 2020 13:22:07 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AE0122244
	for <soc@kernel.org>; Fri, 27 Nov 2020 13:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AE0122244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by xavier.telenet-ops.be with bizsmtp
	id xRN32300D4C55Sk01RN3kC; Fri, 27 Nov 2020 14:22:04 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1kidhL-0065FO-Cl; Fri, 27 Nov 2020 14:22:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1kidhL-000K9l-0z; Fri, 27 Nov 2020 14:22:03 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL 1/3] Renesas ARM DT updates for v5.11 (take two)
Date: Fri, 27 Nov 2020 14:21:53 +0100
Message-Id: <20201127132155.77418-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201127132155.77418-1-geert@linux-m68k.org>
References: <20201127132155.77418-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 43bba65761952f58e850d918ee43b648427609bb:

  arm64: dts: renesas: hihope-rev4: Add a comment explaining switch SW2404 (2020-11-10 09:29:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.11-tag2

for you to fetch changes up to 0f80b9b8126cf3e352aa6b270ed24c9cd9a6272b:

  arm64: dts: renesas: r8a77951: Add PCIe EP nodes (2020-11-27 09:07:06 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.11 (take two)

  - PCIe endpoint support for the R-Car H3 ES2.0+ SoC.

----------------------------------------------------------------
Yuya Hamamachi (1):
      arm64: dts: renesas: r8a77951: Add PCIe EP nodes

 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
