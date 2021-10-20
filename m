Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6E0C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:50:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DD71C61373; Wed, 20 Oct 2021 14:50:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1155B6138D;
	Wed, 20 Oct 2021 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741441;
	bh=u7zQWakHPBtcuf6nifDU5I39hgpEJqhYXxITmxy9U0M=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q/IPhTeT78/LU230wy32aOSli0tySh4czSe+TrU65uPBcV5sxMLf/Ehb7+mFiRqfO
	 btpjj7uzVKD4ok9QSTo7LzA40Cx5c4O4CRmiMSY/9D3ESBXvPnrydzdq4l8YgAaJ8K
	 M3Swq3k7S56oXE2PDmwB1aKztacCteojBwCV50IBB9c5Xixe2aKnQCs06XkmiqSi67
	 lfIUpf3BAyQ7Lr0ptI4DoZ0LFfyFyMhnj829W1ljNaLt+zPT4HLIOSbRVGwPRrtcb3
	 CivIeSLzY4jTu0LVkIw3NCTKNEsA7ydTI7YVpTqer528FVHlNQ6KkX5BqYc9MVYEZa
	 OsIAfKSThzjVA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/2] arm64: dts: samsung: dts64 for v5.16
Date: Wed, 20 Oct 2021 16:50:14 +0200
Message-Id: <163474139772.4099414.5704617411027385317.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211013162418.43072-2-krzysztof.kozlowski@canonical.com>
References: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com> <20211013162418.43072-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 13 Oct 2021 18:24:18 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.16
> 
> [...]

Merged into arm/dt, thanks!

merge commit: f202bd97c6893973ea1a12918125d70fe937d45e

       Arnd
