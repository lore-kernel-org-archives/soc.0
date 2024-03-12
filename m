Return-Path: <SRS0=zS0J=KS=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD74C54E58
	for <soc@archiver.kernel.org>; Tue, 12 Mar 2024 16:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62DCFC433C7; Tue, 12 Mar 2024 16:47:46 +0000 (UTC)
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4DCE3C433F1
	for <soc@kernel.org>; Tue, 12 Mar 2024 16:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4DCE3C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 34EFD180009B;
	Tue, 12 Mar 2024 12:47:44 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 12 Mar 2024 12:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710262063;
	 x=1710348463; bh=+pSPTrckktAgZrC61fswcgNJEn0V4pdObZ0UIRDjo6s=; b=
	jSejd4Y1Og0w0qD4sb0BYJ45LKO+XdP7+lcsKdX3gyyAbdUy0oXoJnoB37bX59ah
	2ebaMczeuJhhZWcDV4y2cYou0+gG6yyJ6NnZNRm46k1iAIGH9S0Q3+KZQq9trAng
	7OlRUyxSaSCK+SxHmd71vOF1tL0XIAD9nrTJeA8atwBcyQxeco9JT6ii2+4ilthk
	fpJJKMZH8Kim6RqXx4IH4dXuAnu9NzTF34+IFNvEdy6KJQX0Dbg0G0j/BCXAI1l7
	QJmd4KMu0gOsMhRwPeEWEADMpDv/5B8D1ue5aD0DQ+ouUcw7tBkScTCp+LgVO6qV
	qZX3Oj3o28xHYLED3ZGnQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1710262063; x=
	1710348463; bh=+pSPTrckktAgZrC61fswcgNJEn0V4pdObZ0UIRDjo6s=; b=e
	+sd3K0K9jQh2zbY22ovJ1D/memZ1tm4l0M0bElM1FMHbHlYmsghVbZXO/tghhIU4
	+ar88urCPM8dY+mMsBsWxEly+mJEcELusW26yj791fD2nopPbVEW6ddYztweYlTu
	lK9AmslOQuNSgc8jkXu1zZQjkRSGCLfS3c0r/83+oDZ3vh63zaXZKr8ImoWoWnuB
	JVX1R/pv9f/TaH1TfjYX15Hcsn5ziao0f2aJ5EYT9UyczL06ustIiQGimBUPoPUv
	qY+aBCIsFdHhVpd/PJJqXweXwqeHmWQWuA1H0k6iZVr6Rl2gL0Y2UopkfMiRn/YX
	fkgBkrOyNk2k/0XMiIfBg==
X-ME-Sender: <xms:L4fwZfgIbRcUYZhhNYmQZjQCAYhQNeNjSJJmo1sIPz_l191pqP3x3A>
    <xme:L4fwZcC9EYyqGCFkPLco3beCoT9ex1uVMJA5jta0ldbURmtpUBKNmFZDfDvb5atzE
    oHU8YWWQLlhObvYsFc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgfekueelgeeigefhudduledtkeefffejueelheelfedutedttdfgveeufeef
    ieegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:L4fwZfGiaPh_HGM65dQQO3eKdd1BBp-0HH6-n4n3pLBfETL8ngTtOQ>
    <xmx:L4fwZcRSAUCv3VnO5_-W8Xi-qffQHuPzP8cSsK8k1V2OkbDfAVj3mw>
    <xmx:L4fwZcwZ4PHlCEIrPDIiIdeJU9xO3GnEcE2_PyGp1scJ886LHFI-PQ>
    <xmx:L4fwZS7gjoTVPrmacTNtGfLTjKF_FM7WDL_qSG7HqPoEt8DOrj7hEA>
    <xmx:L4fwZWtvJcXqMUOfNjR4-dss2AybCy3FidVLDazqpfMjmwDHkoDQQERvfmY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7F847B60089; Tue, 12 Mar 2024 12:47:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
