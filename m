Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980A8C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:50:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7EAF561373; Wed, 20 Oct 2021 14:50:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 831086137C;
	Wed, 20 Oct 2021 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741452;
	bh=TRfYW+7MPGUxn08FBnDf5ZZdhIN+j92I/689B273xSo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TWPzRAtGzR2Ywc2xN9s11edkSebx1q9ooDcXEv35am/OCYyWYAnOKlQZiOnHOaM1T
	 CHLhyisq+WTkz+weoEKV47eebcGfwwnGAavB+/Uogc8KY/RdAamMBSFuLv9OkE7GCF
	 JLzXvxo7h1Jtk7/s8FG8v42z6AaFqspN3lGPj5G7B8qRb1aFzxIKHO1H78aK49pXPT
	 71ddPRIhLwztCje8gK9d2F9Hgaw9EGCeb7MHy8Z74M2oH+yMwbze0JbcElCS/GCKwi
	 KXYPtPEnY3HB133skaGULgPeNO78bGPmbMNQPluYTlChb6SincGMoae0fawmKA8oF7
	 8xebrnO3IH7aw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-imx@nxp.com,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL 3/6] i.MX device tree changes for 5.16
Date: Wed, 20 Oct 2021 16:50:19 +0200
Message-Id: <163474139794.4099414.13320436095409865623.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016140138.1603-3-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org> <20211016140138.1603-3-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 22:01:35 +0800, Shawn Guo wrote:
> To resolve the dependency on a fix, the pull-request is built on commit
> 9b663b34c94a ("ARM: dts: imx6dl-yapp4: Fix lp5562 LED driver probe"),
> which had landed on mainline.  Please consider to pull, thanks!
> 
> Shawn
> 
> 
> The following changes since commit 9b663b34c94a78f39fa2c7a8271b1f828b546e16:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8bd8822c83785ae669a23080d1638b0a534203b1

       Arnd
