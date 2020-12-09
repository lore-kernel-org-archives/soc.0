Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5D7C4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 16:41:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1735223C18; Wed,  9 Dec 2020 16:41:51 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 4/4] ARM: samsung: Pull for v5.11
Date: Wed,  9 Dec 2020 17:41:38 +0100
Message-Id: <160753194649.3961338.5362755882159537932.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201204404.22675-4-krzk@kernel.org>
References: <20201201204404.22675-1-krzk@kernel.org> <20201201204404.22675-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 22:44:04 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.11
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 2efc35dc439740652c46133357090fb5f03a90d0

       Arnd
