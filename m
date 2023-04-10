Return-Path: <SRS0=8COI=AB=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FFAC77B6F
	for <soc@archiver.kernel.org>; Mon, 10 Apr 2023 07:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58FE9C433AA; Mon, 10 Apr 2023 07:56:02 +0000 (UTC)
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C080C4339E
	for <soc@kernel.org>; Mon, 10 Apr 2023 07:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C080C4339E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4Pw1Vt3tsjz4wybj
	for <soc@kernel.org>; Mon, 10 Apr 2023 09:55:50 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
	by baptiste.telenet-ops.be with bizsmtp
	id ivvj2900E1C8whw01vvj4B; Mon, 10 Apr 2023 09:55:43 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1plmMW-00GRrs-Ih;
	Mon, 10 Apr 2023 09:55:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1plmNL-008PVD-4U;
	Mon, 10 Apr 2023 09:55:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM SoC updates for v6.4
Date: Mon, 10 Apr 2023 09:55:26 +0200
Message-Id: <cover.1681113113.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681113111.git.geert+renesas@glider.be>
References: <cover.1681113111.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v6.4-tag1

for you to fetch changes up to 6050cb1c7ad40b5673cd6ee7cfd36db3ca9be5fe:

  ARM: sh-mobile: Use of_cpu_node_to_id() to read CPU node 'reg' (2023-03-30 16:02:42 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v6.4

  - Use of_cpu_node_to_id() to read CPU node 'reg'.

----------------------------------------------------------------
Rob Herring (1):
      ARM: sh-mobile: Use of_cpu_node_to_id() to read CPU node 'reg'

 arch/arm/mach-shmobile/platsmp-apmu.c | 36 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 20 deletions(-)
