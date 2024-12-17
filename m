Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD83A13EFF3
	for <soc@lists.linux.dev>; Tue, 17 Dec 2024 19:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734462368; cv=none; b=Idu5HmtVW13ABJ0mUhKv8mJSFCBCh8cpi5tSAlkcHmYUB9IC3HQFmzNS6xLfyXfZpqBE6swgJhPBC/FzGhsN+CxmLbQ612/WOdYb+hwl41ICY5/hB0TQNK9/KnJA9+bo2qJZAVUxKmCK3wtOod2NlbLmm9aTWn5pXbYvT3LhqX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734462368; c=relaxed/simple;
	bh=vs5rp5d5c9Z6qD3l4kuiM9llqUe6bKbdDZzhxWJhbdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZP6jAV1KBnnPc60DZQ9EYHKFolzit504EPBL77DTvXReSfLb0lv/y6PgrCMi9mxRLKMI0CZAV9jr5cDiMHLiCFIHenfpbP4OqWZcfGBS8oh0B1ShdAUxLwVwp4nDWdL6Y4eP0KzKgbDoivOymr26aBBNeWvmN994w/lH0CQbgJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DQSYmL35; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DQSYmL35"
Received: by smtp.kernel.org (Postfix)
	id 713DDC4CED7; Tue, 17 Dec 2024 19:06:07 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6CF4C4CED3;
	Tue, 17 Dec 2024 19:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B6CF4C4CED3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C888FC002812;
	Tue, 17 Dec 2024 11:05:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C888FC002812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1734462353;
	bh=vs5rp5d5c9Z6qD3l4kuiM9llqUe6bKbdDZzhxWJhbdw=;
	h=From:To:Cc:Subject:Date:From;
	b=DQSYmL35wBwr51b40eML5x7VbNYD4l+GVIyA1eEuWqJPP6L3ZT588gMYGewxu+WkK
	 /fYATQkbEB5aDBXrKRnNsYNpl4lDCsU+xp28UlSiPYr65OQvtKls38QdqnVXxr9V2B
	 srlVs34WiUzxEDflAgO/eE12TD2dKkRhNvsMo+AY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 7291918041CAC6;
	Tue, 17 Dec 2024 11:05:53 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Willow Cunningham <willow.e.cunningham@gmail.com>,
	Willow Cunningham <willow.e.cunningham@maine.edu>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 6.13
Date: Tue, 17 Dec 2024 11:05:47 -0800
Message-ID: <20241217190547.868744-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.13/devicetree-arm64-fixes

for you to fetch changes up to 058387d9c6b70e225da82492e1e193635c3fac3f:

  arm64: dts: broadcom: Fix L2 linesize for Raspberry Pi 5 (2024-12-17 11:03:22 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree fixes
for 6.13, please pull the following:

- Willow corrects the L2 cache line size on the Raspberry Pi 5 (2712) to
  the correct value of 64 bytes

----------------------------------------------------------------
Willow Cunningham (1):
      arm64: dts: broadcom: Fix L2 linesize for Raspberry Pi 5

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
