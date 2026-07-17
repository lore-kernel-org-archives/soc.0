Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799C82E92B3
	for <soc@lists.linux.dev>; Fri, 17 Jul 2026 15:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302626; cv=none; b=knPN8fDSCIUh90wf5xLPU0+a8KsyYC+vWQQd1HMJiAb/Rh/Rgqo2Jgj0Dn+oc7Vwut4jLezjVaCHJo4O0Wv0T2YsGA1LoSrqAZDnYYwA9Q/AExrhtx5XTfoAj9m65BILYWlZ+hcQ/e9Qh+NXbtxDwq83rsXLGj4pkk6p1fBduv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302626; c=relaxed/simple;
	bh=QNKnnwYDmSxeKtg5cQ23EmAhicOe+gy+JmrxlUAN3Xg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=VW1TA7uYYABQt9dgIEE6h2QdJIyBvY+9cMghLBkdCvxFbzld91UsbQtZY7lHF9J53nTnarVPSMBi21FR8KzZPW87GIf4RLp7Sb/vN+CG57MI5G/1I2FQOTc+yzY0Pq9UGDSPiYsyDUNQkSv77+2DAuhZnRH0EvHFmHzO3ojpmck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=0GzJiit4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hJCcXWYw; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="0GzJiit4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hJCcXWYw"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 8EF0FEC018A;
	Fri, 17 Jul 2026 11:37:02 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 17 Jul 2026 11:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1784302622; x=1784389022; bh=QQ
	BP/yB6MAPkv2pKBr9AcgRIfLc2kv6MLdfKCeDkkmo=; b=0GzJiit4nEOTM7h45N
	M4pKO7TyRKsZeIV6MluzmVw09+sFsim0scD5i5LquwCJNin1C6oHOtxWHJbsev4F
	vJr3AVebmi3CCdqJnwa7gnHRAfGN8hbXtRsgKOLRFw7e9mVUiJOC9QxESGXjlVwm
	0G6a2VivNsijkcHwM7G0b5LMusqzlVJfxctTL7EuG7t2viGm0XWI+8G0YuKtlGNh
	HhHizUwQhm7jMWrQS5lnEK1dZFIbE+7MZ/vK0t0mTZZOKq5tG1N6Xknhv2fv6yPJ
	kuRdNZ02yGV2ed6/EH8Tb/EVQTBupiR2qONbNVaVe/syDaXhBKysVHchJpeMrTqw
	aUjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1784302622; x=1784389022; bh=QQBP/yB6MAPkv2pKBr9AcgRIfLc2
	kv6MLdfKCeDkkmo=; b=hJCcXWYwu16MGCZeXlf5clwUvUoqMhmUctr48PqJrio8
	gtw9WB6O0OLGkpd/2YYv2UsqHhCEy3VFD62rwTKRF29eijxiEodGT7ULUvg7qeLu
	eRFWTpvKw2DW9MrK+iPRKf/zXltmZBhwUZm8gAtb/GGL2bBEiBBqGYCdp8z3WonN
	Oxz3MBGLAVWyM6/zOYihFClzEaGAA7HShZ/D274x5o0ZoRqNDXRo857MuQdb2yjE
	PeaRPAzWlzZDHPKNdHuj/HhcmWBlxJLkf6WD1QQonYFx5AUeapCgDy2uxUdrbXu1
	HZeLariDcUlJ2HBEF/uysWZQC5gslV59i91AKPXUGQ==
X-ME-Sender: <xms:HkxaasTBsW_I1TsTSL5Q3ckVs1fQvkbpJ-uDeR8imPEp3zHIg0nJtA>
    <xme:HkxaaklsBLce6PQ1A6D0YtcCxRddfGddQ2ybBV_5Ay8L8jYgfP0UVMuRT_rDcbrPF
    vJXmW5-DhV1-c0S1ZdWTijqeJs68h7yCV6JH_KsNQuERoarxNax9t37>
