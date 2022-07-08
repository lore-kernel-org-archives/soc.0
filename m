Return-Path: <SRS0=XJTA=XN=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DB3C433EF
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 11:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DDA46C341CE; Fri,  8 Jul 2022 11:27:01 +0000 (UTC)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 792E9C341CA
	for <soc@kernel.org>; Fri,  8 Jul 2022 11:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 792E9C341CA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4LfWFl43Plz4x2L5
	for <soc@kernel.org>; Fri,  8 Jul 2022 13:26:51 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.186.194])
	by laurent.telenet-ops.be with bizsmtp
	id sbSj2700b4C55Sk01bSjLV; Fri, 08 Jul 2022 13:26:43 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o9m8B-002baJ-6g; Fri, 08 Jul 2022 13:26:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o9m8A-00BLW2-Nx; Fri, 08 Jul 2022 13:26:42 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v5.20 (take two)
Date: Fri,  8 Jul 2022 13:26:33 +0200
Message-Id: <cover.1657278843.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.20.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM DT updates for v5.20 (take two)

    - Ethernet MAC and switch support for the RZ/N1 SoC on the RZN1D-DB
      development board,
    - AA1024XD12 panel overlay support for the Draak, Ebisu, and
      Salvator-X(S) development boards,
    - Miscellaneous fixes and improvements.

  [GIT PULL 2/3] Renesas ARM SoC updates for v5.20

    - Fix of_node reference counting in the R-Car Gen2 board quirk.

  [GIT PULL 3/3] Renesas DT binding updates for v5.20 (take two)

    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
