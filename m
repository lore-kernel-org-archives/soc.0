Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18ED38C43D
	for <soc@lists.linux.dev>; Tue, 24 Mar 2026 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345385; cv=none; b=Y8rzRT7W6nZcr2RcLBRWI5TiPvczNRyEJjn1Uhl4LEQt5Pj6FiT8n3tbiORl+di8Jz9IUH9xybvEO4JonFpvjwAxMDldgtpHDgGQ0OSXdJ+vjDv4YbQHKEUxRWGo2wO6mQa1pTfI6ah1r9j78fhOtiS3+uV6hBPaz6UX0IadJEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345385; c=relaxed/simple;
	bh=OxTrt7fcWSutvT6SGj0ZHQyUL3zXPHF1ymiWREisQJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TH4cvUjvrD5JkIsyoT2YD1gzH9jhrhAjw6KRN/j1TtTcMXd3RQSmIa1cBunrw9RegHd0Q0PTTPEdTl91+GYe013nWui57hzPfytSOuIAXWRbcwSQaR9tqWYEkYJc0zPC0XWv1/GskNpcOsBgBy9mTTKpuQdnzzOsuYnffaPQNZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 7BFCFC2BC9E; Tue, 24 Mar 2026 09:43:05 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B0FFC19424
	for <soc@kernel.org>; Tue, 24 Mar 2026 09:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B0FFC19424
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4yHr-0006HF-LO; Tue, 24 Mar 2026 10:42:59 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v7.0, part 2
Date: Tue, 24 Mar 2026 10:42:55 +0100
Message-ID: <20260324094255.3538772-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
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

The following changes since commit e0cf84109bc6c6768337123f1de24ff56b41c91b:

  reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it (2026-02-23 17:03:28 +0100)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0-2

for you to fetch changes up to a0e0c2f8c5f32b675f58e25a9338283cedb5ad2b:

  reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:47 +0100)

----------------------------------------------------------------
Reset controller fixes for v7.0, part 2

* Decouple spacemit K3 reset lines that were incorrectly coupled
  together as one, but are in fact separate resets in hardware.
* Fix a double free in the reset_add_gpio_aux_device() error path.
  This has already been fixed on reset/next by commit a9b95ce36de4
  ("reset: gpio: add a devlink between reset-gpio and its consumer").
* Fix the MODULE_AUTHOR string in the rzg2l-usbphy-ctrl driver.

----------------------------------------------------------------
Biju Das (1):
      reset: rzg2l-usbphy-ctrl: Fix malformed MODULE_AUTHOR string

Guangshuo Li (1):
      reset: gpio: fix double free in reset_add_gpio_aux_device() error path

Yixun Lan (1):
      reset: spacemit: k3: Decouple composite reset lines

 drivers/reset/core.c                           |  1 -
 drivers/reset/reset-rzg2l-usbphy-ctrl.c        |  2 +-
 drivers/reset/spacemit/reset-spacemit-k3.c     | 60 +++++++++++++++-----------
 include/dt-bindings/reset/spacemit,k3-resets.h | 48 +++++++++++++++------
 4 files changed, 73 insertions(+), 38 deletions(-)
