Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378FF340281
	for <soc@lists.linux.dev>; Thu, 16 Apr 2026 22:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776378639; cv=none; b=rVFNl4qOW2C4SPpY1LzzE+jlVkSgDXyRGgRLig6SR4AfdO3Fc8BnaY9G3fkeGJGSL4Mxq3gBj4yvpVNVFC45gD5pvRo7OaRZv92iOk+z2sI8Kf7UrWN/LMa4DukvZhlpbSPxW6QntkGhAjcx52V34etQ0+QStjphHcXMu26JaSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776378639; c=relaxed/simple;
	bh=QvWm+/PC5CrfygTsXE901iO99VqSGZt+nuhp2EEwXpo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dOjuAv7aMU8+1tTRmI3ojtJQodJ56QNhhbRfguYbPGMckPtAhTd1oiMmgSN/BwVePgevK+Rb0kL1Stg5Jgjfbuz7fNFoweJnZYHa/VjlUHNDbvPAAuDLbhKLZEDzYofkAg3N0Qzvt/+cJIvyxbHJPfhYgC7eUVUpvcJ9T3/Eb3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=H2zHk1gQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UzxTmvXF; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="H2zHk1gQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UzxTmvXF"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 9E51A1D0016E;
	Thu, 16 Apr 2026 18:30:37 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 16 Apr 2026 18:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776378637;
	 x=1776465037; bh=+92XE54HEAvYemE/ddSO6wnd+3qEgA9igNsTP67Qy10=; b=
	H2zHk1gQeAs+7F8H8ZiMcfuvJQXYBzIi89Br/4ahVCHBtFgRVtclDw2VaL2K3iyJ
	tm4/eaGYdlG15NHUqElaP46wuyoBNO3VJXhVBcjlCSG+sKwioJMg93w/S84F7+YQ
	gvcpmnteRxOgNntvyhn4BjUjhf2m3AIRX+3tiq8Kq++ueXuGeaICyfriMwmWMukT
	ZyXZGjS9ZtbwhJgeOQNIZoWmLotYcPMspHbdP0BAndaUJa1uVKQ25W1aj5ZZUykm
	FZ1aRXyfZ5N/ecnARj/Jp8gkwZ8CmNRyYz69dmXg3VPNi8EJTsHVnluZ8BC3Z4+s
	A20YaZ1bbUzcZgSRTUQ4tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776378637; x=
	1776465037; bh=+92XE54HEAvYemE/ddSO6wnd+3qEgA9igNsTP67Qy10=; b=U
	zxTmvXFYFjfxSCXCZmf+cb7o4CwkiQFA8Azd9P36vatLXqkjWszsK+3IvtNLjQxQ
	+QkOVSFV2RJxlLDYkU0fEeEEtwHH7lpXZQwzABjhaNLkMWDt0ZaDa06Q4ede0Wae
	Q32QsPSAedP1OrMrlNQEkpJXeG/SuFWr3k1dJJCvJVFqQesoVkZJRO/coYsA/Jnb
	VRFsntkvcHGgbDkVV5K8Sz5k2VromFgMJxe3X8IFqyxY4z1Tl9AZfXPSdpEK9AzW
	h9+MT9DtN0MmfYfwhxr+ENsDYybu8V7hs9obxbv4i3IXzoKudrIXpCr9FV+ZSJTK
	BIUJ6KtHsnvk+g+Ujpwew==
X-ME-Sender: <xms:DWPhaSQY4OpVXK6vA3Qg1RrUOqx8Uav_dOFruVbVCHoUyLcqjyLgJg>
    <xme:DWPhaSlz2asAxaE47pHQiYmooPV_SZ6pX0Bg3Epoyh1RUQb3hHQsxSySlaMBBsEMI
    Eh0tVPwDlpW42inXYcEf2rwoCodKhAO4CY33nRJxQ5_bWdAVmlWog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegkedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughsse
    hlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DWPhab8Ua50KlI1RJk6FnANeLRCr9lIX55IVt47T2hyOvnjpQrBAnw>
    <xmx:DWPhaelVfBjhSn7HV2wKqD-0vWRLZMvfpFdiFO5wFQf6MjmEeAH9Kw>
    <xmx:DWPhaRV9_gUBaZv5HrneSgtubwfVmV33EHpBGUrpnbxt7bCehTLc8A>
    <xmx:DWPhaTFKuTzlp8F0k2UWRqL0WlZKr0tPWwRJKYPOZQ24hd1tSvVmeg>
    <xmx:DWPhaT1l6ZDAp6GukhqEawXP_ucjcD4mx5Y8id3SAzSb2CfHYOzqc4MS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3F040700065; Thu, 16 Apr 2026 18:30:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 17 Apr 2026 00:30:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <704b8a79-4fe5-4815-82aa-026de29dcf1a@app.fastmail.com>
