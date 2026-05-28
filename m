Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E81330666
	for <soc@lists.linux.dev>; Thu, 28 May 2026 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994752; cv=none; b=sM1M+I+jpfeii8+s+pFN4GQpl4+O8YGXumxH7XG+SPFw3RGUhXxLYkOadaHdqnwBy6Xfavq/FXq28yvFdoZE7jxsBsbaXxDNE2BYmFUdHCBX1dbQvdu9TWUG9kwXeTT6znHDSj537i71H5AZDeDkh/gUwTr0xIupNjeYY+IJtSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994752; c=relaxed/simple;
	bh=DYq9Mv0HIO4/Hhb7/iv6w7xHNHWjmsxU4I7+J4pdPcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uirw6INRWv4KDSNOqWxR1iKqOdWgQHnXLwDoP4rKOd0abexarpYB4H5uQMgZuyX7Ye/yKZT5jGv/YbOdr/aXXcx9B1OAgx+OCgb/jXCd5OMJRY6nDor/ZXmyUvCthSUnSl1INaKTxVtqRQRIrHsrJY4m3NATBLrKpw4VeJT5fas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAJMdreR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAJMdreR"
Received: by smtp.kernel.org (Postfix)
	id 1AA1A1F00A3A; Thu, 28 May 2026 18:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082D51F000E9;
	Thu, 28 May 2026 18:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779994751;
	bh=kVbwVV58HXkR8RkEhw6MU26AYDa34tbTeUacWmMzKjg=;
	h=From:To:Cc:Subject:Date;
	b=JAJMdreRzmLpPJyDjwvjHkrmdzTCIxjIHsqnl8YP521Glslnu0YNQOPo+CMB+GJpo
	 NskVtZRDMifFbbE6KSMEw+gHG98/pHlCvWolD8OyrLGxAwm0EkDR6Qvw0hWx4XoJNk
	 drpKuo7Qz1cZAiobUX+hwC5oq8m/z8DGBMr/adzqtThGMLbvJlZcZyxFU97khRqP9W
	 BoIghHfv19cgWzPFLn+wrVibWoinmDuAKpFTAi7gNwwJ94twXMTYum5i/iYP+R2HBZ
	 0+HQHcQn153soonjnQn359D/5TN020Dqs8hHuqnP+K7zGPrCjNe/wTGBVHUgrD3p87
	 hIcJQxZErDIMg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Updates for v7.2
Date: Thu, 28 May 2026 19:58:55 +0100
Message-ID: <20260528185856.777407-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8
The following changes since commit a6848a50404eefb6f0b131c21881a2d8d21b31a9:

  firmware: arm_ffa: Fix sched-recv callback partition lookup (2026-05-05 16:42:49 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-updates-7.2

for you to fetch changes up to 18706ea68fc4344049bf693b702cb311a7c27ca7:

  firmware: arm_ffa: Treat missing FF-A feature on a platform as a probe miss (2026-05-27 10:14:23 +0100)

----------------------------------------------------------------
Arm FF-A + SMCCC updates for v7.2

1. The FF-A core is moved onto the driver model by reverting the earlier
   rootfs initcall change and registering the core as a platform driver with
   a synthetic arm-ffa platform device. Enumerated FF-A devices are now
   parented below the FF-A core device, and probing is deferred until pKVM
   has completed its FF-A proxy initialisation.

2. The platform-driver conversion is also adjusted so systems without FF-A
   support treat early unsupported transport/version discovery as a quiet
   probe miss rather than a failed matched probe.

3. The register-based partition discovery path now honors the descriptor
   size reported by FFA_PARTITION_INFO_GET_REGS. This keeps parsing aligned
   for newer FF-A descriptor layouts while still copying only the fields the
   driver understands.

4. Also included is an Arm SMCCC fix for the optional SOC_ID name call: the
   name query now uses the SMC64 function ID required for returning eight
   characters per register.

----------------------------------------------------------------
Andre Przywara (1):
      firmware: smccc: Fix Arm SMCCC SOC_ID name call

Jamie Nguyen (1):
      firmware: arm_ffa: Honor partition info descriptor size

Sudeep Holla (4):
      firmware: arm_ffa: Register core as a platform driver
      firmware: arm_ffa: Set the core device as FF-A device parent
      firmware: arm_ffa: Defer probe until pKVM is initialized
      firmware: arm_ffa: Treat missing FF-A feature on a platform as a probe miss

Yeoreum Yun (1):
      Revert "firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall"

 drivers/firmware/arm_ffa/bus.c    |  3 +-
 drivers/firmware/arm_ffa/common.h |  4 +-
 drivers/firmware/arm_ffa/driver.c | 98 ++++++++++++++++++++++++++++++---------
 drivers/firmware/arm_ffa/smccc.c  |  2 +-
 drivers/firmware/smccc/soc_id.c   |  2 +-
 include/linux/arm-smccc.h         |  5 ++
 include/linux/arm_ffa.h           |  4 +-
 7 files changed, 90 insertions(+), 28 deletions(-)
