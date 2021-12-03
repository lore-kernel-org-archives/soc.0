Return-Path: <SRS0=3L+D=QU=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C2EC433FE
	for <soc@archiver.kernel.org>; Fri,  3 Dec 2021 11:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A48B9C53FAD; Fri,  3 Dec 2021 11:31:44 +0000 (UTC)
Received: from newton.telenet-ops.be (newton.telenet-ops.be [195.130.132.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C728C53FD2
	for <soc@kernel.org>; Fri,  3 Dec 2021 11:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C728C53FD2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by newton.telenet-ops.be (Postfix) with ESMTPS id 4J59dN3svvzMr311
	for <soc@kernel.org>; Fri,  3 Dec 2021 12:31:36 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:3191:9890:620a:6f4])
	by xavier.telenet-ops.be with bizsmtp
	id RnXV2600K3eLghq01nXVDH; Fri, 03 Dec 2021 12:31:29 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mt6mn-002IYi-0F; Fri, 03 Dec 2021 12:31:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mt6mm-000hRL-9g; Fri, 03 Dec 2021 12:31:28 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v5.17
Date: Fri,  3 Dec 2021 12:31:20 +0100
Message-Id: <cover.1638530612.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638530605.git.geert+renesas@glider.be>
References: <cover.1638530605.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.17-tag1

for you to fetch changes up to 05b22caa7490e4f4c94bbde33c61cf72d187b8f7:

  soc: renesas: Consolidate product register handling (2021-11-30 09:42:00 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.17

  - Add a remoteproc API for controlling the Cortex-R7 boot address on
    R-Car Gen3 SoCs,
  - Consolidate product register handling.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: Consolidate product register handling

Julien Massot (1):
      soc: renesas: rcar-rst: Add support to set rproc boot address

 drivers/soc/renesas/rcar-rst.c       |  43 ++++++++++++-
 drivers/soc/renesas/renesas-soc.c    | 115 +++++++++++++++++------------------
 include/linux/soc/renesas/rcar-rst.h |   2 +
 3 files changed, 98 insertions(+), 62 deletions(-)
