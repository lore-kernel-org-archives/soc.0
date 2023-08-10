Return-Path: <SRS0=vZI3=D3=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7D8C001B0
	for <soc@archiver.kernel.org>; Thu, 10 Aug 2023 09:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 858ACC433CA; Thu, 10 Aug 2023 09:17:06 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 7C02BC433C7;
	Thu, 10 Aug 2023 09:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C02BC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 8883D80A9;
	Thu, 10 Aug 2023 09:17:02 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/4] Devicetree binding changes for omaps for v6.6
Date: Thu, 10 Aug 2023 12:16:50 +0300
Message-ID: <pull-1691658952-110529@atomide.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.6/dt-bindings-signed

for you to fetch changes up to c5a5583ecfa02a858983a0cad710201fe0eea03f:

  dt-bindings: omap: Partially convert omap.txt to yaml (2023-07-31 09:09:21 +0300)

----------------------------------------------------------------
Devicetree binding changes for omaps for v6.6

Just one change to get started on SoC yaml binding changes for omaps.

----------------------------------------------------------------
Andrew Davis (1):
      dt-bindings: omap: Partially convert omap.txt to yaml

 .../devicetree/bindings/arm/omap/omap.txt          |  99 ------------
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 176 +++++++++++++++++++++
 2 files changed, 176 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/ti/omap.yaml
