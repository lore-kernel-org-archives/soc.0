Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DE828F946
	for <soc@lists.linux.dev>; Tue, 13 May 2025 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747145296; cv=none; b=NXYyeopcQiZidIvXHg4nEJ8xWlWkh5jTm4+7OiSL13YDJ4kgQq/FiSpKeEHZNE0S1B8N5aKXNsdtmHFe2sGxfECFTzogkQ+dIO5vks0GMX60mf7ZP0R/Jt6ruI5SllAhaz13kMlOv1U+CgZ/XyyjuYYV8u8ugN7yuM1Jdx1x64o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747145296; c=relaxed/simple;
	bh=WemnVThzCyQ5qTlrfFam/oOOdbwwb/2UhX8WWEZMbrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kVvpA5/TnizJI6rAkMa22jbtCOAxzNUQ1IcG6xKFirkGHalL04wKSDHbeaLJyKbL7rYE0ZTbhu6CnSXRqpOwIHS/zBoMk1BkqrM26G26NEJWagjZ9Y85fDyBjCArC1giOA0RodhsQ9pEcSlIrb/vzgrxAP4b+O8Ryk9wjn3dzzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BPxtObz3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BPxtObz3"
Received: by smtp.kernel.org (Postfix)
	id 04457C4CEE9; Tue, 13 May 2025 14:08:15 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCE8AC4CEE4;
	Tue, 13 May 2025 14:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DCE8AC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D921FC0000FD;
	Tue, 13 May 2025 07:08:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D921FC0000FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1747145292;
	bh=WemnVThzCyQ5qTlrfFam/oOOdbwwb/2UhX8WWEZMbrc=;
	h=From:To:Cc:Subject:Date:From;
	b=BPxtObz3rYVMAAyqtfr6+InskLRw8DDWSwdoa+3uF293iSxfzBNYZZdr82Sv1h3rm
	 lMf+VbQNE+pMJSiC2haA/WiqY4R0vSbboVDPwBa68/j4Zxm7Un5m0cD2qB3+wvnyHJ
	 DGByc1fx0kNLW0hyLS32E3xXKgBdrG6qeLIYbMDA=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 827BC18000530;
	Tue, 13 May 2025 07:08:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom maintainers changes for 6.16
Date: Tue, 13 May 2025 07:08:08 -0700
Message-ID: <20250513140808.2047729-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/maintainers

for you to fetch changes up to 840bb13005f2d0d2a9fd912c1660551a46654368:

  ARM: broadcom: MAINTAINERS: Cover bcm2712 files (2025-05-05 12:30:07 -0700)

----------------------------------------------------------------
This pull request contains MAINTAINERS file update for Broadcom SoCs,
please pull the following for 6.16:

- Krzysztof updates the BCM2711/BCM283X entry to also match on the
  bcm2712 pattern to cover the Raspberry Pi 5 files

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: broadcom: MAINTAINERS: Cover bcm2712 files

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)
