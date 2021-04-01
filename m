Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FBBC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 21:07:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0B260610FB; Thu,  1 Apr 2021 21:07:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BA76610F9;
	Thu,  1 Apr 2021 21:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617311230;
	bh=JCsYID8U4RFD8FARp88ypge7lJ3j0xNe9pW+DzHjEIA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QZlWB1w+NHuUo0v75bXpU/j6egzD6u+at+uIEt0IKUT3RgBWjltg/txAbxYYYxAh+
	 R7wcsCHKXb43Zgqa4s/e+0Aj8vtmhSD6BNtQE4HEtS9ssalNp396Bz04r0UpZYni8i
	 FZaGnkMa8dkVcJASH69OYx8GI6MFbkIIv3zewpV1JerFNTldDCzYbr7DbgZXrb3i3y
	 oXMMKDslXzYDTzzYsauSqwD9NrGFqub3wwiiuiaYDJiKSxewlikMpY+pcsPUxnuROO
	 gWVcO8LPOye6U9Uqn0rP4FVPGenIOkSNstLqt+b/uW3ZfMbmoqjYe9l56JNoWU4uWj
	 jl56NynoWE/mQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] ARM: ux500: make ux500_cpu_die static
Date: Thu,  1 Apr 2021 23:07:03 +0200
Message-Id: <161731121856.663132.10821808877634787283.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323083203.1646842-1-linus.walleij@linaro.org>
References: <20210323083203.1646842-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 23 Mar 2021 09:32:03 +0100, Linus Walleij wrote:
> The ux500_cpu_die function is not exported so make it static
> to avoid the following warning:
> 
> arch/arm/mach-ux500/platsmp.c:89:6: warning: symbol 'ux500_cpu_die' was not declared. Should it be static?

Applied to arm/soc, thanks!

[1/1] ARM: ux500: make ux500_cpu_die static
      commit: 758c5408ea3d6d730ee388ad8354c4fe94685d4c

       Arnd
