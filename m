Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BE826F280
	for <soc@lists.linux.dev>; Wed, 10 Sep 2025 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757524762; cv=none; b=R8NTA4bnKkOxnPJsPmfOziLqZ9VgObVsLagMEZGLnNBN6B3myZ0nh1x78YqhLiwBPUoSA5YhlTg/iSlIoBpjX6RquLyiRvPE47HQ3et3KOxG5XC30quqfMTPC1gFWn/vg29IJETAfhY3KAMX+udA2fhqB3q59BE5mO2gkkVibwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757524762; c=relaxed/simple;
	bh=1KKi3rXfRkN4tFn8faiAwy2fTD+mprZhfMs4WO5qcjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/QNE66LH7bR1IkvKfzgJdscyUwI6PM0AEndAi+0MbzB396PHN0EnqoWFuuxtLWplTGqhS321DWEG5J03tpOxVEWDDgQ3AWPP6wB9jLGI+I4dFIQ7HoJXm6JEGMqhKEY/QMK7HSJ7p9WtsFgr4KG8us0B0Dd7jUta9I7umuClNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Agw8olj2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Agw8olj2"
Received: by smtp.kernel.org (Postfix)
	id 71EC3C4CEFB; Wed, 10 Sep 2025 17:19:21 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DA50C4CEF7;
	Wed, 10 Sep 2025 17:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DA50C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8614DC00071A;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8614DC00071A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757524753;
	bh=1KKi3rXfRkN4tFn8faiAwy2fTD+mprZhfMs4WO5qcjU=;
	h=From:To:Cc:Subject:Date:From;
	b=Agw8olj2W5WQDATnl2tQQtbJVRhV8xSHLywnJWXBE2Pcp6Ryti95SpBfD8/lFoKYG
	 85EdcnZvh0UtnSKcKBCqeg4vTed/vnqDU1YZcfG+zBMsLwd5Vo8a76AYz0xr4Vqi4g
	 uGIdPcJD6XWpu7GlPLJ/5rcWM4coLOQrw5cWZRPE=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 672BB180004FC;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/4] Broadcom defconfig-arm64 changes for 6.18
Date: Wed, 10 Sep 2025 10:19:07 -0700
Message-ID: <20250910171910.666401-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/defconfig-arm64

for you to fetch changes up to 2182fe932dc83eabda207677d4babdd563ae89d6:

  arm64: defconfig: Enable BCM2712 on-chip pin controller driver (2025-09-04 14:01:10 -0700)

----------------------------------------------------------------
This pull request contains ARM64 defconfig changes for Broadcom SoCs,
please pull the following:

- Andrea enables the RP1 pinctrl driver which is necessary for the
  Raspberry Pi 5 systems

----------------------------------------------------------------
Andrea della Porta (1):
      arm64: defconfig: Enable BCM2712 on-chip pin controller driver

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
