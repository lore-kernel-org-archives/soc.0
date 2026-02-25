Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBE93E8C70
	for <soc@lists.linux.dev>; Wed, 25 Feb 2026 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034457; cv=none; b=OMaPwuuKxwipNKsATrNIiZqQx5c2MqeAVUlb7mPRoLdVThKxzQkllcvr4txJtuZvrSm5uUi2ynv9zqPztGZ8gVIv4Y8oE/9InsoidTR1BB3IbcL+Mj2mq8Gb1jIEENPETsWJuq+DmBY2siRj33uQClf9wyoXjdkIvP/B7ci2+SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034457; c=relaxed/simple;
	bh=k4QdRSm+BToRiwvw/Zc353l6qkM5SBY2nRF8ZT9I8kM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nYCnawYzqB5SCFhCOq3LUwlAjSbY8OtmevxIy4fGfkfyUWdS0UsvezEWlVLYcnVGv31+x1XfhkcbcvoevJVG3QL3YC31whTvmWBN6nbizeqW0ZnieXBmC33Da8oqTb/a20XPUmKCdnbaKBtJsKf6VmeYvCL+GFKmG8C2QIivrQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 590F9C116D0; Wed, 25 Feb 2026 15:47:37 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0419C19421
	for <soc@kernel.org>; Wed, 25 Feb 2026 15:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0419C19421
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvH6l-0000Pl-3d; Wed, 25 Feb 2026 16:47:27 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v7.0
Date: Wed, 25 Feb 2026 16:47:26 +0100
Message-ID: <20260225154726.468149-1-p.zabel@pengutronix.de>
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0

for you to fetch changes up to e0cf84109bc6c6768337123f1de24ff56b41c91b:

  reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it (2026-02-23 17:03:28 +0100)

----------------------------------------------------------------
Reset controller fixes for v7.0

* Fix NULL pointer dereference in reset-rzg2l-usbphy-ctrl driver for
  renesas,rzg2l-usbphy-ctrl devices without pwrrdy control.

----------------------------------------------------------------
Claudiu Beznea (1):
      reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 3 +++
 1 file changed, 3 insertions(+)
