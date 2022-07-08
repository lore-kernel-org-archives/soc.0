Return-Path: <SRS0=XJTA=XN=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048FBC43334
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 11:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B952EC341D0; Fri,  8 Jul 2022 11:26:53 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 076F0C341C7
	for <soc@kernel.org>; Fri,  8 Jul 2022 11:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 076F0C341C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.186.194])
	by albert.telenet-ops.be with bizsmtp
	id sbSj2700S4C55Sk06bSjTv; Fri, 08 Jul 2022 13:26:43 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o9m8B-002baL-8M; Fri, 08 Jul 2022 13:26:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o9m8A-00BLWK-QD; Fri, 08 Jul 2022 13:26:42 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DT binding updates for v5.20 (take two)
Date: Fri,  8 Jul 2022 13:26:36 +0200
Message-Id: <cover.1657278851.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657278843.git.geert+renesas@glider.be>
References: <cover.1657278843.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 774fecc7ece1d5b7c604402ac2daede14825a467:

  dt-bindings: soc: renesas: Move renesas,prr from arm to soc (2022-06-17 09:18:33 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.20-tag2

for you to fetch changes up to d955cf3df3c26097aeab5712bc76f1c62a4ce86f:

  dt-bindings: hwinfo: renesas,prr: move from soc directory (2022-07-07 10:54:13 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.20 (take two)

  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      MAINTAINERS: Add Renesas SoC DT bindings to Renesas Architecture sections

Krzysztof Kozlowski (1):
      dt-bindings: hwinfo: renesas,prr: move from soc directory

 .../devicetree/bindings/{soc/renesas => hwinfo}/renesas,prr.yaml       | 2 +-
 MAINTAINERS                                                            | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{soc/renesas => hwinfo}/renesas,prr.yaml (92%)
