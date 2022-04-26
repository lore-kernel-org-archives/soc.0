Return-Path: <SRS0=fUk6=VE=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B254AC433F5
	for <soc@archiver.kernel.org>; Tue, 26 Apr 2022 08:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78C82C385A0; Tue, 26 Apr 2022 08:31:02 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 98B88C385AC;
	Tue, 26 Apr 2022 08:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98B88C385AC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 0B3E480C0;
	Tue, 26 Apr 2022 08:27:57 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/2] Binding changes for omaps
Date: Tue, 26 Apr 2022 11:30:54 +0300
Message-Id: <pull-1650961799-428630@atomide.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/bindings-signed

for you to fetch changes up to fc3d39d5758dc001662df5aac825b2b6bcb6476f:

  dt-bindings: clock: ti: Add clock-output-names for TI composite clocks (2022-04-11 16:02:50 +0300)

----------------------------------------------------------------
Clock binding updates for omaps

Minor clock binding changes to document clock-output-names usage for omaps
so we can fix lots of related dt bindings check warnings. The related driver
changes already got merged for v5.18.

----------------------------------------------------------------
Tony Lindgren (3):
      dt-bindings: omap: Add clock-output-names and #clock-cells
      dt-bindings: clock: ti: Add clock-output-names for clockctrl
      dt-bindings: clock: ti: Add clock-output-names for TI composite clocks

 Documentation/devicetree/bindings/arm/omap/prcm.txt               | 7 ++++++-
 Documentation/devicetree/bindings/clock/ti-clkctrl.txt            | 4 +++-
 Documentation/devicetree/bindings/clock/ti/clockdomain.txt        | 3 +++
 Documentation/devicetree/bindings/clock/ti/composite.txt          | 3 +++
 Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt | 1 +
 Documentation/devicetree/bindings/clock/ti/gate.txt               | 1 +
 Documentation/devicetree/bindings/clock/ti/interface.txt          | 1 +
 Documentation/devicetree/bindings/clock/ti/mux.txt                | 1 +
 8 files changed, 19 insertions(+), 2 deletions(-)
