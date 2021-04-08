Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7622CC433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:49:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 541C961154; Thu,  8 Apr 2021 15:49:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4878561107;
	Thu,  8 Apr 2021 15:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617896986;
	bh=p53ecF1Fx3p/0Uhx99nZ4D2peOT5uuvKigODBWT9GYY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LGI+fnobdJwPwn4UujNb6VPOxVKxN797pCvc1P4oyTvQO1MB5BLlcanWt6bP0wRu/
	 ZtEM+wCBHNnPLjTYVByD7x+2yBq79qFglAw6SXJmGHP8fZjDAcBH10ln4RPmLwe6w6
	 2mHh3HiQN6G+sTfRqVz+H/2oCOPoTqXVAyA0K5Plk12bYpV93p/ulvV7zVD/zlJXta
	 WVVC3jrOJmCJhMriOUKKtRC0FkpYm2jEtFVHWf3XZbawPEvdPntHuTVVkA2YzjnP7n
	 fWcMEqKHiPFH6le9ATirT02spfHY6emnvHIiTcXQWW3S9tWtTMwQrGR8ec4zHLGmyc
	 4eL6YRy3BSEYA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 1/2] memory: drivers for v5.13
Date: Thu,  8 Apr 2021 17:49:29 +0200
Message-Id: <161789693312.1636044.14460514423137399257.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407161333.73013-1-krzysztof.kozlowski@canonical.com>
References: <20210407161333.73013-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 7 Apr 2021 18:13:32 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.13
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: f8e547f5285b8e4f862de90b0425a93999499e25

       Arnd
