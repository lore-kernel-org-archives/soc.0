Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50139C4338F
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 13:43:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ED73D6104F; Wed, 18 Aug 2021 13:43:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D2C26103A;
	Wed, 18 Aug 2021 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629294204;
	bh=osQK9OGP8q6iI/2T3iNZcXe3HDO93vfu/OQwZ7g6PR0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cCJwlaSSYg07dbCzLyItTS6Qn6pPq31AL64y8okB2Emo/l9MoCFPG7/EhK402s3C4
	 K4MvTp13fOsoIvRSuPAeDMzJJoAWrmKmI0fmmfmoYQjg0qRBljmwxd+9si7kMCLudx
	 m76ZqigEzhitrhZ0n07z9nHCsW76JFxbTJP0JcqbqULgEWXo7WOcY388azInPKgqGS
	 MPJD59oVvsc1DRI7TPBFC6IyKGI0ITbrDdOsaMdJQbfeUYUsZrbIOBM1iBGCk4uUm2
	 s8iJmpQAXCtFHFkX9uD/Gu3FA9/dKnnrRg45v6UVE0bH1jh/87/SQfM6DP6qVPhIGG
	 fyoXBa8SxLDsQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Imre Kaloz <kaloz@openwrt.org>,
	Zoltan HERPAI <wigyori@uid0.hu>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Delete IXP4xx boardfiles replaced by device trees
Date: Wed, 18 Aug 2021 15:43:21 +0200
Message-Id: <162929419377.379314.14504743675400378814.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACRpkdY=sPDkzmbmm+0UQnJi7BXZKH14GLmyVwKC+4cLCJpmdA@mail.gmail.com>
References: <CACRpkdY=sPDkzmbmm+0UQnJi7BXZKH14GLmyVwKC+4cLCJpmdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 15:14:01 +0200, Linus Walleij wrote:
> this concludes the first big chunk of IXP4xx cleanup and DT conversion
> by deleting a majority of the boardfiles now supported by the device
> trees.
> 
> The details of which boardfiles are deleted and the two that are kept can
> be found below. The idea is that all devices except the Omicron ones
> will keep being supported, but as device trees. Omicron has publicly
> stated that they have no interest in keeping supporting the boards,
> if someone anyway steps up and need them, scratch device trees
> exist on the mailing list.
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 0fbd7409446a8ee76ee701ec846ede917c6c89fa

       Arnd
