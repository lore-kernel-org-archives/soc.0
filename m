Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24029C433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 21:36:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 02FFA64F6F; Tue,  2 Feb 2021 21:36:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74ACE64F6B;
	Tue,  2 Feb 2021 21:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612301818;
	bh=Yu3RL8bY3wi7Zg5psBofoa57sj/Oe0KsOv3YRG9OC88=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jJXEl5aTH8smnBAWy8RsuwKl1AZgTxdYFVMKPY6ucjoUjzagsK8coyLgNzVrg33ba
	 oOKmav3JtjhSHWuuxRKQHqwF+NTijNbe4fNNH8mTl4C0R8SgYFgE+BYwK0b6u9y4HG
	 wAbPyBEgW0Sytu4MgXcv+zm7lVPbsBMZ/lJU8FIeVoru1c6+k1bmjek1M/9Z3r7ZQd
	 nD9ZzgUWnz/jr1EExVDbnRvi9iBU/4xsYLY9txJp1XwFlMlD5yqiMacVjV8K8H9nFA
	 x6RHwnvcF/JLf2yo6F6YndHuVd8+FdtfPXc+LnVq2DVFS5C4O0ZIOshzlCDVX6xFyi
	 XLhADJ9SRqEkg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thierry Reding <treding@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 2/2] memory: tegra drivers for v5.12
Date: Tue,  2 Feb 2021 22:36:49 +0100
Message-Id: <161230178536.1902917.6098849331189719933.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131180109.11510-2-krzk@kernel.org>
References: <20210131180109.11510-1-krzk@kernel.org> <20210131180109.11510-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 19:01:09 +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.12
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4d29b82686589fafd4cbdd2de5ae8b72fd5a3149

       Arnd
