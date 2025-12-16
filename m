Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAE0272801
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 23:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765929423; cv=none; b=TT/cvymhtzc9Q0NCt24sVXFC+PAKSjeUkzMJnNIeMRY/Z8+GCyCA4UISzZF4DL0RfjEPptnMtNxp+yZYZZyVJfFPltYTOSFISkQA/4ezdvDbhZSyKYXEeEqFL1zrXlQF1zw827sWA9aYiEp/E4kej8CL8Vm64fl0gAJePe82SOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765929423; c=relaxed/simple;
	bh=+GhQz0HcVABtkaWXGXcZPptUFJwcu/sMoBufxXOMtLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=igblpl9a7NJvXMi/8mkokVcrEQUvkW4jYti0ODPCR8BDagoquBLpkMT01LG87vmodGlHKBHW8RbebVZwVGn6tf+06YvnD32Opb5AYC9kd4+jVXqXqIX3cREohcwxXesQvcWvAu41E8s6BD5A2PeaneN8bKMmygOM9YZT52ffBDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=B/8glXId; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="B/8glXId"
Received: by smtp.kernel.org (Postfix)
	id 41FDBC19422; Tue, 16 Dec 2025 23:57:03 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 611F6C113D0;
	Tue, 16 Dec 2025 23:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 611F6C113D0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1D2E7C001515;
	Tue, 16 Dec 2025 15:56:52 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1D2E7C001515
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1765929412;
	bh=+GhQz0HcVABtkaWXGXcZPptUFJwcu/sMoBufxXOMtLk=;
	h=From:To:Cc:Subject:Date:From;
	b=B/8glXIdreocIh9Ji/XcZTn4guKqcoQlJOjx5X/VT/Jy4zAggtsqZmsvG3w5EUdvI
	 eAqU0pByVfzVbYn6SLe26kBUJTVLft07pyzh7+dhYBvEuM80mWX1yTtFYEUCt4yntp
	 fGI6Iiic5vp7SL/0uGAc066KFGeJOTn5spaZ1itc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id B6DB218000520;
	Tue, 16 Dec 2025 15:56:51 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Stanimir Varbanov <svarbanov@suse.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree-arm64 changes for 6.19
Date: Tue, 16 Dec 2025 15:56:49 -0800
Message-ID: <20251216235649.633331-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.19/devicetree-arm64

for you to fetch changes up to 37c3a91e9730e274fe2eca9703033ae0f154cb62:

  arm64: dts: broadcom: bcm2712: Add watchdog DT node (2025-11-05 10:28:29 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tre updates
for 6.19, please pull the following:

- Peter enables the random number generator on BCM2712

- Stanimir adds the watchdog Device Tree node for BCM2712

----------------------------------------------------------------
Peter Robinson (1):
      arm64: dts: broadcom: bcm2712: Enable RNG

Stanimir Varbanov (1):
      arm64: dts: broadcom: bcm2712: Add watchdog DT node

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
