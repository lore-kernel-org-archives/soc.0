Return-Path: <SRS0=q8Yd=G4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5828C43381
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 19:14:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71B0220E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 19:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71B0220E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TmWcSKo5PxBdK5Dw9emxcFpmOX6OAuOoW6yvxS1MhzA=; b=khoTioUciSd+LoyAwbzu9lHLM
	CLS2tBFrCdUyF3FIbBWD7QECqTDdqZds+6r4TBjy6fkJ4gaNVXreDpCIvtJ5bDN99CtxyMb7/Q44M
	GDP0ZqNMYdWGgyI6cdAW7LE52MzlfuM5RIfbAWGCHF9I1AoHJyh776saDIvrikGT90sIVRPJY9nVn
	5SybDP/z+arIGM9AXM8+sU69EE23wxhW1982vfkGLjYG8D6JxpBHCZmaY/TQwzu55lyY7oviSjOUy
	mGokp0bnuDa4azRHBGkdCtqL0/yRt1AcvLuGpu3+WbT8WZI0LhjNOWuV6SNN+WlY27a7KfcAmR38c
	lr/uQdiMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l47IN-00065w-It; Mon, 25 Jan 2021 19:13:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l47IH-00064s-AC
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Jan 2021 19:12:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1036521D79;
 Mon, 25 Jan 2021 19:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611601976;
 bh=V+ItWKJbb51hevbOoFFfArpLuF+1sIMvo9Ou3fOfQGM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U7oA2czoLGKKs4kqPkqK3oT5Yeh6CY12yG795vmfFeTcHP4MPRi0xs9UYsXmBrRYY
 g0gxminyxtML6rRHzhsc9kemdT8G4QkS8D79Laa0axBHyev0+rJbzRbV155HZbLiFd
 KrKlBY0C5en5qHfVzWKfCr9X+vJ+Xdc4+y2fI1/IVOFneExatryLtaFwT8SYJZPcuX
 qIOgUaQaEqymKwbr1TpaWddhKpj15DU2i3OvxGgFgHC3aGL2yyPACyl8I7s5OfvTGh
 uQ2Sin0dVcpmKExJqTEDZSKHVylhHaZSGMrXyRZS6Tba12vy9sdU/7rCeI0qthmGDu
 PU6UIvXDmxRmw==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL 3/3] arm64: dts: samsung: DTS for v5.12
Date: Mon, 25 Jan 2021 20:12:40 +0100
Message-ID: <20210125191240.11278-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125191240.11278-1-krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_141257_451928_3812CDC3 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210125191240.TkdOsJEG04gqfnp3Dfs1Fy3JOGLvYJ8uFJeB0nomtu4@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.12

for you to fetch changes up to 545a540a9c2ec192cdd5c75af1e334711a79354a:

  arm64: dts: exynos: correct S3FWRN5 NFC interrupt trigger level on TM2 (2020-12-29 16:47:20 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.12

Correct Samsung PMIC and S3FWRN5 NFC interrupts trigger levels on
TM2/TM2E and Espresso boards.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      arm64: dts: exynos: correct PMIC interrupt trigger level on TM2
      arm64: dts: exynos: correct PMIC interrupt trigger level on Espresso
      arm64: dts: exynos: correct S3FWRN5 NFC interrupt trigger level on TM2

 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++--
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
