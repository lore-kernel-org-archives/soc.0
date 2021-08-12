Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49843C4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:06:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2BD3060C40; Thu, 12 Aug 2021 21:06:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8DED60F35;
	Thu, 12 Aug 2021 21:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802363;
	bh=pkXOgIRcW89Zl6g1NvmK11lBL6o7RAVcZfC+Lnjd7zA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uGYQjvpR4JF4JQR/zjzgpgyX6Xe+p1B0OfNB/itx0ccRXj0psKELhQw+pug3nItIG
	 ab39ljw9fDAVCS+JtsK1kFSISZfNLUbXsfKJJDCYEvInSpQXHu+y+VqVmEdIAu7RNg
	 gzJAr9p07+K5P+uWpo4xeCAVfnXJTI92HqsYO8E0NBFdkoVdbQeeazrK2VAvgGFSFh
	 ZIGYJ2j+5OVvdIyhzSiosTYEF8ljVlMc3Yo2Nn4+GqTIQ6IlNyqImNMlo4BDwEurVy
	 lKrx6s8JrGZYUVOBAvLKQgl8DlvondmwcsxB9+gannGd53ElJ+0zBGo10gPtsjWIui
	 fYQR6wrWHfZvw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.15
Date: Thu, 12 Aug 2021 23:05:41 +0200
Message-Id: <162880206156.1376011.2609050470436484899.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <032895d9-62b6-6c9e-b04b-9c3d316f27ec@baylibre.com>
References: <032895d9-62b6-6c9e-b04b-9c3d316f27ec@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 10 Aug 2021 09:44:35 +0200, Neil Armstrong wrote:
> Here's the ARM64 DT changes for v5.15:
> - nanoki-k2: enable bluetooth
> - khadas vim & vim2: improve wifi
> 
> Neil
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: bcbe4bd39d47bc75c8842477d6f577977d526045

       Arnd
