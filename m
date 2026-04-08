Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEC83939D7
	for <soc@lists.linux.dev>; Wed,  8 Apr 2026 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641323; cv=none; b=E6c2ex0OIjLOHw4ITQSLZPoJUCu3XB1DAwT3lwHM4mGLNOAX7eZmYPcECIYDtK7IvWW97fBGqo+T8WaUEfyPocGZyXyxRhLKFsllHnztGX52KXYN/1q+FmV/+QtTP8rTUNYbMPx8YcNaOFTBDJ7csdA1emIhg1GWK+cws6Adu70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641323; c=relaxed/simple;
	bh=rQG4TqA9wEWVFqpW55Yqq/GOk/HkENJAQiF4iLl/WA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SXbK1DdoXGL6NEYAXeWh31YLRR1LwN35dpktIPUXz7X1zh47ndOxusX1cNvyPKrVFZbA0sPXSw/AYzOLF4DLPmMrybdf5a6/jD+D9Xd034BSuP8QiChoK0v3eetUTHl8GXU3m6hEelWO0N5uGnIJr+qJee9NOTNynBeTSchplHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 2B929C2BCAF; Wed,  8 Apr 2026 09:42:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 839CCC2BCB1
	for <soc@kernel.org>; Wed,  8 Apr 2026 09:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 839CCC2BCB1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wAPQ1-0006Ee-CC; Wed, 08 Apr 2026 11:41:53 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v7.0, part 3
Date: Wed,  8 Apr 2026 11:41:52 +0200
Message-ID: <20260408094152.1698594-1-p.zabel@pengutronix.de>
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

The following changes since commit a0e0c2f8c5f32b675f58e25a9338283cedb5ad2b:

  reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:47 +0100)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0-3

for you to fetch changes up to 9797524ef2b69c6b187b55bd844eb72a8c1cbd99:

  reset: amlogic: t7: Fix null reset ops (2026-03-31 17:19:18 +0200)

----------------------------------------------------------------
Reset controller fixes for v7.0, part 3

* Add missing reset ops for amlogic,t7-reset to the reset-meson driver.
  The resets are unused as of now, but as soon as they are, the driver
  would otherwise run into a NULL pointer dereference.

----------------------------------------------------------------
Ronald Claveau (1):
      reset: amlogic: t7: Fix null reset ops

 drivers/reset/amlogic/reset-meson.c | 1 +
 1 file changed, 1 insertion(+)
