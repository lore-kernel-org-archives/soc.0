Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD44EEB3
	for <soc@lists.linux.dev>; Wed, 23 Sep 2026 02:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131786; cv=none; b=kLXUxWaJgNeYzjfIU9xdOoZAHHkiOm+1f2lRuRRG1xIRq27ManOvumGWJEwzPdlIKSMD+bs4MS4M4fCXAB6uuBW1Z2Wesa2clpONZ3yZ+C0M09lWCSpPncnlYPDi/4cDl/l2oe/6oStIfbLTmXV26+QGWf+knp8T+XhuLZjMgF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131786; c=relaxed/simple;
	bh=BMkDPZxdnBVRvpv1HfO7mBzDSX2mWYosLRsHoCCaTZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=on07mX6a30oH/SWYfVDXnORZeb7fKvc+QV/r/iTzM1iIDD4QLdTDm+QRk7lxeyqqbapIk/et6NDDpIxXdi95YxQ6w00SjPanj5GghUzjZXfU6POLg3tbpvdtBx+luYNPQCWxwAr+048DXBuQh7RwyfETMEfUQlCRlCtuNGzC2WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mm1eld4A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mm1eld4A"
Received: by smtp.kernel.org (Postfix)
	id 1170A1F00893; Wed, 23 Sep 2026 02:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672C91F000FF;
	Wed, 23 Sep 2026 02:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790131782;
	bh=KczbAkQhqY6njypvcnyBp35WCf0MGoTb+eczMmXqr4Y=;
	h=From:To:Cc:Subject:Date;
	b=Mm1eld4A/eeO+qKpe6H1EjhtnktMYJWvTurb2DQWwcLd/+qZPEpof//9nEgIecYRT
	 ql4Eddx84z+Dvm6QEeJlmfaNXZImNR4bPWX280boQBekO7Yz39I+tMDds7M6qSiJh/
	 ZJ02xwFR5IymKCh6Mkg8WhgzkhT8w+HmoMJ3kChFhEMr3lXOrsQQRr7vNMAprgHzRp
	 o3RbFKWFomcL4NIYKV6VbKjCnpPNtrBscqK2ruK6tEiMKjtaR+MHi4KMyghrt4/gnH
	 nKn5dHHCyBSFYj4Bk2Ex7GhKLb9DliCGIFPaLC1XoKvFovQFv08jd+3CQ7D+ZcVQbH
	 BMpBkeUN3BwCw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.4
Date: Tue, 22 Sep 2026 21:49:39 -0500
Message-ID: <20260923024939.406813-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.4

for you to fetch changes up to 897cf6d54f366885e190e75b3a221e7b3ae35065:

  arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor (2026-09-12 14:18:26 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v7.4

Enable the SGM3804 regulator, Renesas R63419 panel, and SY7758
backlight drivers needed for the display on the SM8650-based Ayaneo
Pocket S2.

Enable the QMP PCIe Multi-PHY driver as a module for the shared PCIe3
PHY on Glymur.

Enable the PMIC5 Gen3 ADC and ADC thermal monitor drivers as modules
for system thermistor measurements on Hamoa-based devices.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor

Neil Armstrong (1):
      arm64: defconfig: enable the necessary drivers for the Ayaneo Pocket S2

Qiang Yu (1):
      arm64: defconfig: Enable QMP PCIe Multi-PHY driver

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)
