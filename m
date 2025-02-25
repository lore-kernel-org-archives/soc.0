Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5461DFD89
	for <soc@lists.linux.dev>; Tue, 25 Feb 2025 19:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740512453; cv=none; b=XSEa8cwXysVY51rxbgq3F78AF4eBxBJNnxR2WkpvXIvQVYswO6rmfRzFElUdKuMluZ6RraMr3KRhILxoOrlOybBNQ7Sg/wTzpqkB29ZRP8WCDGpA4P46Kt97RS5YANCJdoohDImWNK019x8s8hYBbGfOVpBZaCxRhew8dlvsJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740512453; c=relaxed/simple;
	bh=BtV/pAFsj+a8ILX/07KQdzLB7WNhO9wFph0/Tlu4Wog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W06Xv65y8H/6mNFm4PcpC4tIH41ksh66Wo2OoKAbzHiJnzjkLK7J0HKtOl4OXTqm+ZmbW3IH7mNOard0qR63v4o01HV+mH5j1Q2AKQuyRJV/gDVbkd9yb2aLhSaIY8XKxGvpCGVwhASGxw7jv1pxhOF4EvkgUpYKMYAMCmWo7HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=byFWq+3q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="byFWq+3q"
Received: by smtp.kernel.org (Postfix)
	id 820F8C4CEE2; Tue, 25 Feb 2025 19:40:53 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8955AC4CEDD;
	Tue, 25 Feb 2025 19:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8955AC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8F29DC00153F;
	Tue, 25 Feb 2025 11:40:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8F29DC00153F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1740512443;
	bh=BtV/pAFsj+a8ILX/07KQdzLB7WNhO9wFph0/Tlu4Wog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=byFWq+3qGRm/gPwqpnND++U9eyI+MxOG+TGPTGAj0SP8vas8Yq2HQYYnLEiQtuL4E
	 JMwEd9ep6lgK7HY3p2ywiOI3rPYuwR14q/ufnF1hGnOHlQivic11K/XYsjHbQ8hZLf
	 fG/iq1JyILKonXw7FQW+uE6LV8dALO26uBoD9f9I=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 3FE8718041CCB9;
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
Subject: [GIT PULL 2/2] Broadcom devicetree-arm64 fixes for 6.14
Date: Tue, 25 Feb 2025 11:40:41 -0800
Message-ID: <20250225194041.1063762-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225194041.1063762-1-florian.fainelli@broadcom.com>
References: <20250225194041.1063762-1-florian.fainelli@broadcom.com>
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/devicetree-arm64-fixes

for you to fetch changes up to 768953614c1c13fdf771be5742f1be573eea8fa4:

  arm64: dts: bcm2712: PL011 UARTs are actually r1p5 (2025-02-25 11:23:49 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree fixes
for 6.14, please pull the following:

- Phil fixes the Raspberry Pi 5 PL011 UART primecell ID to indicate it
  is r1p5 and thus has a 32-byte FIFO

----------------------------------------------------------------
Phil Elwell (1):
      arm64: dts: bcm2712: PL011 UARTs are actually r1p5

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
