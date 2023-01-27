Return-Path: <SRS0=4MpN=5Y=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F90C636BD
	for <soc@archiver.kernel.org>; Fri, 27 Jan 2023 16:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AF7FDC4339E; Fri, 27 Jan 2023 16:28:38 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B131C433EF
	for <soc@kernel.org>; Fri, 27 Jan 2023 16:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B131C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a160:4e65:21d4:30bf])
	by xavier.telenet-ops.be with bizsmtp
	id DsUV2900A2rBNjs01sUVNC; Fri, 27 Jan 2023 17:28:29 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pLRaG-007Zkh-N4;
	Fri, 27 Jan 2023 17:28:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pLRaS-005Taa-GQ;
	Fri, 27 Jan 2023 17:28:24 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.3
Date: Fri, 27 Jan 2023 17:28:13 +0100
Message-Id: <cover.1674815097.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1674815093.git.geert+renesas@glider.be>
References: <cover.1674815093.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.3-tag1

for you to fetch changes up to 6e1456f9251966d8fbfde2ae4750ba540b588533:

  dt-bindings: soc: renesas: Add RZ/V2M PWC (2023-01-23 09:25:27 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.3

  - Document support for the Renesas RZ/V2M External Power Sequence
    Controller (PWC).

----------------------------------------------------------------
Fabrizio Castro (1):
      dt-bindings: soc: renesas: Add RZ/V2M PWC

 .../bindings/soc/renesas/renesas,rzv2m-pwc.yaml    | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-pwc.yaml
