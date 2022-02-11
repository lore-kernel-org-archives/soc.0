Return-Path: <SRS0=tBpQ=S2=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A34EC433F5
	for <soc@archiver.kernel.org>; Fri, 11 Feb 2022 14:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA80FC340F4; Fri, 11 Feb 2022 14:19:59 +0000 (UTC)
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [195.130.137.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 696B9C340F2
	for <soc@kernel.org>; Fri, 11 Feb 2022 14:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 696B9C340F2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4JwG393Ky4zMrD9K
	for <soc@kernel.org>; Fri, 11 Feb 2022 15:19:49 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d5d:ef67:a872:c0be])
	by albert.telenet-ops.be with bizsmtp
	id tqKi260093ZSXJh06qKiu2; Fri, 11 Feb 2022 15:19:42 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nIWlx-000M8j-OA; Fri, 11 Feb 2022 15:19:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nIWLx-00Gh8r-MK; Fri, 11 Feb 2022 14:52:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v5.18
Date: Fri, 11 Feb 2022 14:52:13 +0100
Message-Id: <cover.1644587208.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644587197.git.geert+renesas@glider.be>
References: <cover.1644587197.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.18-tag1

for you to fetch changes up to cb5508e47e60b85ac033edd8c52245ad51360eb4:

  soc: renesas: Add support for reading product revision for RZ/G2L family (2022-02-08 09:43:06 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.18

  - Initial support for the new RZ/V2L SoC,
  - RZ/G2L product revision support.

----------------------------------------------------------------
Biju Das (2):
      soc: renesas: Identify RZ/V2L SoC
      soc: renesas: Add support for reading product revision for RZ/G2L family

 drivers/soc/renesas/Kconfig       |  5 +++
 drivers/soc/renesas/renesas-soc.c | 68 ++++++++++++++++++++++++++-------------
 2 files changed, 51 insertions(+), 22 deletions(-)
