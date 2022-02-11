Return-Path: <SRS0=tBpQ=S2=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3501EC4332F
	for <soc@archiver.kernel.org>; Fri, 11 Feb 2022 14:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1EF6DC340EB; Fri, 11 Feb 2022 14:20:02 +0000 (UTC)
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [195.130.137.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51C83C340F0
	for <soc@kernel.org>; Fri, 11 Feb 2022 14:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51C83C340F0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4JwG3C5wC0zMrDTW
	for <soc@kernel.org>; Fri, 11 Feb 2022 15:19:51 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d5d:ef67:a872:c0be])
	by laurent.telenet-ops.be with bizsmtp
	id tqKi2600E3ZSXJh01qKidh; Fri, 11 Feb 2022 15:19:44 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nIWlx-000M8j-RL; Fri, 11 Feb 2022 15:19:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nIWLx-00Gh8R-Kd; Fri, 11 Feb 2022 14:52:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v5.18
Date: Fri, 11 Feb 2022 14:52:11 +0100
Message-Id: <cover.1644587198.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644587197.git.geert+renesas@glider.be>
References: <cover.1644587197.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.18-tag1

for you to fetch changes up to 2e8a3335472461927e57d1741ccf1791ff416075:

  arm64: defconfig: Enable additional support for Renesas platforms (2022-02-02 09:12:40 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.18

  - Enable the new Audio Graph Card2 driver which can handle sound cards
    more flexibly in the arm64 defconfig,
  - Disable unneeded 8250 serial options in shmobile_defconfig,
  - Enable additional support for Renesas platforms in the arm64
    defconfig.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Disable unneeded 8250 serial options
      arm64: defconfig: Enable additional support for Renesas platforms

Kuninori Morimoto (1):
      arm64: defconfig: Enable Audio Graph Card2 driver

 arch/arm/configs/shmobile_defconfig | 4 ++++
 arch/arm64/configs/defconfig        | 7 +++++++
 2 files changed, 11 insertions(+)
