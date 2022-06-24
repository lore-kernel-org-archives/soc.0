Return-Path: <SRS0=TaMd=W7=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C7ECCA481
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 12:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A03B6C3411C; Fri, 24 Jun 2022 12:01:58 +0000 (UTC)
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73654C341CA
	for <soc@kernel.org>; Fri, 24 Jun 2022 12:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73654C341CA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4LTwhW2x8qz4wwr3
	for <soc@kernel.org>; Fri, 24 Jun 2022 14:01:47 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.186.194])
	by albert.telenet-ops.be with bizsmtp
	id n01e2700D4C55Sk0601e0F; Fri, 24 Jun 2022 14:01:40 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o4i0I-000gWb-Dd; Fri, 24 Jun 2022 14:01:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o4i0H-009mqF-T5; Fri, 24 Jun 2022 14:01:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v5.20
Date: Fri, 24 Jun 2022 14:01:31 +0200
Message-Id: <cover.1656069638.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656069631.git.geert+renesas@glider.be>
References: <cover.1656069631.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.20-tag1

for you to fetch changes up to 4f5bc54d28ecd0739c99dc71ed93c2ebb5d9ba32:

  soc: renesas: rcar-sysc: Optimize rcar_sysc_area struct sizes (2022-06-13 11:43:50 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.20

  - Small fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      soc: renesas: r8a779a0-sysc: Fix A2DP1 and A2CV[2357] PDR values
      soc: renesas: rcar-sysc: Optimize rcar_sysc_area struct sizes

 drivers/soc/renesas/r8a779a0-sysc.c  | 10 +++++-----
 drivers/soc/renesas/rcar-gen4-sysc.h |  4 ++--
 drivers/soc/renesas/rcar-sysc.h      |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)
