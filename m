Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A00C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A56A723B1A; Tue,  8 Dec 2020 23:10:53 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 2/4] ARM: dts: samsung for v5.11
Date: Wed,  9 Dec 2020 00:09:48 +0100
Message-Id: <160746884696.2839681.13212246100507043257.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201204404.22675-2-krzk@kernel.org>
References: <20201201204404.22675-1-krzk@kernel.org> <20201201204404.22675-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 22:44:02 +0200, Krzysztof Kozlowski wrote:
> Samsung changes, on top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 73f882a0f3a833d589c1a0b6b83045567244e71e:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8523df80815bc438b6e6aa9db959c0eed0185695

       Arnd
