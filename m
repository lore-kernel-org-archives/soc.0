Return-Path: <SRS0=8COI=AB=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA853C76196
	for <soc@archiver.kernel.org>; Mon, 10 Apr 2023 07:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DBF3C4339C; Mon, 10 Apr 2023 07:56:02 +0000 (UTC)
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 545E5C433A0
	for <soc@kernel.org>; Mon, 10 Apr 2023 07:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 545E5C433A0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Pw1Vv469Rz4wyxk
	for <soc@kernel.org>; Mon, 10 Apr 2023 09:55:51 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
	by michel.telenet-ops.be with bizsmtp
	id ivvj290091C8whw06vvjKG; Mon, 10 Apr 2023 09:55:43 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1plmMW-00GRrr-I2;
	Mon, 10 Apr 2023 09:55:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1plmNL-008PVA-3G;
	Mon, 10 Apr 2023 09:55:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.4 (take two)
Date: Mon, 10 Apr 2023 09:55:25 +0200
Message-Id: <cover.1681113111.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.4.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM SoC updates for v6.4

    - Use of_cpu_node_to_id() to read CPU node 'reg'.

  [GIT PULL 2/3] Renesas driver updates for v6.4 (take two)

    - Add "renesas," file contents pattern to MAINTAINERS,
    - Fix a small leak on OOM.

  [GIT PULL 3/3] Renesas DTS updates for v6.4 (take two)

    - Add PWM support for the R-Car H1 and H2 SoCs,
    - Add slide switch and I2C support for the Marzen development board,
    - Add SCI (serial) and Camera support for the RZ/G2L SoC and the
      RZ/G2L SMARC EVK development board,
    - Add IOMMU support for the R-Car V4H SoC,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
