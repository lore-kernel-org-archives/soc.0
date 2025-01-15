Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D31170816
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736960050; cv=none; b=Az5lics7x/vCOqOimP/Q+U6xclbs3c5vq6gZzpvRGL8E8myairwJKJpA4ffBH/2hmx6azJgbqPNSAUutUfXlDXkAAop8Q9BxAy2tNRRVnEqWbAcPQ0vyOhpKd0mcbPiy+LUDgbEHf6dGeplHEIJJVIpyvEmDOUmBfVUIroFqxJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736960050; c=relaxed/simple;
	bh=12+8jtQnHa/CMdXrR7hscku/XB3cQhsYHoPF1u8RDNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N+zVrd0VzpOqd30RqxUu0fRhkpQOQnRh8OKy08i9C58AgpnF12H9n4XAEDR7FQpebA7MNGxSD/byubeJPNYe0Q1hjeZhBFhrALrgtI/HXdNvskC0kxg1iUFN73ApsETQPkDeOp/jVKehhbJk7bNJ4u5ywglaB+FwVSch9+mrpMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 2B93CC4CEDF; Wed, 15 Jan 2025 16:54:10 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0078C4CED1
	for <soc@kernel.org>; Wed, 15 Jan 2025 16:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0078C4CED1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tY6ea-0005nU-Sx; Wed, 15 Jan 2025 17:54:04 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.13
Date: Wed, 15 Jan 2025 17:54:04 +0100
Message-Id: <20250115165404.1269500-1-p.zabel@pengutronix.de>
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

The following changes since commit 5ae1a43486fb3febd5ce78da13eb354f16d049e0:

  clk: amlogic: axg-audio: revert reset implementation (2024-12-02 17:21:03 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v6.13-2

for you to fetch changes up to 055884c45d5f56e34fe56b173b43bbb8f0cd9640:

  reset: rzg2l-usbphy-ctrl: Assign proper of node to the allocated device (2025-01-15 17:47:52 +0100)

----------------------------------------------------------------
Reset controller fixes for v6.13

* Fix rzg2l-usb-vbus-regulator lookup by assigning the proper of node
  to the allocated platform device in the rzg2l-usbphy-ctrl driver.

----------------------------------------------------------------
Claudiu Beznea (1):
      reset: rzg2l-usbphy-ctrl: Assign proper of node to the allocated device

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 1 +
 1 file changed, 1 insertion(+)
