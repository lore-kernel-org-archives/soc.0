Return-Path: <SRS0=65lA=IR=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84318C433E6
	for <soc@archiver.kernel.org>; Fri, 19 Mar 2021 08:51:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4D70064F70; Fri, 19 Mar 2021 08:51:58 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A060A64F40
	for <soc@kernel.org>; Fri, 19 Mar 2021 08:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A060A64F40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:207d:4b39:ec21:2531])
	by andre.telenet-ops.be with bizsmtp
	id i8rw240013CXdgx018rwd5; Fri, 19 Mar 2021 09:51:56 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lNArL-008kg4-JK; Fri, 19 Mar 2021 09:51:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1lNArK-00BMyF-TP; Fri, 19 Mar 2021 09:51:54 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas driver updates for v5.13
Date: Fri, 19 Mar 2021 09:51:46 +0100
Message-Id: <20210319085146.2709844-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319085146.2709844-1-geert+renesas@glider.be>
References: <20210319085146.2709844-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.13-tag1

for you to fetch changes up to 1d9ffbc6b185561c65a5a599562dbb6c5d66e7d1:

  soc: renesas: rmobile-sysc: Mark fwnode when PM domain is added (2021-03-08 10:25:00 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.13

  - Prepare rmobile-sysc for fw_devlink=on,
  - A minor cleanup.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      soc: renesas: rmobile-sysc: Remove unneeded platform includes
      soc: renesas: rmobile-sysc: Mark fwnode when PM domain is added

 drivers/soc/renesas/rmobile-sysc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
