Return-Path: <SRS0=/U+x=HA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCBFC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 09:51:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5B964E24
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 09:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F5B964E24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5fDj+k1Vkzg42yGpDxlS7r1ZHaaRPE7Hitn/6DnO7Mc=; b=cb6qI0jEkYIOynLIUNdc1z4dK
	zVxMDrDa+WNRnnbGaf9sgkrPEIAjTUgrLo92w6vFECwmrs2HaGcyPppBU8GeHPbE/oV8ooNwFiir3
	K+xeJzqBwLAY5ujtDto1J4E98Y87uRs/ypr/OnDrU8TIM8pA7R8HTRXo4QBcomI4csbp9Z3TI1FS7
	hw4iytLUDAMReaF6Ieq9FlZuTsbt4mhA1merIWxvwIVRaVSsKF2MfZRlH55dxaBSFnRtdALxWrwK8
	rVnYDB1IHtJK9QrRnHYMtXoXdEixckromRfM+SRSPMAwIaOpNNvvobqsl7oQQElbJ3g+V9fH1IljX
	9G3GazlnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5QQW-0003LS-Nl; Fri, 29 Jan 2021 09:50:52 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5QQN-0003Hf-2D
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 09:50:45 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by andre.telenet-ops.be with bizsmtp
 id NZqf240094C55Sk01ZqfVz; Fri, 29 Jan 2021 10:50:39 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l5QQI-001YQP-MI; Fri, 29 Jan 2021 10:50:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l5PlQ-00Ai11-8E; Fri, 29 Jan 2021 10:08:24 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Subject: [GIT PULL 1/2] Renesas ARM DT updates for v5.12 (take two)
Date: Fri, 29 Jan 2021 10:08:14 +0100
Message-ID: <20210129090815.2552425-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129090815.2552425-1-geert+renesas@glider.be>
References: <20210129090815.2552425-1-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_045043_318065_8086544D 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210129090814.XODJWKXWxjsKv-P9qR5b1Lwu3s_brIzJwvh7Jn6BJYo@z>

The following changes since commit 1f4449e12c5c6682a6f4f8dbc7288c19c1c844f1:

  arm64: dts: renesas: r8a779a0: Add SYS-DMAC nodes (2021-01-14 12:13:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.12-tag2

for you to fetch changes up to 74477936a828a7c91a61ba7e625b7ce2299c8c98:

  arm64: dts: renesas: beacon: Fix EEPROM compatible value (2021-01-29 09:11:27 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.12 (take two)

  - Increase support (SPI, I2C, Ethernet, Serial, MMC) for the R-Car V3U
    SoC on the Renesas Falcon board,
  - Disable SD functions for plain eMMC,
  - A minor fix.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: dts: renesas: beacon: Fix EEPROM compatible value

Koji Matsuoka (2):
      arm64: dts: renesas: r8a779a0: Add MSIOF device nodes
      arm64: dts: renesas: r8a779a0: Add I2C nodes

Linh Phung (1):
      arm64: dts: renesas: r8a779a0: Add HSCIF support

Takeshi Saito (2):
      arm64: dts: renesas: r8a779a0: Add MMC node
      arm64: dts: renesas: falcon: Enable MMC

Tho Vu (1):
      arm64: dts: renesas: r8a779a0: Add Ethernet-AVB support

Wolfram Sang (5):
      arm64: dts: renesas: Disable SD functions for plain eMMC
      arm64: dts: renesas: falcon: Add I2C0,1,6 support
      arm64: dts: renesas: falcon: Add Ethernet-AVB0 support
      arm64: dts: renesas: r8a779a0: Add & update SCIF nodes
      arm64: dts: renesas: falcon: Complete SCIF0 nodes

 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   4 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   2 +
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |   2 +
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |   2 +
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |   2 +
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      | 138 +++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |   1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 620 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   2 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   2 +
 10 files changed, 774 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
