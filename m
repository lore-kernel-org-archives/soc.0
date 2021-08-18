Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CACC4338F
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 13:34:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1B9BD610A7; Wed, 18 Aug 2021 13:34:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94C21610A1;
	Wed, 18 Aug 2021 13:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629293691;
	bh=rwRK9crQJCVnHKW8vkrj5lMxrpEgI49GLjIfAm0Rpuw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kq7hrYdtnmlJuaZIOyujyeJ5oQ8E5tQ3THqFoe65yzI529W1oT/AgAPWAKXuhH5Go
	 hk6a5mGmtVXGBFFMkPpo7tFZ2SBTWq5nQHUV+WgVxbaA0ah5B9Wm8q230vQmtX/JFq
	 4yxLiYM6e8Dpj3p5M+6dZhja89Bx+5dVCg95QdMFzCfMyho9Y79DPHuMZWWOrrQ8fP
	 Z+8GeauG7KHFEdHznfGJetrQbLVamAClJbj+cM/aQ6nQC1j7YS2JmB5+aE5l2qUKRm
	 bqcqUTut4Wk0NiiKva6XjD/Nuew1Vg41QzrcQQM3ea/zZNIdQxg7weMsA3tV5rqpIT
	 DgXD96KdvOJZg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL 3/6] soc/tegra: Changes for v5.15-rc1
Date: Wed, 18 Aug 2021 15:34:39 +0200
Message-Id: <162929367315.377646.14938708321715472898.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210813162157.2820913-3-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com> <20210813162157.2820913-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 18:21:54 +0200, Thierry Reding wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-soc
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: c4361dee2e6cffa32122e06c9df0a9c2e5c4dd51

       Arnd
