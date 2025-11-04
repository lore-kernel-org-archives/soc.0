Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C942A2AE89
	for <soc@lists.linux.dev>; Tue,  4 Nov 2025 22:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762295295; cv=none; b=g8zsW4ZOQypChUEZ/MST/m9aQEKbpcLJ8a4eEbad4baFseuA4TiC33AZe6cLGobuvIALkv2B6i00kZVPabPNIW5RkxZDqVoo6cvQXzNz6ohGBxv/6rYZZbwCuS8XqrLyPn+ozmfpeJKSz6ju/n5sywoaAEMNXvnSuJpRzrEAXIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762295295; c=relaxed/simple;
	bh=p2n4TFm415R2JyPtCWeHvuVmBkp52QEUaSpQMwo74Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXyQOO7K8wJouQQiRt8uVDtuhIDUzUz7Zf5d/qNO67JmBjueUi4KMnJv/WcXLQccKnwAGtYR4K8v7j4ir4LHc+XStaDV7YrqnKP8/4WpmVsaOFXccFOHDnvLdWVu4V9HjUBsDH0DSClP3xNVpH5CDBtjStK8FlAifConWh89gxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=o4sxXqjT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="o4sxXqjT"
Received: by smtp.kernel.org (Postfix)
	id 84F97C16AAE; Tue,  4 Nov 2025 22:28:15 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B488DC4CEF8;
	Tue,  4 Nov 2025 22:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B488DC4CEF8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9AA0DC0003E6;
	Tue,  4 Nov 2025 14:28:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9AA0DC0003E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1762295293;
	bh=p2n4TFm415R2JyPtCWeHvuVmBkp52QEUaSpQMwo74Jw=;
	h=From:To:Cc:Subject:Date:From;
	b=o4sxXqjT5Lh6LpOot2VzdLl4xruyXIAa0PScWKuPZP9sIxYZcxGe/HVpsl7W/aHjY
	 eDJDpzxrW9J3wF8BxZVn1lvCX/k8DdZ35mYQUUfm62XzivYDxWb4tYmkARG/OlRd5C
	 7mr/tjFjRodmut9yBGCH7AAYSv/qPYdKvpyVncmY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 475AE18000530;
	Tue,  4 Nov 2025 14:28:13 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom defconfig-arm64 fixes for 6.18
Date: Tue,  4 Nov 2025 14:28:10 -0800
Message-ID: <20251104222811.3874608-1-florian.fainelli@broadcom.com>
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/defconfig-arm64-fixes

for you to fetch changes up to 9c16e4d216d8103a8178bbe070eb21f779f190c0:

  arm64: defconfig: Fix V3D deferred probe timeout (2025-11-04 14:20:40 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64 defconfig updates for 6.18,
please pull the following:

- Stefan ensures that the clk-raspberrypi driver which is now the clock
  provider is built into the kernel image to satisfy root over NFS

----------------------------------------------------------------
Stefan Wahren (1):
      arm64: defconfig: Fix V3D deferred probe timeout

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
