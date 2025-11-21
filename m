Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4D71C3C11
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738886; cv=none; b=KyGsIwHZwHhOhJF5tjyqHPyN6EfgGA7nzHHdIVzeiKqpuy3D14Pq7uCl7EuMoLKBggkluPsTr8SaKq6WEn53XsCyCmgQgAknZkN5Bl6cEgvKrL8UdGpPLNw6Wnxl7MTzJ0F8D0ft4snlT8q5sxlaTRLPZzlL8X2lTeRtyiD2HXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738886; c=relaxed/simple;
	bh=MvcbuFLBBKt4hy/ZKr3kKkkxFosZ+FoQvSodWjl1G8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ae813vlETMjltfvkUpo2txZxWOyP/CSW9ySFLxryw7QICkz4DGTB/YPFSFd1wQ6aF1u3hXv/GjLZRXugi5Ctz0EfhqT8UGZR/sNkma5pADqlxLJSa2frBAQegpdHw+DwDHKh8xQzRqaxsMh8M0Y0csj2ghUP9CfijX5MQ3RF2/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 3B415C116C6; Fri, 21 Nov 2025 15:28:06 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B488C4CEFB
	for <soc@kernel.org>; Fri, 21 Nov 2025 15:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B488C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMT3L-0002yc-4j; Fri, 21 Nov 2025 16:28:03 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset/GPIO/swnode changes for v6.19 (v2)
Date: Fri, 21 Nov 2025 16:28:02 +0100
Message-ID: <20251121152802.3619853-1-p.zabel@pengutronix.de>
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

The following changes since commit 5fc4e4cf7a2268b5f73700fd1e8d02159f2417d8:

  reset: gpio: use software nodes to setup the GPIO lookup (2025-11-20 16:51:49 +0100)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-gpio-for-v6.19-2

for you to fetch changes up to 527250cd9092461f1beac3e4180a4481bffa01b5:

  platform/x86: intel: chtwc_int33fe: don't dereference swnode args (2025-11-21 15:31:43 +0100)

This is a follow-up to the reset-gpio-for-v6.19 pull request [1] fixing
the build issue reported at [2].

[1] https://lore.kernel.org/all/20251120163252.34760-1-p.zabel@pengutronix.de/
[2] https://lore.kernel.org/all/20251121111534.7cdbfe5c@canb.auug.org.au/

----------------------------------------------------------------
Reset/GPIO/swnode changes for v6.19 (v2)

* Fix chtwc_int33fe build issue since commit d7cdbbc93c56 ("software
  node: allow referencing firmware nodes").

----------------------------------------------------------------
Bartosz Golaszewski (1):
      platform/x86: intel: chtwc_int33fe: don't dereference swnode args

 drivers/platform/x86/intel/chtwc_int33fe.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)