In-Reply-To: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com>
Subject: [GIT PULL 3/4] soc: defconfig updates for 7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.1

for you to fetch changes up to 07e1a498ee9a9e715208c06b39edd8f7d22f3b50:

  Merge tag 'at91-defconfig-7.1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/defconfig (2026-04-04 17:24:37 +0200)

----------------------------------------------------------------
soc: defconfig updates for 7.1

As usual, we enable a number of additional device drivers as loadable
modules, to support the added platforms. The largest change this time
is for OMAP2/3, which were not that well supported in the generic arm32
defconfig.

The Tegra SoC platforms are now enabled by default in Kconfig when
ARCH_TEGRA is enabled, which means the defconfig change is done at
the same time as the Kconfig change here.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: defconfig: Enable Qualcomm Eliza basic resource providers

Ajay Kumar Nandam (1):
      arm64: defconfig: Enable Qualcomm WCD937x headphone codec as module

Andreas Kemnade (1):
      arm: multi_v7_defconfig: Enable more OMAP 3/4 related configs

Arnd Bergmann (5):
      Merge tag 'qcom-arm64-defconfig-for-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'ti-k3-config-for-v7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/defconfig
      Merge tag 'omap-for-v7.1/defconfig-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/defconfig
      Merge tag 'tegra-for-7.1-arm-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/defconfig
      Merge tag 'tegra-for-7.1-arm64-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/defconfig

Aubin Constans (1):
      ARM: configs: at91: sama7: enable LVDS serializer support

Francesco Dolcini (1):
      arm64: defconfig: Enable configurations for Toradex Aquila AM69

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v7.0-rc1

Harshal Dev (1):
      arm64: defconfig: Enable QCOMTEE module for QTEE-enabled Qualcomm SoCs

Kathiravan Thirumoorthy (1):
      arm64: defconfig: enable IPQ5210 RDP504 base configs

Kory Maincent (TI) (1):
      ARM: multi_v7_defconfig: omap2plus_defconfig: Enable ITE IT66121 driver

Krzysztof Kozlowski (6):
      Merge tag 'renesas-arm-defconfig-for-v7.1-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      arm64: defconfig: Enable Qualcomm Eliza SoC display clock controller
      soc/tegra: Make ARCH_TEGRA_SOC_FOO defaults for NVIDIA Tegra
      ARM: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC
      arm64: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC
      Merge tag 'at91-defconfig-7.1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/defconfig

Luca Weiss (2):
      arm64: defconfig: Enable S5KJN1 camera sensor
      arm64: defconfig: Enable Milos LPASS LPI pinctrl driver

Meghana Malladi (1):
      arm64: defconfig: Enable DP83TG720 PHY driver

Michael Walle (1):
      arm64: defconfig: remove SENSORS_SA67MCU

Neil Armstrong (1):
      arm64: defconfig: enable pci-pwrctrl-generic as module

Pankaj Patil (1):
      arm64: defconfig: Enable configs for Qualcomm Glymur SoC

Romain Sioen (1):
      ARM: configs: at91: sama7: enable config for atmel maxtouch

Ryan Wanner (1):
      ARM: configs: at91: sama7: enable DRM hlcdc support

Srinivas Kandagatla (1):
      arm64: defconfig: Enable configs for Arduino VENTUNO Q

Taniya Das (2):
      arm64: defconfig: Enable SM8750 clock controllers
      arm64: defconfig: Enable Kaanapali clock controllers

Thierry Reding (2):
      Merge branch 'for-7.1/soc' into for-7.1/arm/defconfig
      Merge branch 'for-7.1/soc' into for-7.1/arm64/defconfig

Thomas Zimmermann (1):
      arch/arm: Drop CONFIG_FIRMWARE_EDID from defconfig files

Vishnu Saini (1):
      arm64: defconfig: Enable Lontium LT8713sx driver

 arch/arm/configs/davinci_all_defconfig |  1 -
 arch/arm/configs/multi_v7_defconfig    | 32 ++++++++++++++++++++++++----
 arch/arm/configs/omap1_defconfig       |  1 -
 arch/arm/configs/omap2plus_defconfig   |  2 +-
 arch/arm/configs/pxa_defconfig         |  1 -
 arch/arm/configs/sama7_defconfig       | 10 +++++++++
 arch/arm/configs/shmobile_defconfig    | 11 +++++-----
 arch/arm/configs/tegra_defconfig       |  4 ----
 arch/arm64/configs/defconfig           | 39 +++++++++++++++++++++++++++-------
 drivers/soc/tegra/Kconfig              | 11 ++++++++++
 10 files changed, 86 insertions(+), 26 deletions(-)
