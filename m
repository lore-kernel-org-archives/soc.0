Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308AEC4338F
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 13:33:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 17FC161029; Mon,  2 Aug 2021 13:33:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C4BE60FF2;
	Mon,  2 Aug 2021 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627911183;
	bh=mmqHeiFvwF9QDh60eNIsgRYt/X9zDYRV2hQyNLBuxik=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BqkfFlvAaV/JvpiLsWt+KoNrnHI5u7Z3+kp8eYA511uVAjbjjDwxrC22GIQsxYwJT
	 0bHaiH5wmIBQfJ1oDuPoC/mSITwfd3Jn/yX4a7VjUs1Z6L0T+zxETeJEYoOVSKWRYZ
	 0RXatXYrMHxWBcdAsLFVbxV7rGYWGypH8n5k5Jc06q9HAYq9H4HtEVMLGII8Ovtv1Q
	 MQMdZay+yPdxgqMiKOd76NIvvTueinx2pGBittVTWa2cI+Pb4EUjNi3LRB/6sDQGu3
	 8/ob6rxNAYXlnhPIBon5YcSmDDGUXDWiRO++T3Z0t/cFbEIsP6gEhOy3x3wlF6EXkX
	 Yhj3kMJO1YTgw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v5.14-rc3
Date: Mon,  2 Aug 2021 15:32:43 +0200
Message-Id: <162791113497.1139989.17406882949519965534.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210716233858.10096-1-thierry.reding@gmail.com>
References: <20210716233858.10096-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 17 Jul 2021 01:38:58 +0200, Thierry Reding wrote:
> The following changes since commit c667dcd4dfcd515ad2c9b3953a33d742985a0b5e:
> 
>   arm64: tegra: Enable SMMU support for USB on Tegra194 (2021-07-09 16:50:44 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-rc3-arm64-dt
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 79e48a21045e6f2ccd9f59737685336d9ad75d54

       Arnd
