Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658D51B6CFB
	for <soc@lists.linux.dev>; Thu, 23 Jan 2025 20:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664397; cv=none; b=pnh8yBy42Wlqf8OPA34DtEaJrqxNP8lu6//wr2VgWaoP0GQqNupl8fTkqOI0Ks0QwUmBxpVjibTFb8X2gA2pukSAEX5zGTt77n5lGp3ZLoDemExaPNAEqjG76RayzjWf0qQBsOvei8umnFzQaHBL9P/1CCga/DBtwr7riRWE2SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664397; c=relaxed/simple;
	bh=NzAv43XRmSsTSm3/eC+rMC67Y4keakaL3BNXK4ygDRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WCTXcmfk4h77LCOuUbDsgpjimXwW/mI+31n/fOC9kABgmOUUOqRPkCrPkT5GuQDDmkv8Q4KKU0Z/lSiZWMoAT3mZfDhum4EOBfeqprv+wsOMCmOVHV3lW20Ybw5nW7MuUNc5AdyV4euG688ZTvrLBrEuLvKokaxn1TlpoPBYZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hXPgmSG2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hXPgmSG2"
Received: by smtp.kernel.org (Postfix)
	id DD992C4CEE1; Thu, 23 Jan 2025 20:33:14 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (saphodev.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC6AEC4CED3;
	Thu, 23 Jan 2025 20:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AC6AEC4CED3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 34576C002813;
	Thu, 23 Jan 2025 12:33:05 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 34576C002813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1737664385;
	bh=NzAv43XRmSsTSm3/eC+rMC67Y4keakaL3BNXK4ygDRk=;
	h=From:To:Cc:Subject:Date:From;
	b=hXPgmSG2A8wU7A+a8oHvBCMHTusmch/rbfNXg9YR+iyX3c0S7nkbIg7BzVjmxOqXZ
	 N54MBGh3a0NkaTyGUlwDzg8qaW5Nv7xAeP++N06xNApd7vsg8Lpef5z4rNDP5I7NL+
	 Q3v2MkbM5eJKzcDOXNvfymWNmK75QHTNu0lSdR98=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id D63B118041CAC6;
	Thu, 23 Jan 2025 12:33:04 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom defconfig-arm64 changes for 6.14
Date: Thu, 23 Jan 2025 12:33:02 -0800
Message-ID: <20250123203302.1491843-1-florian.fainelli@broadcom.com>
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/defconfig-arm64

for you to fetch changes up to 6e59bcd1e088901fe3441b2f3cfe887cdf544a4c:

  arm64: defconfig: Enable pinctrl-based I2C mux (2025-01-14 15:16:37 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs defconfig updates
for 6.14, please pull the following:

- Stefan enables the pinctrl-based I2C mux driver which is used on
  Raspberry Pi 4 based systems since we switched the Device Tree files
  to use the i2c mux representation

----------------------------------------------------------------
Stefan Wahren (1):
      arm64: defconfig: Enable pinctrl-based I2C mux

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
