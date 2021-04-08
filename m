Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C0FC433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:49:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3B4BA61139; Thu,  8 Apr 2021 15:49:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC8EB61132;
	Thu,  8 Apr 2021 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617896989;
	bh=KpWxnR7fl5H9gVzFKvuH42GkOQLuCn/WwV4QWurqZOY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IvKxEgkONLMgARr9BV3oFr+5KB1DeUgvIipBq7l3+RWPkkiYGk3dBlrO7SMrVQzY9
	 gEyNpdqcIo+pxkL+QVUuxkJ40k404QmxmlGlHbAU6k/0TOlABOx1eSC79a9IWSqAfz
	 eisyJO6Twip19b6jDkqp7Qye8uMrKiSemZGUGSnRrESI7Cr8DSt5QQWDV2DrzUlFtQ
	 ZLfTeYFZrSU2SihyxPz9RAbH4Vk/CLqEiJIEar0i+2Hv9tjr4GqCImvoyqARDgqv+u
	 5CmnTz4YiZVDq6FFCWKz/JxOpD0YFJLaKdUlYkKKZCILcUVTsSZT/0cakxHKJ5W2ws
	 DnLZVdk/P9CjA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [GIT PULL 2/2] memory: tegra for v5.13
Date: Thu,  8 Apr 2021 17:49:30 +0200
Message-Id: <161789693320.1636044.10008067282970888055.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407161333.73013-2-krzysztof.kozlowski@canonical.com>
References: <20210407161333.73013-1-krzysztof.kozlowski@canonical.com> <20210407161333.73013-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 7 Apr 2021 18:13:33 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.13
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 0a8e73301d2b071a9e4ceb1901773502d50b897a

       Arnd
