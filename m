Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B22D2BEC2B
	for <soc@lists.linux.dev>; Thu,  2 Jul 2026 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007235; cv=pass; b=rPe0LTKp2U9LnHonIqZRSIo+CBgoxKKy4OcjjJOe39JTW4KOl3d0HBYlfx0iPPt2ozcKq1QrF+fgS4vDm4rg0TejSTQQ/vtGD3eHfoW1xDFt0tVcZuTD7DoPsswLoHUEwOrwcx3al14oSupT2Bwj8tNUcfEjiheqiMKx8PK1l5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007235; c=relaxed/simple;
	bh=Wq8PuPWLXcmAfIgVS85oWtKgcoV3ChYi53ot1pjv0ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZejdYJCYqQHSgazqlSn/IV6Qu/8DTG58zELPEI6W5RBq3NtYaiIIAVCV0zFrDnJE2gC2EsDAO3nuCJEeY4AT1QKO/RowbPJnyb42mmiqX8qaccyF1rGDhbK/6I95V5eSuw3o7bLz23A8DzjAAVSI8WtXFUnvIHwaFOjiQv6B8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id 7BADA1F00A3A; Thu,  2 Jul 2026 15:47:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.203.201.7
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1783007232;
	b=RZib17ZydWSXR0sXYTOlmV2BF00PXIKwD8Dii3kLc9LXjitGjK7AdFP9K+nPCWORvJua
	 zCP0Xa+iRf9rUWxaARFIbydyVQ/6272+FpsnrEbWT6tS4NkQGXbzI0i0BYb4WGi5KqIII
	 WitwQTzOLJdRvw6wvYJb82zdTMSLU2B4oIPzF8Fp6OmnNn1oAgmsfrLTGypu+t7JJOyJr
	 irAmPg07GfIVA800QijgsegvNpmYKRy200mGM9BOhLsF1K3xQ2RFQOkGBYAoNx4bbU6j2
	 e7ZxLKPAKB9FiWCnT5rZkgpLH40JPH8CYQdpKVnbNQ4glWfzWFJHtjlO17vVAzbSg1w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1783007232;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Mail-From:X-SA-Exim-Scanned:X-PTX-Original-Recipient;
	bh=VCq0DKIZEnNBwgc/tR5jI4L3XN7R6WjMaQbpaJTi/KQ=;
	b=MiXv5sjJuQcmQK+Dp2td3Yl+Q//cBqaCsg2b8iBGO23D9HpR30a1mNSO9sYQBOl7I31p
	 wL0+Zs9Znyhe9kh6jPGWGNnZxlFBBo0/ZpYOL5sXubu+HtDPdlUbBENSIwRigyILzcENI
	 tuRTSibbxD2nH2wDJojELK3FwdmF+MIIf+BQO9UjHNZ0DX2L5c4WrAQQocgC3z134W1BD
	 r0Ay9315KzLEysAtARhwyGve0DGr+lYlCr+4MhaMuBfU+Up9o5ag3eZHYLvXAKQmoVE8y
	 sU7TdD4PjOGtMr62lcwOm01uuhPgN7wpvmhmrV72fuXaJrOuj+y23WXv0ijnNwBM2Tg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	arc=none smtp.remote-ip=185.203.201.7
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F1721F000E9
	for <soc@kernel.org>; Thu,  2 Jul 2026 15:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1F1721F000E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfJd1-0004tz-C8; Thu, 02 Jul 2026 17:47:03 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v7.2
Date: Thu,  2 Jul 2026 17:46:59 +0200
Message-ID: <20260702154659.1993315-1-p.zabel@pengutronix.de>
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git tags/reset-fixes-for-v7.2

for you to fetch changes up to 71827776667f4e4677a4fa806bcfb24d4b8dd9d7:

  reset: imx7: Correct polarity of MIPI CSI resets on i.MX8MQ (2026-07-01 15:08:14 +0200)

----------------------------------------------------------------
Reset controller fixes for v7.2

* Fix the SpacemiT K3 USB2 AHB reset bit location.
* Add missing COMBOPHY_RESET definition for Altera Agilex5.
* Fix the reset-sunxi initialization error path to release the
  requested memory region.
* Correct polarity of MIPI CSI resets on NXP i.MX8MQ. The corresponding
  fix in the CSI2 driver, 6d79bb8fd2aa, is already contained in v7.2-rc1.

----------------------------------------------------------------
Robby Cai (1):
      reset: imx7: Correct polarity of MIPI CSI resets on i.MX8MQ

Tanmay Kathpalia (1):
      dt-bindings: reset: altr: add COMBOPHY_RESET for Agilex5

Yixun Lan (1):
      reset: spacemit: k3: fix USB2 ahb reset

Zhao Dongdong (1):
      reset: sunxi: fix memory region leak on ioremap failure

 drivers/reset/reset-imx7.c                   | 6 ++++++
 drivers/reset/reset-sunxi.c                  | 4 +++-
 drivers/reset/spacemit/reset-spacemit-k3.c   | 2 +-
 include/dt-bindings/reset/altr,rst-mgr-s10.h | 2 +-
 4 files changed, 11 insertions(+), 3 deletions(-)
