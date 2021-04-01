Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DF7C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 10:23:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4AA9F606A5; Thu,  1 Apr 2021 10:23:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F209E610D0;
	Thu,  1 Apr 2021 10:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617272625;
	bh=p5KCKLqJHRYLueoAbYLS6e42Kesdgd2AMAGNW2j/wI0=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=bD0IXEYDeGDpArQsqq183H/4vvMYvpGwBHC45WambAigTgwEutUJwoOG7QSwqUTV8
	 QMouKfXBF70IRWEj65ARgjBhhCZtd6CJ7MHNFM0aUDPDj5duIhJm9B9P6JE+zhUmkk
	 l4hNZbWw37V+JIKxy62UHfgk2vVmY5nRhk/JEu2/lSa/HHgTQYBXbVsyAMfbhrroCt
	 XpjcVwt+XUVckl1/eebUJ8AAmOhqfPsQVaX0ep9YA5DHIfPn8ZtZdkxCW32nvsRaBo
	 1LMfg1SPtuaLmxqnX94pwnRQ3KUuZs16Lf4bQS4GfmrqU6a6oxsstlCcsqouj5i8Jn
	 3zAemsOEnM2pQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Tony Lindgren <tony@atomide.com>,
	Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	soc@kernel.org,
	clang-built-linux@googlegroups.com,
	Nathan Chancellor <nathan@kernel.org>,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: fix building with clang IAS
Date: Thu,  1 Apr 2021 12:23:28 +0200
Message-Id: <161727243810.583633.14191051174001891363.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308153430.2530616-1-arnd@kernel.org>
References: <20210308153430.2530616-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 8 Mar 2021 16:34:21 +0100, Arnd Bergmann wrote:
> The clang integrated assembler fails to build one file with
> a complex asm instruction:
> 
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: error: invalid instruction, any one of the following would fix this:
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: armv6t2
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: thumb2
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> 
> [...]

Applied to arm/fixes.

[1/1] ARM: omap1: fix building with clang IAS
      commit: b897653a2fd4b7d0a77aa209d1e6b5cc08899bbf

       Arnd
