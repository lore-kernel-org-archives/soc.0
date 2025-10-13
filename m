Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963CD308F07
	for <soc@lists.linux.dev>; Mon, 13 Oct 2025 17:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760376985; cv=none; b=KrN6JYfbhunNQlHBiZubNwdJDyrHFuM09qFCt9p89irUXnTyYYZMuITvNIh6LWX4F+41F7aZ1dSyskM0Cy9IALNj8u/rS7pcIYrVt7R+T8T3I1bWWqepQ/L1itFtOb82xlr3DRZlXf30QfuhtC+1mpK8CSA/5TQAAU9ZEkdXvP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760376985; c=relaxed/simple;
	bh=YvvcExKYd1+apPlAedYXi8ch9fKDzLoyfkAmUvpTrn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqDssx06h35ImNV3TMKeG14pvTjmj67HttjwDmVDQxnpQ/L2mDFbqpLuegLzRBf+UbLzM79CD04xl/TuaRBBoHCDeZsidNAHOX/R7B6Mc3HVNUCvlagMnCsLiyGTGD3ATs9KIilkkuAp/OXp2C+0XhKJYIR+PIt1XuZbgztpWms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FEygW4fG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FEygW4fG"
Received: by smtp.kernel.org (Postfix)
	id 44A6DC116D0; Mon, 13 Oct 2025 17:36:25 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6943BC116C6;
	Mon, 13 Oct 2025 17:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6943BC116C6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E34FBC0003DE;
	Mon, 13 Oct 2025 10:36:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E34FBC0003DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1760376976;
	bh=YvvcExKYd1+apPlAedYXi8ch9fKDzLoyfkAmUvpTrn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FEygW4fGY2B1MxdQyeYpasJEaWD4mlIVIn5n+HgIcKAn/SkEns1WbLEcyFIm8FHuv
	 W3o41d2qcROP/Jak0K/5/ntDl/EozGXbjWwJUsd2cx/gHVPjP0Z9GOhWl4E+7XLUGw
	 ONTKW2TP6xf5tbibihokHgpxr6+MR600cPMZ07Vo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 299F118000944;
	Mon, 13 Oct 2025 10:35:46 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom devicetree-arm64 fixes for 6.18
Date: Mon, 13 Oct 2025 10:35:43 -0700
Message-ID: <20251013173543.2489346-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013173543.2489346-1-florian.fainelli@broadcom.com>
References: <20251013173543.2489346-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-arm64-fixes

for you to fetch changes up to aa960b597600bed80fe171729057dd6aa188b5b5:

  arm64: dts: broadcom: bcm2712: Define VGIC interrupt (2025-10-13 10:31:04 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree fixes
for 6.18, please pull the following:

- Peter describes the VGIC interrupt line such that KVM can be used on
  Raspberry Pi 5 systems.

----------------------------------------------------------------
Peter Robinson (1):
      arm64: dts: broadcom: bcm2712: Define VGIC interrupt

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 ++
 1 file changed, 2 insertions(+)
