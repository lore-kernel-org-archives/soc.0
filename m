Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E088C433E0
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 17:22:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EF2AB238A0; Fri, 15 Jan 2021 17:22:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BCA7233CF;
	Fri, 15 Jan 2021 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610731337;
	bh=kf6vmCuQLQ7y8H4dTC/+7sq5A31mmKSkFHkaBMWOTbg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GtIRa9G5QdXP2PFRowRFrAGwyBdWyNSXNuZCl2jyIftKqYgQLNoob9X2UiPBMabfq
	 dOBIqTKgRwJBYOhkkAXwkFuPdLOpi5bwt6SUGcLla2oT3rw/ptsOxv218J5W3mKhhp
	 xVSDcaa0CDy+Ryth1SGC8EmnaZO4zCM8bTV3i9vS7Qu/sJClqFDqd7084B+Y0hYz0j
	 5kQ1L8zrUgkN6Nz/AlMiMcyD6A56Dy+8iinW7tT0lrFSTjg7tu2iu7Pn84X7o1G7t5
	 YiPBt8T22yZhFax216gJP2rmnEiF7aQ4XALj5hjYkjGZDyfO/tfM2aeXGJSZGGIhTJ
	 80/Ols63Ier9Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH] bus: arm-integrator-lm: Add of_node_put() before return statement
Date: Fri, 15 Jan 2021 18:22:07 +0100
Message-Id: <161073123833.625238.240687123026047027.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112092549.251548-1-linus.walleij@linaro.org>
References: <20210112092549.251548-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 12 Jan 2021 10:25:49 +0100, Linus Walleij wrote:
> Every iteration of for_each_available_child_of_node() decrements
> the reference count of the previous node, however when control is
> transferred from the middle of the loop, as in the case of a return
> or break or goto, there is no decrement thus ultimately resulting in
> a memory leak.
> 
> Fix a potential memory leak in arm-integrator-lm.c by inserting
> of_node_put() before a return statement.
> 
> [...]

Applied to arm/fixes, thanks!

[1/1] bus: arm-integrator-lm: Add of_node_put() before return statement
      commit: 1740e6736922cc1a5d061cc4240d08eacfbbaa71

       Arnd
