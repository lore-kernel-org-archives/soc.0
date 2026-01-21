Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D872D4279E3
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769032822; cv=none; b=l0k5ECuMQJodQbXw6UrPcRoJpI9XtdCmJzgL8RwjdkPxj3Nn3dvJMP29Tn+VonOr+Gw2aEvcmA5GOa0OcM0i6+QgD+TIvg96uwl6i7ijFl5wtSF3+httYF3T4EwsbE7S5zfYzqp7SD+W/pnD79hPZTgUCBy3MzpsmA5Eauby6AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769032822; c=relaxed/simple;
	bh=gaBDVDzWa9ERdVCWGD1R7i/41y6YewvQa4xYslxTbxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eYbnPd6BHWqvDx7jyaDrQcXP2RvkwPARymiYZuPI2UFmx71LJ2MDaSNoWu99yM0eqadZAHeDyBvrkpkGI4tGBK9WDD4XifGBY0faLfxw8J0pyZ3Dg289x62r0oTmb11+o+Lfd8Uiisss6K4AivzK7T+lhp2nHISzwsiUYLNl00A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Rgq6JmYM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Rgq6JmYM"
Received: by smtp.kernel.org (Postfix)
	id 6AED9C2BC87; Wed, 21 Jan 2026 22:00:22 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7434FC19424;
	Wed, 21 Jan 2026 22:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7434FC19424
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id AE664C034202;
	Wed, 21 Jan 2026 14:00:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com AE664C034202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769032812;
	bh=gaBDVDzWa9ERdVCWGD1R7i/41y6YewvQa4xYslxTbxo=;
	h=From:To:Cc:Subject:Date:From;
	b=Rgq6JmYMcYe9dHioo2XMQ3d1IfgBQb7TrbLLEY+1kkhGYwJsbFGfHB40j1BOCYOeu
	 LksjzjOwNpkeFERBBzEPj+hgSV424lKA22wdYYskaj2nXt+dotiJQ4BszgB0Ov2ya5
	 B3L9EUBnBwhJu8q0Z1kBBGDihk2zykLedClRBdCM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 604321A186;
	Wed, 21 Jan 2026 14:00:12 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree changes for 6.20
Date: Wed, 21 Jan 2026 14:00:10 -0800
Message-ID: <20260121220011.1171930-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.20/devicetree

for you to fetch changes up to 929dc5b3e06c54f1d19b01c93042174d0e741b99:

  ARM: dts: broadcom: bcm2711: Fix 'simple-bus' node names (2026-01-08 09:32:39 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs DT changes for 6.20,
please pull the following:

- Rob fixes the simple-bus node names in the BCM2711 .dtsi file

----------------------------------------------------------------
Rob Herring (Arm) (1):
      ARM: dts: broadcom: bcm2711: Fix 'simple-bus' node names

 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
