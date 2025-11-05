Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD75284B37
	for <soc@lists.linux.dev>; Wed,  5 Nov 2025 18:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762367528; cv=none; b=m7p2xn2oIuDBpNSOGJN7N0LoOJAK0rmDWaYvb9MZKjVo2q6nRG7ABJ2b8HVgOWmeu8hp5JB+GfR8GU2XoXYJK7QdUcahrDzHbZVp5IqFxDgq/4nY5WGGtWFtQSiDPR8PshU3Ptx/QS4VdgUiKrmIoI7w4RjCfgqOsWFT/d+RVMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762367528; c=relaxed/simple;
	bh=euyM+3gDdbJVoDyKJqxz5X77e6ESc9izIMr3hTGFNAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ITLIQ/jxQLUnC2UnFRURytFPF1ueo280074pr9Tgy5g9Tsp70/AAV/F/DX1kXvMtyFEpuB11DNcBnZzUZ4noFtufSFy9qfswc/djQ0D4ToGeWRxzDcuj5OMgEc57Kzq0CYjlAtfLj1ririJ1Oqtk5Cxx/KLJNa5/Bwx6O/y8wEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=F6DK0h1t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="F6DK0h1t"
Received: by smtp.kernel.org (Postfix)
	id 14D48C16AAE; Wed,  5 Nov 2025 18:32:08 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FB7DC4CEF5;
	Wed,  5 Nov 2025 18:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2FB7DC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E7D91C0005E6;
	Wed,  5 Nov 2025 10:31:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E7D91C0005E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1762367518;
	bh=euyM+3gDdbJVoDyKJqxz5X77e6ESc9izIMr3hTGFNAo=;
	h=From:To:Cc:Subject:Date:From;
	b=F6DK0h1tIEFarpFGuFs9seiLVL0OlWqf7UpgGYP7BsuNeo3U7URUMwWt3VMboemHx
	 do3FdwovimTxK0KoUslusORpyELH/yRQKWmXHSEf04W94sKcWUpUl9TsrflZI5ppbK
	 844F5uV89ai9+rogj/0MqKWJNyTpmhm1mzqjgzT4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 90F9818000530;
	Wed,  5 Nov 2025 10:31:27 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom devicetree-arm64 fixes for 6.18 (part 2)
Date: Wed,  5 Nov 2025 10:31:25 -0800
Message-ID: <20251105183126.3923882-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-arm64-fixes-v2

for you to fetch changes up to 5e44c5a2cc84bed6b92cdfd9c567fcdb9f792604:

  arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0 alias (2025-11-05 10:28:16 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree fixes
for 6.18, please pull the following:

- Andrea assigns clocks rates for the Ethernet controller for the
  Raspberry Pi 5 systems

- Laurent adds an ethernet0 alias to allow client programs consuming
  that alias to populate the correct Ethernet address for the Raspberry
  Pi 5 systems

----------------------------------------------------------------
Andrea della Porta (1):
      arm64: dts: broadcom: Assign clock rates in eth node for RPi5

Laurent Pinchart (1):
      arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0 alias

 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)
