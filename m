Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3AF2DF12B
	for <soc@lists.linux.dev>; Wed, 10 Sep 2025 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757524762; cv=none; b=PnJ3adAz8294UQfAMYrHmkhX+cLE9viAHVzTHn0bYljjnYgLypQtz1p8GBpj5e1K3AcmH4Vo9BlCROXlaLqo5ReAq/Bc0WzGpe/RFDN4SEnpKDVTsvbBPl6FIHIK8IkfARt/VMfocv4gZWQet0S9uRxmjAp+0e4f4sN5H3WfyLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757524762; c=relaxed/simple;
	bh=0UFDjhUme3C5flksKIYcmrVII18fPlsZVUyXSxZ7Ah8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgjLwS4bCNRNkhEtsv/BZ2/5p5lgSBda48pk6ouF1+tvuNHQHYiNzm0xQnvGAxTE+BytMprbfe6jT+GPAVYi0tIRCLdD6waDLwWuBdeifWhak3vLaQq/P038MOi+ImT2ZCsr8BZeJoNR8Ax1Z4XWSNfpcBwCXIzBy2fI0kZueuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=and7dQbQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="and7dQbQ"
Received: by smtp.kernel.org (Postfix)
	id 31459C4CEFD; Wed, 10 Sep 2025 17:19:22 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DA7AC4AF09;
	Wed, 10 Sep 2025 17:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DA7AC4AF09
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E6B4FC00071B;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E6B4FC00071B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757524754;
	bh=0UFDjhUme3C5flksKIYcmrVII18fPlsZVUyXSxZ7Ah8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=and7dQbQGn3ZKwWHYxCGCruIOgeckgQNbnPXGH2yiP1Uu5PxCzYOnfcVpueGqRoco
	 GFb8V9JrukSftfXU35iMoqDZAVWbwoybmjsMCF1JrzGdNWYXowX+x0fpAmE3vQz8E7
	 dELp7N1039poBvRdyDI8JOmYcflOODQN/T8NQO0g=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id C9B3118000853;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Brian Masney <bmasney@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
	Andrea della Porta <andrea.porta@suse.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/4] Broadcom drivers changes for 6.18
Date: Wed, 10 Sep 2025 10:19:10 -0700
Message-ID: <20250910171910.666401-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910171910.666401-1-florian.fainelli@broadcom.com>
References: <20250910171910.666401-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/drivers

for you to fetch changes up to 41c9570e41783648ff9455ea903615406b2bb127:

  clk: rp1: convert from round_rate() to determine_rate() (2025-09-03 14:58:19 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC drivers updates for 6.18:

- Andrea adds the missing MIPI DSI clock defines for the RP1 and then
  continues to implement the remaining clocks for the RP1 chip (ADC,
  I2S, Audio in/out, DMA, MIPI, PWM, SDIO, UART, encoder)

- Akhilesh fixes a spelling typo in the bcm47xx_sprom driver

- Brian converts the RP1 clock driver to use the new determine_rate()
  API

----------------------------------------------------------------
Akhilesh Patil (1):
      drivers: firmware: bcm47xx_sprom: fix spelling

Andrea della Porta (2):
      dt-bindings: clock: rp1: Add missing MIPI DSI defines
      clk: rp1: Implement remaining clock tree

Brian Masney (1):
      clk: rp1: convert from round_rate() to determine_rate()

 drivers/clk/clk-rp1.c                              | 1222 ++++++++++++++++++--
 drivers/firmware/broadcom/bcm47xx_sprom.c          |    2 +-
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h |    4 +
 3 files changed, 1100 insertions(+), 128 deletions(-)
