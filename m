Return-Path: <SRS0=/ciS=OV=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A503AC4321E
	for <soc@archiver.kernel.org>; Fri,  1 Oct 2021 09:42:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 32CD861AA4; Fri,  1 Oct 2021 09:42:54 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8124061A83
	for <soc@kernel.org>; Fri,  1 Oct 2021 09:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8124061A83
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5c32:c2e7:df7:3731])
	by albert.telenet-ops.be with bizsmtp
	id 0Zir2600h1ZoSwU06Zisk3; Fri, 01 Oct 2021 11:42:52 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mWF46-000zIm-H7; Fri, 01 Oct 2021 11:42:50 +0200
Received: from geert by rox with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1mWF46-00BE6V-0K; Fri, 01 Oct 2021 11:42:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.16
Date: Fri,  1 Oct 2021 11:42:46 +0200
Message-Id: <cover.1633081158.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633081144.git.geert+renesas@glider.be>
References: <cover.1633081144.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.16-tag1

for you to fetch changes up to e43eada9ac08941a98cad96eba9f3801b13e4f0b:

  dt-bindings: arm: renesas: Document more R-Car Gen3e Socs and boards (2021-09-13 10:54:41 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.16

  - Document support for the new R-Car H3e, M3e, M3Ne(-2G), D3e, E3e, and
    H3Ne SoCs and boards.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: arm: renesas: Document more R-Car Gen3e Socs and boards

 Documentation/devicetree/bindings/arm/renesas.yaml | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
