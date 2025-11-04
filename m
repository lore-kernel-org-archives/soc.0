Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94912356BE
	for <soc@lists.linux.dev>; Tue,  4 Nov 2025 22:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762295295; cv=none; b=ovSx1M33/sFXFZSy2lF0m/Hd6XV4uNIv/iZLv8tOXESNHHruK1g6IH0euVXJ7/xxyT3Ks2LMFXoUa8l0iccyxYHU2gk4oJgiKcOXdbtb6HYRKD8yjylbKulyXEeVNuayOxjKSNjPeul0u0/4BIHQCwHkE9KqOrRDVQpeRkPvVfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762295295; c=relaxed/simple;
	bh=eMyJfYp9kZW290dl9Vblnq83aD+uquXJrXxp2Bnnug8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rawyqxmJ+lyPEdPCMxQC1XrwfA67VAGmtulqWuMqHiXBbRSgrd7fwuB5sYrBwAUtqFSSu8NciuSM1Z3oQOWjXwQDg57l3JwZOs4wWgtSNqRUJ8Iqfit+fc+2bLUiiUsGsKy+D1VpM6lMaCwqgtHCdYyeEadNQWGe0rrQIttzjJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=syorIhIg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="syorIhIg"
Received: by smtp.kernel.org (Postfix)
	id 7B43AC4CEF7; Tue,  4 Nov 2025 22:28:15 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5292C116B1;
	Tue,  4 Nov 2025 22:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5292C116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 865E8C021961;
	Tue,  4 Nov 2025 14:28:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 865E8C021961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1762295293;
	bh=eMyJfYp9kZW290dl9Vblnq83aD+uquXJrXxp2Bnnug8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=syorIhIgSNBNPUlvrEtHR/NKnKUiJ1LLAuTTSkfKvdmgaNVl5OZpfWyqZcuxtzMM2
	 zABVWvWlXyMBOeh2haabV+klPgdpM/nVzdwHzeEQsqHh+XJLToMx5btB6ysiGQZLnk
	 TFBHze6FmBs6SasLDaoZ2gPgDWUFuiDwC+TjQQag=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 688661800084D;
	Tue,  4 Nov 2025 14:28:13 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom devicetree fixes for 6.18
Date: Tue,  4 Nov 2025 14:28:11 -0800
Message-ID: <20251104222811.3874608-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104222811.3874608-1-florian.fainelli@broadcom.com>
References: <20251104222811.3874608-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-fixes-part2

for you to fetch changes up to 3d1c795bdef43363ed1ff71e3f476d86c22e059b:

  ARM: dts: BCM53573: Fix address of Luxul XAP-1440's Ethernet PHY (2025-11-04 14:23:39 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree files updates
for 6.18, please pull the following:

- Rafal fixes the Ethernet PHY address on the Luxul XAP-1440

----------------------------------------------------------------
Rafał Miłecki (1):
      ARM: dts: BCM53573: Fix address of Luxul XAP-1440's Ethernet PHY

 arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
