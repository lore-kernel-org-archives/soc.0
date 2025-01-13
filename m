Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD2C1FBBC5
	for <soc@lists.linux.dev>; Mon, 13 Jan 2025 16:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786211; cv=none; b=SeA2SoBkIrJR3Mmw0nUY9pR10gCVqc9gxWQc4SfwZcTx+JzUahSwgYnbdpr6bY8I8HQSVlzSET9RqRxwyRBTCknlBTYMYq1FbGQsJiP6jWGcIRkNUW7mixdQK8B+YIvzdqcewqLJm1/rg6B6bwcAnZw/L6dXnmrlh/3m2Zw+Fh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786211; c=relaxed/simple;
	bh=fPp/HcreKwTUcBKbSCLpgSWiVHGYulCWEWll+Klmp0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AK28oDeG9uIdU0NtDpeAgwgQnnXTmzUyhzOxQmokIxJyMjIw66LgFGlS8xIxZpEvAREzUhyGn6p/bOVnHcfWCPbcmVPiAqHKo3jWSfGQzIPvFPKLDLiw+EnzvgGNE7G2TfAb7lq/hHUTSrrczFgAgyN1rsm9DXZmGjpe80pTRpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 8EC87C4CEE1; Mon, 13 Jan 2025 16:36:51 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2E0EC4CEE3
	for <soc@kernel.org>; Mon, 13 Jan 2025 16:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2E0EC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tXNQn-0001a4-7L; Mon, 13 Jan 2025 17:36:49 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.14
Date: Mon, 13 Jan 2025 17:36:48 +0100
Message-Id: <20250113163648.1757178-1-p.zabel@pengutronix.de>
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

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.14

for you to fetch changes up to 262c84cd062c8ea0ba9e1289ea64ebcbffb31794:

  reset: amlogic: aux: drop aux registration helper (2025-01-10 17:43:56 +0100)

----------------------------------------------------------------
Reset controller updates for v6.14

* Add support for A1 SoC in amlogic reset driver.
* Drop aux registration helper from amlogic reset driver.

----------------------------------------------------------------
Jan Dakinevich (2):
      dt-bindings: reset: add bindings for A1 SoC audio reset controller
      reset: amlogic: add support for A1 SoC in auxiliary reset driver

Jerome Brunet (2):
      reset: amlogic: aux: get regmap through parent device
      reset: amlogic: aux: drop aux registration helper

 drivers/reset/amlogic/reset-meson-aux.c            | 97 +++++-----------------
 .../reset/amlogic,meson-a1-audio-reset.h           | 36 ++++++++
 include/soc/amlogic/reset-meson-aux.h              | 23 -----
 3 files changed, 57 insertions(+), 99 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
 delete mode 100644 include/soc/amlogic/reset-meson-aux.h
