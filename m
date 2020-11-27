Return-Path: <SRS0=nAAS=FB=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DE7C63798
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 13:22:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 159AE22252; Fri, 27 Nov 2020 13:22:07 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 169CE22248
	for <soc@kernel.org>; Fri, 27 Nov 2020 13:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 169CE22248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=geert@linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by xavier.telenet-ops.be with bizsmtp
	id xRN32300E4C55Sk01RN3kD; Fri, 27 Nov 2020 14:22:04 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1kidhL-0065FN-Cj; Fri, 27 Nov 2020 14:22:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1kidhL-000K9i-0I; Fri, 27 Nov 2020 14:22:03 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL 0/3] Renesas ARM SoC updates for v5.11 (take two)
Date: Fri, 27 Nov 2020 14:21:52 +0100
Message-Id: <20201127132155.77418-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi arm-soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.11.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM DT updates for v5.11 (take two)

    - PCIe endpoint support for the R-Car H3 ES2.0+ SoC.

  [GIT PULL 2/3] Renesas ARM SoC updates for v5.11

    - Stop using static I/O mappings and __raw_*() I/O accessors.

  [GIT PULL 3/3] Renesas driver updates for v5.11 (take two)

    - Stop using __raw_*() I/O accessors.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