MIME-Version: 1.0
Message-Id: <a901bb0c-bf09-470b-98e1-10ae1cacf0db@app.fastmail.com>
In-Reply-To: <89d0bb77-a608-4ae0-b9d9-e17fdf5f12da@app.fastmail.com>
References: <89d0bb77-a608-4ae0-b9d9-e17fdf5f12da@app.fastmail.com>
Date: Tue, 12 Mar 2024 17:47:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL 4/4] ARM defconfig updates for 6.9
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd=
33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
efconfig-6.9

for you to fetch changes up to d8999d151e4110effc760397f500dda25d7a60b1:

  arm64: defconfig: Enable support for cbmem entries in the coreboot tab=
le (2024-03-04 21:18:53 +0100)

----------------------------------------------------------------
ARM defconfig updates for 6.9

This has the usual updates to enable platform specific driver modules
as new hardware gets supported, as well as an update to the virt.config
fragment so we disable all newly added platforms again.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: defconfig: Enable X1E80100 multimedia clock controllers con=
figs

Alexander Stein (1):
      arm64: defconfig: Enable i.MX8QXP device drivers

Andrew Davis (2):
      ARM: multi_v7_defconfig: Add more TI Keystone support
      ARM: multi_v7_defconfig: Add more TI Keystone support

Arnd Bergmann (6):
      arm64: config: disable new platforms in virt.config
      Merge tag 'renesas-arm-defconfig-for-v6.9-tag1' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-6.9' of https://git.kernel.org=
/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'imx-defconfig-6.9' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/shawnguo/linux into soc/defconfig
      Merge tag 'ti-k3-config-for-v6.9' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/ti/linux into soc/defconfig
      Merge tag 'v6.9-rockchip-config64-1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into soc/defconfig

Bjorn Andersson (2):
      arm64: defconfig: Enable MAX20411 regulator driver
      arm64: defconfig: Enable Qualcomm interconnect providers

Brandon Brnich (1):
      arm64: defconfig: Enable Wave5 Video Encoder/Decoder

Cristian Ciocaltea (1):
      arm64: defconfig: Enable Rockchip HDMI/eDP Combo PHY

Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Disable staging
      ARM: multi_v7_defconfig: Disable board staging

Komal Bajaj (1):
      arm64: defconfig: Enable GCC and interconnect for QDU1000/QRU1000

Krzysztof Kozlowski (1):
      arm64: defconfig: drop ext2 filesystem and redundant ext3

Linh Phung (1):
      arm64: defconfig: Enable R8A779H0 SoC

Luca Weiss (1):
      arm64: defconfig: Enable QCOM PBS

Marek Szyprowski (1):
      ARM: multi_v7_defconfig: Enable BACKLIGHT_CLASS_DEVICE

Martin J=C3=BCcker (1):
      ARM: defconfig: enable STMicroelectronics accelerometer and gyro f=
or Exynos

Martin Kaiser (2):
      ARM: imx_v6_v7_defconfig: enable the vf610 gpio driver
      arm64: defconfig: enable the vf610 gpio driver

Neil Armstrong (3):
      arm64: defconfig: enable audio drivers for SM8650 QRD board
      arm64: defconfig: enable WCD939x USBSS driver as module
      arm64: deconfig: enable Goodix Berlin SPI touchscreen driver as mo=
dule

N=C3=ADcolas F. R. A. Prado (1):
      arm64: defconfig: Enable support for cbmem entries in the coreboot=
 table

Yannic Moog (1):
      arm64: defconfig: enable i.MX8MP ldb bridge

 arch/arm/configs/exynos_defconfig    |  3 +++
 arch/arm/configs/imx_v6_v7_defconfig |  1 +
 arch/arm/configs/multi_v7_defconfig  | 21 ++++++++++++++++++++-
 arch/arm/configs/shmobile_defconfig  |  2 --
 arch/arm64/configs/defconfig         | 34 +++++++++++++++++++++++++++++=
+----
 arch/arm64/configs/virt.config       |  4 ++++
 6 files changed, 58 insertions(+), 7 deletions(-)
