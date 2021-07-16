Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1725CC636CB
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F0B88613EB; Fri, 16 Jul 2021 21:25:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2E0D61374;
	Fri, 16 Jul 2021 21:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470715;
	bh=aWXjXOv51nzgg9PZWR4nbx/YGrfN30sZk6Qomj6ADZI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wi4yQejuuJufotKzyIkh7banQrXjMlrs89HR54ZyUvNPhCjA3PgX+I1KY7tUXUuNx
	 XPoOEj4P6KjTxmlpEKZ0oS9eTnGUjLIbeDFdWYAw5Dz5IY1jypVvrjh2u/e21H+ips
	 HsPWNMdQr29suT+84HclVkuFKnx0wgUuK0u8PxoB13U8iztgBvzA5Exbe03d1SbkC7
	 6h5bjw5UYZxPF2qOOJ9XSFWhm0d+x6HeO6HC45v+gRTc2aDECN5pdZFhPmyfnS58ib
	 laMe3KfVeNJso5LgzfBJGGQGu85B3sooGhqWIyS/ODo/ge608SnVDh9qD+TIspkRC8
	 KC9z6TdPTMkoA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <keescook@chromium.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	phone-devel@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	newbyte@disroot.org
Subject: Re: [PATCH] ARM: configs: Update u8500_defconfig
Date: Fri, 16 Jul 2021 23:24:48 +0200
Message-Id: <162647049954.3478428.18046978019252393704.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210712085522.672482-1-linus.walleij@linaro.org>
References: <20210712085522.672482-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 12 Jul 2021 10:55:22 +0200, Linus Walleij wrote:
> The platform lost the framebuffer due to a commit solving a
> circular dependency in v5.14-rc1, so add it back in by explicitly
> selecting the framebuffer.
> 
> The U8500 has also gained a few systems using touchscreens from
> Cypress, Melfas and Zinitix so add these at the same time as
> we're updating the defconfig anyway.

Applied to arm/fixes, thanks!

[1/1] ARM: configs: Update u8500_defconfig
      commit: 042f2e107a2ea34605b3793a88b11761afc8e8e0

       Arnd
