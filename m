Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0FDF510
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 16:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970652; cv=none; b=S96vcpinidZ6ZUGqAg0SjVXW8iO8zjG0OZU3SufaSfftF0ez3DblBdJ5uP6KnCaQlSFBUQTFXeXmF1akDiQU169XxzttuL5m0OQ5wPES+TKbYkMsxiDHVrLFmVSGItkLYSfQe6lWbX3jBuE5zxd+HQZtReH/VIuh1eDONkAwIyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970652; c=relaxed/simple;
	bh=T92HgU6lWK+BWiYDdHRfmuTT9sCsY8/rW+GfzCGcW6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KwDhoBddxaRwowb4n+uGZHcEnwFw68oi4S1cJepLo5WxXoaryCVAeLevKr9CJ0QCT51YyScs0EYdgRRl6kAel7vc6ul99Jqb9/t9u1DRZpCuJUgpJkgoM5l1wWpm8+wpodMzRMBLFsJbtVAMrkQMyKA82HiNQHFkZEtOaOMZ9xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 49B99C4CEE5; Fri, 14 Mar 2025 16:44:12 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0106C4CEE3
	for <soc@kernel.org>; Fri, 14 Mar 2025 16:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0106C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tt88l-0001NV-TW; Fri, 14 Mar 2025 17:44:07 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.15
Date: Fri, 14 Mar 2025 17:44:06 +0100
Message-Id: <20250314164406.744117-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.15

for you to fetch changes up to c361baf67200a79c878d72cc879b1217c52cec96:

  reset: imx: fix incorrect module device table (2025-03-14 16:46:15 +0100)

----------------------------------------------------------------
Reset controller updates for v6.15

* Add missing microchip,sam9x7-rstc compatible to device tree binding
  documentation.
* Add SCU reset driver for i.MX8QXP and i.MX8QM.

----------------------------------------------------------------
Arnd Bergmann (1):
      reset: imx: fix incorrect module device table

Frank Li (2):
      dt-bindings: firmware: imx: add property reset-controller
      reset: imx: Add SCU reset driver for i.MX8QXP and i.MX8QM

Varshini Rajendran (1):
      dt-bindings: reset: atmel,at91sam9260-reset: add sam9x7

 .../devicetree/bindings/firmware/fsl,scu.yaml      |  12 +++
 .../bindings/reset/atmel,at91sam9260-reset.yaml    |   4 +
 drivers/reset/Kconfig                              |   7 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-imx-scu.c                      | 101 +++++++++++++++++++++
 5 files changed, 125 insertions(+)
 create mode 100644 drivers/reset/reset-imx-scu.c
