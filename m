Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A11940E8D9
	for <soc@lists.linux.dev>; Tue, 16 Jun 2026 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781596523; cv=none; b=o9Lb26qkvWxhAv79nITD9Lg1f/svsTJ05gw+9PUJylZmLjVuIaxL9aQu1tVk4lAmCcMBxClK68hDZ9r5rY/3d29lisU1vOXAysWYyRgy5Ipl1+J/L40d9Qel7qG4zcVZvQtJMVwJubUDVDFkDpc5UwNQeBSk+tcrMhBPGTn7Luo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781596523; c=relaxed/simple;
	bh=fUylvnrYHzcPotr779vJyt65YbSeojPfJ5mCwTaKJww=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YStwKilJkC5IdaM9qc20T+1U4h+xeVTaoCnD46a0fdBFh1eLpuI10ngxu4VmW3mrSj5ssclkVpnV5FB+ZlGdO+iWBRrQ0ePDQSTzyAUFsWleWIe1+q+n4Ps/3691900/oxZ9xrOXATtOa+HTm350Ly9hNum/SKurx+XWdH8qNu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=TiP19Vbb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bhCk7z2F; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TiP19Vbb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bhCk7z2F"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F09D07A014E;
	Tue, 16 Jun 2026 03:55:20 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 16 Jun 2026 03:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781596520;
	 x=1781682920; bh=ZWYzyi/hDOpR0gZJ+9acGJxyYIDhvu1KnXunfbilrDc=; b=
	TiP19Vbb6ipM8kkt7Dvs4s3bX1nxkX69zEiW/D+ZBDKuEy+TfkU1OGTmFz4sajTr
	y1p6RNi6RNMtujtEDRoZK7EEdQM7xXjy6JIq8QQP8LoQZHfTjdRsxuLhr42EcLSV
	S4U/K7oZLNSJUTYhIJY1ea6TenVEywAnZuMisVtehu/K5qdSxdCVL5TV1uPtyspP
	/H6/dakyTcNNASkJ1j2GXgZsNJKzbvFFTBdOHUx1LXchGM0BLAGWGKVuSBuX4vPQ
	Wkp1YHdo+6DDA9gIv6xJuY0Uj/R0C20uj2wA+tfxigd3Mv46V3y+sn9xeCibhxW8
	fdkw5LIlDbcZpe6fiweFzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781596520; x=
	1781682920; bh=ZWYzyi/hDOpR0gZJ+9acGJxyYIDhvu1KnXunfbilrDc=; b=b
	hCk7z2Figwdds0iAF4n/P+/JcYfL0FYOIcS447UFqn9Yedlpgu6snchKMLdAuslN
	fEa5+/zgTFMelDxyRfqmSJUGVOr4zfyjTj1pJh8NlArmIPmuyXnanZwd6iL4RE9X
	1iulbYZGMG3uiKhP5L5LPr6kA73bIkEx9ZzfPGS0ftfhHxfol74+HsCI6QNNadLa
	09/8vBFUutqf6L8ia9JIOp02k6xz3pBkz6NgmrSfYd5yxYDnjRbrLZPzmU1rizgw
	laFNeZvhNRHpm2mcsBEcLQd4YB42bFqH1AFF9xYgGn1rgo3woPgyFZGNKkuILZAU
	ELpbgn/SsUkWDpdA1iKow==
X-ME-Sender: <xms:aAExavt91xiFQ6k61xT02aDuxldymYGVqifx12nt_Iz1GPwCV-YuUw>
    <xme:aAExarT54tfQ59lWCt6lkI2Rtwg7PcZMkFGLW5OSqGNMJcM0gZXvfaFxStqtIFvSq
    P1CHWnCAq4GKfUeM1ECbPfR67IAANUeDQTq_d78EnNA2vUbLvdCumw>
