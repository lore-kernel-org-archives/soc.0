Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBABC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:35:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 14A5D23B01; Tue,  8 Dec 2020 16:35:24 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [GIT PULL 1/4] ARM: defconfig: samsung for v5.11
Date: Tue,  8 Dec 2020 17:34:51 +0100
Message-Id: <160744514152.359082.5695891765941238936.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201204404.22675-1-krzk@kernel.org>
References: <20201201204404.22675-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 22:44:01 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.11
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 1fe9c2531974cf7d5d8097773c53c4bd28703aed

       Arnd
