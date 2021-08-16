Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C23C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:21:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 66E0560F11; Mon, 16 Aug 2021 21:21:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC64C60F46;
	Mon, 16 Aug 2021 21:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629148868;
	bh=qCFAHVCLRijxdHcCRgP9+akPfqIuc+pSwHcMdU1zdsg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vDqEIQ1IcZn9OnwFNvDA7GaPCrsNC+3mfNv3p16+ZGlC5dLtaHY9ketayQjPe2r14
	 Q4Ax6hm2KW10C/GcFIuK3+0RSdd36S13eQEYimNSgAr1sjh04nzGF73RLFulUHG/DX
	 9vmZ9y3gKPi7aAJkJE02tlGpq9QoBnNI2Y30uDRTwNW06ma0X9NrJfbtwuKP25xbVv
	 hnGZifyDqPfSmWU9WpIs1wO5X+jr4ufXuYBpBKExrw/6qO5DRf/ZXtoMDc6eXNzR1L
	 CKvM9CTx4gQXtt9xknZ6OmTmy2zoWMVCwneXWNPnHCuwA6HkuJXZCmcBQfRnIGb+oK
	 kk4b10q16JyEw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 4/6] ARM: tegra: Device tree changes for v5.15-rc1
Date: Mon, 16 Aug 2021 23:20:53 +0200
Message-Id: <162914852247.237905.11712885319102863319.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210813162157.2820913-4-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com> <20210813162157.2820913-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 18:21:55 +0200, Thierry Reding wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: aadf2b3857ad1d09fb28f08058a746f04698f81b

       Arnd
