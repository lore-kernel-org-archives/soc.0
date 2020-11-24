Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C512DC56201
	for <soc@archiver.kernel.org>; Tue, 24 Nov 2020 11:01:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8677520782; Tue, 24 Nov 2020 11:01:58 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3F72A20857;
	Tue, 24 Nov 2020 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606215718;
	bh=I95pbgJatRC7byPCt1unVZCiiAycqDpUz4/X3Opnm0U=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0q6KmBBFSlKHiZEEN2Cpgv1upG5N8JsV22VsqHoEsfESdsxIHIDj0UTOJwPpIb9q1
	 ysngpoqi07iu+yXo1zmJ+Ald+oVBLB0cqagKGnJ7kSyAUo1nMz3OwsYaeifhwvvyhI
	 DQRZSz/7eGQIkqWCrB3swQ69rGSS2i+4hLnnGcn4=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Maxime Ripard <maxime@cerno.tech>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] soc: sunxi: Fix compilation of sunxi_mbus
Date: Tue, 24 Nov 2020 12:01:50 +0100
Message-Id: <160621564607.128147.1507965938951028693.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201124103546.839711-1-maxime@cerno.tech>
References: <20201124103546.839711-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 24 Nov 2020 11:35:46 +0100, Maxime Ripard wrote:
> dma_direct_set_offset has been moved from dma-mapping.h to
> dma-map-ops.h, but our driver hasn't been updated resulting in a build
> breakage. Let's change the header to fix the build.

Applied to arm/drivers, thanks for the update!

[1/1] soc: sunxi: Fix compilation of sunxi_mbus
      commit: e24f7fac3b973ad24b0fd96f6de47695c90f6528

       Arnd