X-ME-Proxy-Cause: dmFkZTGO1a+ELqc/jATRbDevAoYzv0tMsX2lM8RlgGENghcT7UFNypaqNAb2S5eH3CaqYC
    wo/MUbGjurUZfXGA75oZnIpCZw/DplETnoBk1NKyDDSIfMwc2LSCZD+qSQfEi6kcoTfvUS
    pKHp3zI7vBoMf+pDsIPr9OI6hTf7aGzGWNmIT4XXBYLjDVw+AHrQohh0Lt4Xq/PmUmxhdY
    s9MGG9VloK+tzUL4OIQGn2JHvLkzlS7XQEZCuNCuM+33tppCvQZQLyew+xm/2BzZGvIygm
    CrMYhPfmizvgrCsuuLHsVno3NFxEd2n8ena4+80n3dM41MfJwuqK8Av0l//kNXu+gXlfKa
    /MkSSNJHmGGc9lXksdTF3sNJsfV1YqObGYcUGuPzShzpFr1Lhg6QofJUkrZHohkS68u+1a
    Q+5YPrDNg8yUfKOmgOkWOFDL/97Y5iILyASv1OxIvJ1qtaRdGrTed3wMA5B8CxQklzt0yJ
    4bxdq2m8BwDFlg6H3zWZ9XNvHDvwUx4kXNYK8nYBUEpyDrLSGqWSBX+hFqXI7YnYubEs3i
    e2JjxR1KiNGnh5b0ycLfnRY9o3QqJLiHD0LQZ3EARgmEsLaaJKLlPe4kgFRXPmp1k1Rh6N
    PqV7N6D4RQdiJekQBfAh3VbC2XVAgsP6wu+VSVrMLsVhj5ONMhLIhCvu/OHQ
X-ME-Proxy: <xmx:Hkxaal8OcjWQhizroBQ-XJJpadvUw6eyoyoBYjjf_H3x-v61Vr6e4Q>
    <xmx:HkxaaglfOvfDWKfB6_39PUgp4ay2iBso5LRKgmzDcZhb4_tMfSGOVw>
    <xmx:HkxaarUfm8IUNBJtPTMa7GH1FF4mskEShtfI59EBKBRtH4R_TGzkGw>
    <xmx:HkxaalFIBvGBQSwqIFfhON_HWcPD6-YgVzuUsT8rDxHPaRBT-FR_jA>
    <xmx:Hkxaal0IyAVEAi69doxUyoryRmw6gT4_897VmvnAgz5cLPPgo_9J6Liu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 29BE31820082; Fri, 17 Jul 2026 11:37:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 17 Jul 2026 17:36:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <69fe5d78-221f-4825-a2a5-fd78f62f3628@app.fastmail.com>
Subject: [GIT PULL] SoC fixes for 7.2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8=
dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-f=
ixes-7.2-1

for you to fetch changes up to 3d9855d114f0955d590420f5670152c1099c1638:

  Merge tag 'renesas-fixes-for-v7.2-tag1' of https://git.kernel.org/pub/=
scm/linux/kernel/git/geert/renesas-devel into arm/fixes (2026-07-16 15:5=
9:57 +0200)

----------------------------------------------------------------
SoC fixes for 7.2

There are only three devicetree fixes this time: one critical memory
corruption fix for Renesas and three minor corrections for Tegra.

The MAINTAINERS file is updated for a new maintainer of the CIX platform
and two address changes.

The rest is all driver fixes, mostly firmware:

 - multiple runtime issues in ARM SCMI and FF-A firmware code, dealing
   with error handling for corner cases in firmware.

 - multiple fixes for reset drivers, dealing with individual platform
   specific mistakes and more error handling

 - minor build and runtime fixes for the Tegra SoC drivers

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Remove fallback compatible for GPCDMA

