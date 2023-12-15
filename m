Return-Path: <SRS0=5jAf=H2=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD651C46CA2
	for <soc@archiver.kernel.org>; Fri, 15 Dec 2023 14:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9402AC433CA; Fri, 15 Dec 2023 14:20:49 +0000 (UTC)
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0DDBC433D9
	for <soc@kernel.org>; Fri, 15 Dec 2023 14:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0DDBC433D9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4SsBFw1cQ5z4x2ff
	for <soc@kernel.org>; Fri, 15 Dec 2023 15:20:36 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:28e5:a835:e0b1:5291])
	by michel.telenet-ops.be with bizsmtp
	id NeLT2B00A29mzEW06eLT2u; Fri, 15 Dec 2023 15:20:28 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rE92n-00C71n-UF;
	Fri, 15 Dec 2023 15:20:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rE76H-00GsHc-3s;
	Fri, 15 Dec 2023 13:15:29 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas SoC updates for v6.8 (take two)
Date: Fri, 15 Dec 2023 13:15:19 +0100
Message-Id: <cover.1702642338.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.8.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas driver updates for v6.8

    - Remove duplicate setup of soc_device_attribute.family,
    - Make RZ/Five depend on !DMA_DIRECT_REMAP.

  [GIT PULL 2/2] Renesas DTS updates for v6.8 (take two)

    - Add IA55 interrupt controller and Ethernet support for the RZ/G3S
      SoC and the RZ/G3S SMARC SoM,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
