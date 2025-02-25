Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9273220E31B
	for <soc@lists.linux.dev>; Tue, 25 Feb 2025 19:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740512445; cv=none; b=JejbdlBm5P17oseZJOqB72pebOhYLRg2+9T+6Lu5SLGbq0O/6D990ak8RTJyYyjrHY0pDLuxetp+TbbGJ4kxomKnuftHDq3e15fzogopAWP8XR0EvXkRFP0ZliJCDObYpbFD2bWeCtvt+n95LuEfiAr4ApqTH1lwB3ZQ5DCwzwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740512445; c=relaxed/simple;
	bh=EnhW1Aazxx9SYQvF9U5ei/EmrqxOHYY3a++ZSu6gHXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZizmQiueaBZe8iWOlDHKnynjfnjAQmjEd0x0xZL1F3DbNq/48WS7nc2vN3FgkloMmGJ/DmJcvDP8nyxaN7OhCpIhSIX2LEodP8oUBF8Xq2KguHnclLnnKhoJCOsSG/1shYsN/yFPWToigtD7rT4eSEwhvItoJS3ByVwNOOy5Spo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=lkPUVgfA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="lkPUVgfA"
Received: by smtp.kernel.org (Postfix)
	id 1F7D5C4CEE8; Tue, 25 Feb 2025 19:40:45 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43774C4CEE2;
	Tue, 25 Feb 2025 19:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43774C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3EB5CC0000D7;
	Tue, 25 Feb 2025 11:40:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3EB5CC0000D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1740512443;
	bh=EnhW1Aazxx9SYQvF9U5ei/EmrqxOHYY3a++ZSu6gHXM=;
	h=From:To:Cc:Subject:Date:From;
	b=lkPUVgfANb5ofNw0KuHM374WRaWg1ZduWJez/vwbp/8d2UqKnEg0cs9vFhU05HmX9
	 Sn0DJacCjr+T3FJLxonaSx+p7wJrkhP9xiEPivI5tu5q/FDuw9/+3IYyOaWnpqHBgM
	 Ud91VKmAj3zlVapldU7vqgr4RBm99Gl9QZJrUlD4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 1FD5318041CCB8;
	Tue, 25 Feb 2025 11:40:43 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree fixes for 6.14
Date: Tue, 25 Feb 2025 11:40:40 -0800
Message-ID: <20250225194041.1063762-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/devicetree-fixes

for you to fetch changes up to 0de09025f161f67c07978c4742e221243d070d41:

  ARM: dts: bcm2711: PL011 UARTs are actually r1p5 (2025-02-25 11:18:41 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
6.14:

- Stefan fixes the xHCI power domain on the Raspberry Pi 4
- Phil fixes the Raspberry Pi 4 PL011 UART primecell ID to indicate they are
  r1p5 and thus have a 32-byte FIFO

----------------------------------------------------------------
Phil Elwell (1):
      ARM: dts: bcm2711: PL011 UARTs are actually r1p5

Stefan Wahren (1):
      ARM: dts: bcm2711: Fix xHCI power-domain

 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi |  5 -----
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 10 ++++++----
 2 files changed, 6 insertions(+), 9 deletions(-)