Arnd Bergmann (8):
      soc/tegra: pmc: fix #ifdef block in header
      Merge tag 'reset-fixes-for-v7.2' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/pza/linux into arm/fixes
      Merge tag 'tegra-for-7.2-pmc-fixes' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tegra/linux into arm/fixes
      Merge tag 'tegra-for-7.2-soc-fixes' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tegra/linux into arm/fixes
      Merge tag 'tegra-for-7.2-arm64-dt-fixes' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/tegra/linux into arm/fixes
      Merge tag 'tee-update-for-v7.2' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'scmi-ffa-fixes-7.2' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'renesas-fixes-for-v7.2-tag1' of https://git.kernel.org/=
pub/scm/linux/kernel/git/geert/renesas-devel into arm/fixes

Breno Leitao (1):
      soc/tegra: fuse: Fix spurious straps warning on SMCCC platforms

Christophe JAILLET (1):
      drm/tegra: Fix a strange error handling path

Gary Yang (1):
      MAINTAINERS: Update maintainer and git tree for CIX SoC

Geert Uytterhoeven (1):
      firmware: arm_scmi: Grammar s/may needed/may be needed/

Jens Wiklander (1):
      MAINTAINERS: .mailmap: update Jens Wiklander's email address

Marek Vasut (1):
      arm64: dts: renesas: ironhide: Describe inline ECC carveouts

Pushpendra Singh (1):
      firmware: arm_scmi: Rate-limit queue-full warnings in IRQ context

Robby Cai (1):
      reset: imx7: Correct polarity of MIPI CSI resets on i.MX8MQ

Seth Forshee (1):
      firmware: arm_ffa: Respect firmware advertised RX/TX buffer size l=
imits

Steve Dunnagan (1):
      firmware: arm_scmi: Use 64-bit division for clock rate rounding

Sudeep Holla (1):
      Merge branches 'for-next/scmi/fixes' and 'for-next/ffa/fixes'

Sumit Gupta (2):
      arm64: tegra: Fix CPU compatible string to cortex-a78ae on Tegra234
      arm64: tegra: Fix CPU1 node unit-address on Tegra264

Tanmay Kathpalia (1):
      dt-bindings: reset: altr: add COMBOPHY_RESET for Agilex5

Unnathi Chalicheemala (1):
      firmware: arm_ffa: Fix NULL dereference in ffa_partition_info_get()

Uwe Kleine-K=C3=B6nig (The Capable Hub) (1):
      ARM: Don't let ARMv5 platforms select USE_OF

Yixun Lan (2):
      reset: spacemit: k3: fix USB2 ahb reset
      MAINTAINERS: Update SpacemiT SoC git tree repository

Zhao Dongdong (1):
      reset: sunxi: fix memory region leak on ioremap failure

 .mailmap                                          |  1 +
 MAINTAINERS                                       | 12 +++----
 arch/arm/mach-ixp4xx/Kconfig                      |  1 -
 arch/arm/mach-pxa/Kconfig                         |  3 --
 arch/arm64/boot/dts/nvidia/tegra234.dtsi          | 24 ++++++-------
 arch/arm64/boot/dts/nvidia/tegra264.dtsi          |  4 +--
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts | 41 ++++++++++++++++=
+++++++
 drivers/firmware/arm_ffa/driver.c                 | 29 +++++++++++-----
 drivers/firmware/arm_scmi/Kconfig                 |  4 +--
 drivers/firmware/arm_scmi/clock.c                 | 11 +++---
 drivers/firmware/arm_scmi/notify.c                |  6 ++--
 drivers/gpu/drm/tegra/sor.c                       |  6 ++--
 drivers/reset/reset-imx7.c                        |  6 ++++
 drivers/reset/reset-sunxi.c                       |  4 ++-
 drivers/reset/spacemit/reset-spacemit-k3.c        |  2 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c            |  2 +-
 include/dt-bindings/reset/altr,rst-mgr-s10.h      |  2 +-
 include/soc/tegra/pmc.h                           |  5 ++-
 18 files changed, 113 insertions(+), 50 deletions(-)
