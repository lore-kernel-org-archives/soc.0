Return-Path: <SRS0=TcnV=5L=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E8EC678D9
	for <soc@archiver.kernel.org>; Sat, 14 Jan 2023 13:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3D44C4339E; Sat, 14 Jan 2023 13:23:22 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01244C43392
	for <soc@kernel.org>; Sat, 14 Jan 2023 13:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01244C43392
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by baptiste.telenet-ops.be with bizsmtp
	id 8dP92900f4C55Sk01dP9xD; Sat, 14 Jan 2023 14:23:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pGgV0-003z7G-0D;
	Sat, 14 Jan 2023 14:23:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pGgV3-006HuN-Ng;
	Sat, 14 Jan 2023 14:23:09 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.3
Date: Sat, 14 Jan 2023 14:22:58 +0100
Message-Id: <cover.1673702291.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673702287.git.geert+renesas@glider.be>
References: <cover.1673702287.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.3-tag1

for you to fetch changes up to 499e364cd2508c2115ac251f42bb47c9548cf358:

  soc: renesas: r8a779g0-sysc: Add missing A3DUL power domain (2022-12-26 11:08:49 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.3

  - Add missing A3DUL power domain on R-Car V4H.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a779g0-dt-binding-defs-tag2' into renesas-drivers-for-v6.3

Tam Nguyen (2):
      dt-bindings: power: r8a779g0: Add missing A3DUL power domain
      soc: renesas: r8a779g0-sysc: Add missing A3DUL power domain

 drivers/soc/renesas/r8a779g0-sysc.c       | 1 +
 include/dt-bindings/power/r8a779g0-sysc.h | 1 +
 2 files changed, 2 insertions(+)
