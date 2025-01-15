Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA74286348
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736960571; cv=none; b=pcpPV0C12kAK7uU3MlKDjvT7z1TreT6yZJJX+ayrSdo+M4J/xpBk5oCj0vXg5FSx9gV+Ll+74+RZZEJLKvUtzWSISlpSAof+OQ6KqszWSf//jiHKll4psKCuFCIeJ+52/OVhhLVatgU6h2KJdUlF+X4WhGHaKvXUlYChCMl+1K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736960571; c=relaxed/simple;
	bh=/QImiR29Jyxi4oNYY/XAB8WrkHO8rUmvRi6cscIpUe8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q2OVtrJu5usX+hRiwhKN8yWsk0KHzhlq+3DUWEUs1SXCLE/Vjnc+qSNLwa5hKXLk8vfyD5G+zPJbMueFZn9KQ1e4ObOZ8tjFbuhfYZpW7JviErXvgXcEDFuxN6LsGMjhv1eTf4RvZt+QQ52iyfJ+MGNzu+VwuUjl76WNRl/B3y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 571B3C4CEE5; Wed, 15 Jan 2025 17:02:51 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5156FC4CED1
	for <soc@kernel.org>; Wed, 15 Jan 2025 17:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5156FC4CED1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tY6n1-0006zS-JN; Wed, 15 Jan 2025 18:02:47 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.14 (v2)
Date: Wed, 15 Jan 2025 18:02:47 +0100
Message-Id: <20250115170247.1303656-1-p.zabel@pengutronix.de>
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

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.14-2

for you to fetch changes up to 72bb8275a3b0784a817e0371c49c0110d68bb7fb:

  reset: amlogic: aux: drop aux registration helper (2025-01-15 17:59:31 +0100)

----------------------------------------------------------------
Reset controller updates for v6.14 (v2)

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