X-ME-Proxy-Cause: dmFkZTGTgv2iDmylbcyYWZ/ua5tyXp/lejsONmtQlT9MQq1sSyTw2KVabUenBvic+NGWEU
    QLDnZu6J3rq6DJrT7lDzlQDtRV3EMgAPi6ZH8g3q7OJwQF3RTUpK7+ltWntH8vkm3kMLHW
    aDmBEqiT67KcM/pzemJqXSTLsdug2eRd2yLGvfgUGWZpkQo7xdKm4NwKPcaa49QukNWTrs
    ITvQ4oTRWyT4a/JEhDky/AjfJQv8I1THo8CNIbOzzB3uXStwzO7BMJ/J+E/5bMrJG09Oj1
    NuIg7g69xF/APpAjj7DUHysF8otP98hQrKrrY6hWYQUiG/Yg6JxdAoC6ou3pJSjCNvMRW9
    EHOi4M10NzXXYnyXxCioDg+wYCsvU8Qo2op2AMf822oWOj2xRpAIsRf6VIOVDIJofqjCsa
    yr0WNjbICDjHqwSwqcFZZUWwAf0KyUFbI/IjCh3gikZp4ZFcrXS8M6aMGWxVYY6iX9iUtM
    VWn43MsXRRfnVVuE8uhrJv7MMRFcCQUOWKeB0HNxzDq/z9IpeF1DKcAMvHW0BPcLjYFv7x
    u+vCVL29RdWp3fK0leYdKkAJDiYqsSCwsaFxW88JkeKN+/h+RWolckulbndWkfBYdHXkFr
    Dtr19wEm361GS+R8URC/x35D5AeGDwEfRv/1z5kSGFxoL8BUr3bJWgAhmD7g
X-ME-Proxy: <xmx:aAExahQ_gBs4ZMs6COOhEfweW2mDbxSMdyGvZWI_FujjqD8SLT68Dg>
    <xmx:aAExatDXhGtrbEBC9r7RPdb4e9PesrItvnj-xezSyJ8QBcSmQ3F8jA>
    <xmx:aAExapGfeGDODSnupTXJH-JCGdcEc9zdyqBbmRcWIti36AH7Bm-czw>
    <xmx:aAExavCkE9kBRgpRPs6Viv4a_EKzsUhdtFfsGz4Nq75IoVhGqBW8mQ>
    <xmx:aAExatVtmk-iIfx1NsZ41EtmLIMe_UtvDbZuckBga-nqg95JwCdeBoZm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 97019182007E; Tue, 16 Jun 2026 03:55:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 09:55:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <c00cadd6-b8ae-4d09-bcdf-adbeab2f0e11@app.fastmail.com>
In-Reply-To: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com>
References: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com>
Subject: [GIT PULL 4/4] soc: arm code changes for 7.2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0=
f32:

  Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-a=
rm-7.2

for you to fetch changes up to cb2c3b5e113f26f74ef05926c6ace0f83cc3d0b3:

  MAINTAINERS: Add Axiado reviewer and Maintainers (2026-06-11 22:28:47 =
+0200)

----------------------------------------------------------------
soc: arm code changes for 7.2

The largest addition here is the revived support for the ZTE ZX
SoC platform, though this mostly documentation.

The other changes are code cleanups that deal with continued
conversion of the GPIO library away from GPIO numbers to
descriptors and a few minor bugfixes.

----------------------------------------------------------------
Arnd Bergmann (8):
      ARM: s3c: use gpio lookup table for LEDs
      ARM: select legacy gpiolib interfaces where used
      Merge tag 'soc-pxa-gpio-for-v7.2' of git://git.kernel.org/pub/scm/=
linux/kernel/git/brgl/linux into soc/arm
      Merge tag 'zx29-plat-for-7.2' of https://gitlab.com/stefandoesinge=
r/zx297520-kernel into soc/arm
      Merge tag 'ep93xx-20260529' of https://git.kernel.org/pub/scm/linu=
x/kernel/git/asv/linux into soc/arm
      Merge tag 'imx-soc-updates-for-v7.2' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/frank.li/linux into soc/arm
      Merge tag 'omap-for-v7.2/soc-signed' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/khilman/linux-omap into soc/arm
      Merge tag 'mvebu-arm-7.2-1' of git://git.kernel.org/pub/scm/linux/=
kernel/git/gclement/mvebu into soc/arm

Bartosz Golaszewski (5):
      ARM: pxa: statify platform device definitions in spitz board file
      ARM: pxa: spitz: attach software nodes to their target GPIO contro=
llers
      ARM: pxa: pxa25x: attach software node to its target GPIO controll=
