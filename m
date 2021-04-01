Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96574C43460
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:15:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 79D18610E9; Thu,  1 Apr 2021 20:15:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71448610EA;
	Thu,  1 Apr 2021 20:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308145;
	bh=s8j//r/d3gLMWz9k4ZTOKwkEdFM05hr+GZamxB+rLXE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YP51i5AyExVj7QymRa8johNBhbIr3le4k1kQCHGMLwosS6VBwcwbe/XfFhNrmQm3x
	 BRFuEugrzSmUNyVpoPj8vaWw/CESrO6bE7zX0n7i1MJxhL6bKtZN4wKS9GMQcTZwlg
	 yobEFzlsZAiFp96YqmeSgzMV225ZfkxEzQjAC6qBqKXBTIyfuhvCu811lKLj7kv6lC
	 YAbWFghgXS5JetU6ciwh3EpVL1OmRIVEGlHTQoh532kM8cFIUlpfrrycivRCwyhW4l
	 xtNrfMoShw081GavZc3+ANV2NtlQNeCGnKfr8+XClSd/MWrzB/94DkdKUXWyu9CHQ5
	 DPj4S4TKpo1ew==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Ux500 DTS changes for v5.13
Date: Thu,  1 Apr 2021 22:15:20 +0200
Message-Id: <161730808657.655497.5182529223027957909.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACRpkdanRQ6A85d=7vgpzbg-m3-yFcpQ4fuzrxZu3RJ0DrA2bQ@mail.gmail.com>
References: <CACRpkdanRQ6A85d=7vgpzbg-m3-yFcpQ4fuzrxZu3RJ0DrA2bQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 15:15:32 +0200, Linus Walleij wrote:
> these are some Ux500 DTS changes for the v5.13 kernel.
> Please pull it in!
> 
> Yours,
> Linus Walleij
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 03a807f4ee1e629419461cc4d9935bbbafa7d157

       Arnd
