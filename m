Return-Path: <SRS0=UfjI=JU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C97C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 19:57:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AA39613F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 19:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AA39613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4t0bWAK9Bx6AYNYYhoP7ZWiWyxuSsI2UpAoDfAMf9jY=; b=p4kUcvw45adYC6CNsUvHFeRYWq
	hGed0ihQemhAnEgB84cB72V0k7+/FxYIVcaZIqZcSFYAwyWS67fffu+MfdXqU/RO0qZoLk5tj2ia7
	yUS9C/Nf8oqHyJddOFQXa/FEcEG64x+EhUqiaOmpMNAf8FcQSC5gCfHo7B+3iytgrX5KkFSesut5x
	Vuyx9xYDaPVRRZyXK9fyAIXsDfuS5EPAMNAkMFwE3su7dDAnX/INZ46+Cp4c4GNFH3I98W2ZBfxcq
	7tdDEmObIqKW2NVdyKFHIVv/DkBhCY23RwZioKhulWQMJABvAd72MFSWZAPqaE74xxdT5rQyJut/D
	NgpaLbtQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la1u5-002FbK-3K; Fri, 23 Apr 2021 19:55:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la1u2-002Fb2-CU
 for linux-arm-kernel@desiato.infradead.org; Fri, 23 Apr 2021 19:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=HlmccD78YKhdFvmkyUrSL6J1pOwixk/DvCdObi0CkZQ=; b=kphMpwlLbqVSpGaHE6ntn9W0bp
 NJ+G+VRrML5OepO5X3HvTlPhsUmiycqX1fIEDAzryH4pOSGjs28Lgn+Nifi0WNVEZdACsIckOdQOn
 WoW+i0vA4yz09u1YzheAlAm2v9Cwiy/sKbjBqUf4Rw8enQyfPAQCb3QZdVIP5K7+MMtJ05skiAlVO
 kmae3H9X3ah4T4fcb5S7bC27XPZF/83cpoz5h1/jAzuNMaE7UfkyuiGHrUq8cJO9LkUTT33y/4cd5
 8XqOnfBob4kAcRQ1mhw80GWukkxRdnM4OlX6PHr6Q4f5498HREupuq2mYLxGNpH/tiwCN6gNHWW33
 c87VnQVg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la1tz-00EfeU-RO
 for linux-arm-kernel@lists.infradead.org; Fri, 23 Apr 2021 19:55:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34F7C613D5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Apr 2021 19:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619207746;
 bh=1EfP92STqPVCo84Pc8H8VME5W96mb+TL+F+7XKPrVH8=;
 h=From:Date:Subject:To:List-Id:Cc:From;
 b=HEgZJvrrJQS8++w0vm1ED25pqlE/qUEtUmmXRRQ1ZBrF8c9qw9tIgeHmi5aX/0lR1
 SfRm6MsOPVtq9raSTPf0q+c1smI4Zq2tzKpA84N1yFUT6bNNV1Ph3C7cMBC7VB/bwY
 vdIjylHDqfvLQyVilXZeLMwlPhK5xKH1f3/H05SjQzidwqEQCT7ivfTYSiqGb3oBrP
 wB4nrfrHHYdiSO2pyncDnFoTNg5/+kR/zPl1fliLOmY0BNTpqeVY+o1+LKxJFhp179
 p2BwN8Wxb/CxaQah/b9AMeMdfu4TzumYpNcToJhdVsEmnKrEzW448NX3lNNqtGseL8
 VXh2iPIeI9ZoQ==
Received: by mail-wr1-f41.google.com with SMTP id x7so49445135wrw.10
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Apr 2021 12:55:46 -0700 (PDT)
X-Gm-Message-State: AOAM532nBUdmcZY8SMRJycqBZ0eJ3GSMI2nX/EJdbN7PWNPA1QAYhHvx
 SwZkKQDYfph5/KrmFn4Bt4JrfzUS5Op4j81neqw=
X-Google-Smtp-Source: ABdhPJxuM/vCPHRJDCwpepsaJfOAUofX2HsZKPjMkIfn0bZH737KPzHYTbsTauilGjU/2xDkVQu+NAI2MORsRmP0Hwo=
X-Received: by 2002:adf:e483:: with SMTP id i3mr6881376wrm.286.1619207744741; 
 Fri, 23 Apr 2021 12:55:44 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 23 Apr 2021 21:55:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com>
Message-ID: <CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com>
Subject: [GIT PULL] ARM SoC fixes for v5.12, part 4
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_125547_962031_EC756F95 
X-CRM114-Status: GOOD (  10.14  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210423195522.myUMenkYW--zJP4SeZgszxHdQfEOafz3HV0_xT4uwxM@z>

The following changes since commit b9a9786a13ea158ee3b23614217f2e3158178421:

  Merge tag 'omap-for-v5.12/fixes-rc6-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes (2021-04-08 17:56:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-fixes-5.12-4

for you to fetch changes up to a1768dad775b5ceb25d17bc7a13318f43adf3069:

  Merge branch 'tegra/dt64' into arm/fixes (2021-04-23 15:38:13 +0200)

----------------------------------------------------------------
ARM SoC fixes for v5.12, part 4

These should be the final fixes for v5.12. There is one fix for SD card
detection on one Allwinner board, and a few fixes for the Tegra
platform that I had already queued up for v5.13 due to a communication
problem. This addresses MMC device ordering on multiple machines,
audio support on Jetson AGX Xavier and suspend/resume on Jetson TX2.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: Revert SD card CD GPIO for Pine64-LTS

Arnd Bergmann (2):
      Merge tag 'sunxi-fixes-for-5.12-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/fixes
      Merge branch 'tegra/dt64' into arm/fixes

Jon Hunter (2):
      arm64: tegra: Set fw_devlink=on for Jetson TX2
      arm64: tegra: Fix mmc0 alias for Jetson Xavier NX

Sameer Pujar (1):
      arm64: tegra: Move clocks from RT5658 endpoint to device node

Thierry Reding (1):
      arm64: tegra: Add unit-address for ACONNECT on Tegra186

 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts      | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi          | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi                | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts      | 3 ++-
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi     | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi     | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi          | 1 -
 8 files changed, 14 insertions(+), 6 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
