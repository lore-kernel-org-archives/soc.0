Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D34724503F
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382872; cv=none; b=rUO3bxz5Y4hxVu9dZlvnyK15+my/UkF0gUh2L7PimBq8GsdZLuTbUkxu/kFZAzzA92HJH5TaCFYaL12QqE7lCNfr6JvBE+fvwbOqP1xiwyKkRB8SrA448TRfhP4IDR0Vnqa+uuEJ49/JUjULpXQDU3XEnVrm4KrWGHefOtEGJQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382872; c=relaxed/simple;
	bh=VS/nBQnf4uQUduPccd0qUnNmWQ65DpTT5x0xj4MjBuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MEmEdHpBYqQBUW1hakiBPOwY0UEDOcIcNckIyxutHzENsuO+z7QlEtdO6YKXkHJF8+l5Sasg7hyIt1xgwqFOS2/iS6oW5mlWAkA2WT1vB9l8MLidIsMNFFuARH/K5mmEBtH5+lFJoJSeh4a5fb+I8VCoM0pha0REJZJaA9CaqPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=K6GXJqVm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="K6GXJqVm"
Received: by smtp.kernel.org (Postfix)
	id 33C80C2BC87; Mon, 17 Nov 2025 12:34:32 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 997CDC4CEFB;
	Mon, 17 Nov 2025 12:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 997CDC4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=MN
	YAu/5xfoUe1Cd1Dk6SgiXruma2zPCXXBEcXxRe+VA=; b=K6GXJqVmPJ+itrIt00
	QIH+G/A1nkcI98HHFunoPjZGdnPJh12iqG8SaPxREHEjfMc0KIZgq57WQ8UXeVs/
	ghBHGAxBsxxTvfJqr84xljuqaZ4yFjA1QpWiIwRo++UNVo+/p6Gq7J4DCR7MpuJ8
	0HWXNxlUOEMHcvxPm0EAcDQnM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnXIhOFhtpoZUoAg--.8347S2;
	Mon, 17 Nov 2025 20:34:22 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers update for 6.19
Date: Mon, 17 Nov 2025 20:33:47 +0800
Message-ID: <20251117123358.2009662-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgAnXIhOFhtpoZUoAg--.8347S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw43Aw1UZw4kZr1fJFb_yoW8GFykpF
	43JFWayw48GF4fXryfJw4UuF13Xwn5GrWYkF47Aa1kZF45Awn7Jr1Dtw48XFW8Jry8JF43
	KF17JF1kGF1UCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-Ef5UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBG6IGkbFlETowAA36

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.19

for you to fetch changes up to 97a07dd2b559d149598cd49574ce50614752211a:

  firmware: imx: scu: Use devm_mutex_init (2025-10-27 14:43:48 +0800)

----------------------------------------------------------------
i.MX drivers update for 6.19:

- A series from Peng Fan to to improve i.MX SCU firmware drivers

----------------------------------------------------------------
Peng Fan (8):
      firmware: imx: scu-irq: fix OF node leak in
      firmware: imx: scu-irq: Free mailbox client on failure at imx_scu_enable_general_irq_channel()
      firmware: imx: scu-irq: Init workqueue before request mbox channel
      firmware: imx: scu-irq: Set mu_resource_id before get handle
      firmware: imx: scu-irq: Remove unused export of imx_scu_enable_general_irq_channel
      firmware: imx: scu: Update error code
      firmware: imx: scu: Suppress bind attrs
      firmware: imx: scu: Use devm_mutex_init

 drivers/firmware/imx/imx-scu-irq.c | 32 +++++++++++++++++---------------
 drivers/firmware/imx/imx-scu.c     | 11 +++++++----
 2 files changed, 24 insertions(+), 19 deletions(-)

