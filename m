Return-Path: <SRS0=amPN=KH=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE84FC5475B
	for <soc@archiver.kernel.org>; Fri,  1 Mar 2024 15:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6167C433C7; Fri,  1 Mar 2024 15:32:54 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A16AC43390
	for <soc@kernel.org>; Fri,  1 Mar 2024 15:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3A16AC43390
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:db22:6af9:7d18:6ee8])
	by michel.telenet-ops.be with bizsmtp
	id tTYj2B0021TWuYv06TYj1f; Fri, 01 Mar 2024 16:32:43 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rg4sC-0023yC-C2;
	Fri, 01 Mar 2024 16:32:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rg4sN-00Bfbx-39;
	Fri, 01 Mar 2024 16:32:43 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DT binding updates for v6.9 (take three)
Date: Fri,  1 Mar 2024 16:32:23 +0100
Message-Id: <cover.1709307006.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my third pull request for the inclusion of Renesas SoC updates
for v6.9.

The following changes since commit 3a9856e830500e20e61b92f5ea6b8cc505e085be:

  dt-bindings: renesas: Document preferred compatible naming (2024-02-19 11:21:04 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.9-tag3

for you to fetch changes up to 0d5a9b5d5d2fe6a138a8a9ff2513f446d69f2672:

  dt-bindings: soc: renesas: renesas-soc: Add pattern for gray-hawk (2024-03-01 15:41:34 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.9 (take three)

  - Add missing gray-hawk pattern to list of preferred compatible names.

This fixes a recently introduced "make dtbs_check" issue.

Thanks for pulling!

----------------------------------------------------------------
Lad Prabhakar (1):
      dt-bindings: soc: renesas: renesas-soc: Add pattern for gray-hawk

 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