er
      ARM: pxa: pxa27x: attach software node to its target GPIO controll=
er
      arm64: Kconfig: drop unneeded dependency on OF_GPIO for ARCH_MVEBU

Ethan Nelson-Moore (4):
      arm: boot: ep93xx: don't rely on machine_is_*() for removed board =
files
      arm: mvebu_v5_defconfig: remove stale MACH_LINKSTATION_LSCHL refer=
ence
      ARM: orion5x: update board check in mss2_pci_init() to use the DT
      ARM: remove the last few uses of do_bad_IRQ()

Krzysztof Kozlowski (1):
      firmware: imx: sm-misc: Make scmi_imx_misc_ctrl_nb variable static

Linus Walleij (2):
      Merge tag 'zx29-docfix-for-7.2' of https://gitlab.com/stefandoesin=
ger/zx297520-kernel into soc/arm
      Merge tag 'samsung-soc-7.2' of https://git.kernel.org/pub/scm/linu=
x/kernel/git/krzk/linux into soc/arm

Martin Kaiser (2):
      ARM: mvebu: drop unnecessary NULL check
      ARM: mvebu: simplify of_node_put calls

Prasad Bolisetty (1):
      MAINTAINERS: Add Axiado reviewer and Maintainers

Randy Dunlap (1):
      ARM: zte: clean up zx297520v3 doc. warnings

Rosen Penev (1):
      ARM: omap2: simplify allocation for omap_device

Stefan D=C3=B6singer (1):
      ARM: zte: Add zx297520v3 platform support

Yuho Choi (2):
      ARM: imx3: Fix CCM node reference leak
      ARM: imx31: Fix IIM mapping leak in revision check

 Documentation/arch/arm/index.rst          |   2 +
 Documentation/arch/arm/zte/index.rst      |  10 ++
 Documentation/arch/arm/zte/zx297520v3.rst | 166 +++++++++++++++++++++++=
+++++++
 MAINTAINERS                               |  13 ++-
 arch/arm/Kconfig                          |   2 +
 arch/arm/Makefile                         |   1 +
 arch/arm/boot/compressed/misc-ep93xx.h    |  20 +++-
 arch/arm/common/sa1111.c                  |   2 +-
 arch/arm/configs/mvebu_v5_defconfig       |   1 -
 arch/arm/include/asm/mach/irq.h           |  10 --
 arch/arm/mach-footbridge/isa-irq.c        |   2 +-
 arch/arm/mach-imx/cpu-imx31.c             |   9 +-
 arch/arm/mach-imx/mm-imx3.c               |   2 +
 arch/arm/mach-mv78xx0/Kconfig             |   1 +
 arch/arm/mach-mvebu/coherency.c           |   9 +-
 arch/arm/mach-omap2/omap_device.c         |  29 ++----
 arch/arm/mach-omap2/omap_device.h         |   4 +-
 arch/arm/mach-orion5x/Kconfig             |   1 +
 arch/arm/mach-orion5x/board-mss2.c        |   4 +-
 arch/arm/mach-pxa/Kconfig                 |   1 +
 arch/arm/mach-pxa/pxa25x.c                |   3 +
 arch/arm/mach-pxa/pxa27x.c                |   3 +
 arch/arm/mach-pxa/spitz.c                 |  11 +-
 arch/arm/mach-s3c/Kconfig.s3c64xx         |   1 +
 arch/arm/mach-s3c/mach-crag6410.c         |  24 +++--
 arch/arm/mach-sa1100/Kconfig              |   1 +
 arch/arm/mach-zte/Kconfig                 |  29 ++++++
 arch/arm/mach-zte/Makefile                |   2 +
 arch/arm/mach-zte/zx297520v3.c            |  16 +++
 arch/arm64/Kconfig.platforms              |   1 -
 drivers/firmware/imx/sm-misc.c            |   2 +-
 drivers/irqchip/irq-versatile-fpga.c      |   2 +-
 32 files changed, 320 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/arch/arm/zte/index.rst
 create mode 100644 Documentation/arch/arm/zte/zx297520v3.rst
 create mode 100644 arch/arm/mach-zte/Kconfig
 create mode 100644 arch/arm/mach-zte/Makefile
 create mode 100644 arch/arm/mach-zte/zx297520v3.c
