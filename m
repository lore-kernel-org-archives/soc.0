Return-Path: <SRS0=q8Yd=G4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD9DC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 19:14:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2FA220E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 19:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2FA220E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dBlxWLVkB2tm5c+9bH/MERtoC7rN/rvYHQmX5bFQc7A=; b=Al5tJwMyZLZYMgLr5jKLXuNwT
	treH22F0xGZt7w6P5i/3si8PFUjw5/Wln1el/0tBUCcjyY7cRlQqdiETs+bp5nXC+pJY/ufLlqgYm
	VQRDAkJetE3Mt0p3Ym8x2ui64PUuVsih14AkP58N+wSR5fMho7ly9AyIikDUJP6JhkpOygpLOmlM8
	YqXIDaeWYHUB3ouQfhZ5RcIZElqA0P7iRw8ulYrsh6V/bhfKx00GzfH4k5VRXS+bScI7rwbrCGbf8
	5UPhLAhnajyHWuF1ghyIHBh5N8YTkG224gRdpTw4aaMZMDiVN46wFvAA+s0phXGplAz3rR0yJgU4H
	fBTPh10WQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l47IJ-00065Q-MZ; Mon, 25 Jan 2021 19:12:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l47ID-00063l-Av
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Jan 2021 19:12:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A55B21744;
 Mon, 25 Jan 2021 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611601972;
 bh=Xp/vjvu8f0gxOYSI4XF+2RKl9p51s4STWbFzsfsTK/M=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OGRjUI59EItjK4kku7manjTyCncPB0aXjyWr/R8diTb7DZYpNGK8iJsoOWcc2AWI/
 u6LcdsjFNRbuPs1wXxbjXKJCsyIvd4mHHNUieAHQbjQRGjMgs4raD3fYx4gAcJtnMM
 qncvtTqF0MtxQEG7S150t9dAexIC7qGdbI08wEpdHIR69vMSUcFz//pyLsInQpGHgQ
 jK1LlyIOVAiRW3WOj9dXAYR2m0DPpPELbGGda4EkneMI5tG3oyWcoREGqX7X4pZuE4
 3/j7hptYaFoj/ZFQ0qctoGLBKAV5dKDZ6+GOHt9+25rQcfBmfPjibBTEqsg/5r+Mp3
 zimU/CoDElu+Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL 1/3] soc: samsung: drivers for v5.12
Date: Mon, 25 Jan 2021 20:12:38 +0100
Message-ID: <20210125191240.11278-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125191240.11278-1-krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_141253_454953_069CA8E3 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210125191238.YFWv9qlgGz4xdUHesqCo7VbkE-d8muKBUNagcaT7qds@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.12

for you to fetch changes up to c09a3e6c97f00a525e23854d63f003aba9adfa41:

  soc: samsung: pm_domains: Convert to regular platform driver (2021-01-15 20:50:34 +0100)

----------------------------------------------------------------
Samsung SoC drivers changes for v5.12

1. Adjust deferred probe and handle regmap_read() errors in Exynos ASV
   driver.
2. Convert the ChipID code into a driver (from a early initcall) and
   merge it into the Exynos ASV.
3. Convert the PM domains code into a driver. This is necessary for
   upcoming code enabling fw_devlinks.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      soc: samsung: exynos-asv: handle reading revision register error
      soc: samsung: exynos-chipid: convert to driver and merge exynos-asv
      soc: samsung: exynos-chipid: correct helpers __init annotation

Marek Szyprowski (2):
      soc: samsung: exynos-asv: don't defer early on not-supported SoCs
      soc: samsung: pm_domains: Convert to regular platform driver

 arch/arm/mach-exynos/Kconfig        |  1 -
 drivers/soc/samsung/Kconfig         | 12 ++---
 drivers/soc/samsung/Makefile        |  3 +-
 drivers/soc/samsung/exynos-asv.c    | 57 ++++++++--------------
 drivers/soc/samsung/exynos-asv.h    |  2 +
 drivers/soc/samsung/exynos-chipid.c | 71 ++++++++++++++++++---------
 drivers/soc/samsung/pm_domains.c    | 97 ++++++++++++++++++-------------------
 7 files changed, 125 insertions(+), 118 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
