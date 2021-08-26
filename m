Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F69C432BE
	for <soc@archiver.kernel.org>; Thu, 26 Aug 2021 09:35:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A832C6054F; Thu, 26 Aug 2021 09:35:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CADD60232;
	Thu, 26 Aug 2021 09:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629970558;
	bh=QjrFsi81TOQB1qw5hsx9MkAFmwd+UNyQ8NvyFkjWbDQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aKWNK4WIE5/TTjxoPD0Nkwn7HKojZj4UKoo/oKCIlprx24NzXG0yoZ1YcXLmbrt59
	 XMu9RJXarVjDa6NKzuXZ414N8NZ+dQF0U84x3kAyM0Y/IfpKGkRvKkLENXH4kKDIEK
	 0iHafoYs8LmR7lUZpsZ13c/2qoBSjBsXMm7+TRfG186WGlu7RasrCd8TMksAkpG1vM
	 SMwRDwQsgZ+Avkz/3Y9ctopyxpfyqtSjJpGXhkU1YOSFuA5V9u8iNdMFqvjNBtRaAp
	 g9LqT5F+ODuxCTSeQy+RD5HF9D4uCSekwPU+arVquHdH8ggzrXS9p5oUg/pnRP3HK5
	 0yIAdb4KfAQvg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Michal Simek <monstr@monstr.eu>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	arm-soc <arm@kernel.org>
Subject: Re: [GIT PULL] ARM: dts zynq: Xilinx SoC changes for v5.15
Date: Thu, 26 Aug 2021 11:35:54 +0200
Message-Id: <162997054034.837715.8900575474065288793.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5a25f882-103f-4df0-0d90-868d264c900b@monstr.eu>
References: <5a25f882-103f-4df0-0d90-868d264c900b@monstr.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Aug 2021 09:31:31 +0200, Michal Simek wrote:
> please pull this one patch to your tree.
> 
> Thanks,
> Michal
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 79cd0bb66e359f5f9398de9d2e86eac776947691

       Arnd
