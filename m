Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0E4BA45
	for <soc@lists.linux.dev>; Tue, 29 Jul 2025 20:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753822635; cv=none; b=jLsd1bBfzmUkf98h4n4aKsnak34ZW2SZ9iIayN9k1Eq2x+8JsZnKm3JS1Q8T4AiyHH0t1Z5t4YNZOWB1HZexSoHTmk6WTt22Sag5G4LDRTSzFA4NkCOYnoEC90B6JaoTQualoOMb02nxLCvZgi9fa6r9Ml0SOPhip0klp7PKyPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753822635; c=relaxed/simple;
	bh=ckxxI0pEhUoNwFhENigVXMswGZJ3obdfkxnF7idf7f0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u1Onm4e75LilXskWHUq+0NBv0Hbq7SJ1bbgCmYORPO4VGrNu06roZUEz4O/Tz7HgbzVwYr5ddBeWq5b6SErvR5Us+1Ft6OXV+tRQbFx0rLq7uFwDjuo65cIlCOw4iM4Uv5fsU9W9ykqAYwBkKjaqQqROlcbUU68mAp5axP/0Yrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZBXG1ZIp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZBXG1ZIp"
Received: by smtp.kernel.org (Postfix)
	id 89DE4C4CEF9; Tue, 29 Jul 2025 20:57:14 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1E07C4CEF8;
	Tue, 29 Jul 2025 20:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1E07C4CEF8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id F2A86C0000E2;
	Tue, 29 Jul 2025 13:57:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com F2A86C0000E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1753822633;
	bh=ckxxI0pEhUoNwFhENigVXMswGZJ3obdfkxnF7idf7f0=;
	h=From:To:Cc:Subject:Date:From;
	b=ZBXG1ZIp4dGKZ6WWka60on0NSyHGtz87i3UjF1qPsnoManPmBNTFZbOAGtOA5Icd/
	 OTxtjZ42b2e0SiXmpJCJ2zoGP1Y1+W+HS77lSzo8YFcwrPV3vo4qMiOm8PGAfwQCNe
	 6BcdifUimrhsuiGSSDdDKrUFpdqfTb8uv+P9PLAo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D6000180004FC;
	Tue, 29 Jul 2025 13:57:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree fixes for 6.16
Date: Tue, 29 Jul 2025 13:57:11 -0700
Message-ID: <20250729205711.3393417-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/devicetree-fixes

for you to fetch changes up to 0c927d478486fbc96a225aeae6705e7152700c87:

  ARM: dts: broadcom: Fix bcm7445 memory controller compatible (2025-07-15 10:42:18 -0700)

----------------------------------------------------------------
This pull request contains Device Tree fixes for Broadcom ARM-based SoC
platforms, please pull the following:

- Florian fixes the bcm7445.dtsi file to conform to the
  brcm,brcm,brcmstb-memc-ddr.yaml binding after 501be7cecec9
  ("dt-bindings: memory-controller: Define fallback compatible")

----------------------------------------------------------------
Florian Fainelli (1):
      ARM: dts: broadcom: Fix bcm7445 memory controller compatible

 arch/arm/boot/dts/broadcom/bcm7445.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
