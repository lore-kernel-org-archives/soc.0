Return-Path: <SRS0=00RE=BP=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2B1C77B7A
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 09:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0265FC4339C; Fri, 26 May 2023 09:48:45 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F06B4C433D2
	for <soc@kernel.org>; Fri, 26 May 2023 09:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F06B4C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:ae30:9d2b:3228:d21])
	by michel.telenet-ops.be with bizsmtp
	id 1Mof2A00A4eYoVn06MofwQ; Fri, 26 May 2023 11:48:39 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q2U3X-0038jt-K3;
	Fri, 26 May 2023 11:48:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1q2U3o-00EFZX-4V;
	Fri, 26 May 2023 11:48:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.5
Date: Fri, 26 May 2023 11:48:30 +0200
Message-Id: <cover.1685094242.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685094238.git.geert+renesas@glider.be>
References: <cover.1685094238.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.5-tag1

for you to fetch changes up to cb9a39aacd3d6387b6f1f178a96eadceba90454e:

  soc: renesas: rcar-rst: Allow WDT reset on R-Car V3U (2023-05-15 10:32:12 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.5

  - Enable watchdog reset support on R-Car V3U.

----------------------------------------------------------------
Wolfram Sang (1):
      soc: renesas: rcar-rst: Allow WDT reset on R-Car V3U

 drivers/soc/renesas/rcar-rst.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)
