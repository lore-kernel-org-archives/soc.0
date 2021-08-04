Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A49C432BE
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 13:57:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1DEE560F56; Wed,  4 Aug 2021 13:57:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBD6460EE9;
	Wed,  4 Aug 2021 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628085421;
	bh=uSKDVfXkjQyfGeNj9IN/e8YDTazOYowYnjxP434zn2A=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F4D6A93B65XQK02mI5rGajm/OLrkZz+veO064hOjsIOxJsq4dpL4vJhx8SaRgkje8
	 AAK7DsgzkEaAfPGjZGaQfzH2Wehvm3SPJSPLO9GcvKjJn7OU1nibntDT76Fv3w5ltS
	 s7c+lHZyCbVPjoM3bC7ZFpxt/byJKLzvSTyYAqUT/ypRdvkCiV56NTvwhDS9IskvDL
	 7fv3eWV8LOn/bOIdNeSTshTSrTr62bTYSz0yWeeyJBuTeArnZHQN0nh0S0Ffa9Xeq/
	 zxb/dUrmDmYpv8OqbdPAuUbkzirIN4InLYRg8oQNikppTNOFyPpmRx2Oqy1/LHXaD9
	 Ti51oEqV9kIZw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stephan Gerhold <stephan@gerhold.net>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Ux500 DTS changes for the v5.15 kernel cycle
Date: Wed,  4 Aug 2021 15:56:56 +0200
Message-Id: <162808541212.328977.8507226322336641533.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACRpkdbjBv5ywZZD8rK07d5sLcHsG8o4iYD-3jHO=HLg6-nKnA@mail.gmail.com>
References: <CACRpkdbjBv5ywZZD8rK07d5sLcHsG8o4iYD-3jHO=HLg6-nKnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 3 Aug 2021 14:25:15 +0200, Linus Walleij wrote:
> here is a first set of DTS changes for v5.15 that would be nice if
> you could pull into the appropriate DTS branch in the SoC tree.
> 
> The details are in the signed tag, mainly some new phones,
> and some generic fixes.
> 
> Please pull it in!
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 72ee3b4dc2c8c56aca2608a0c04d0eedaf6fdc67

       Arnd
