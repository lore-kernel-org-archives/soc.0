Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34794C432BE
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 20:44:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1461E610FC; Thu, 12 Aug 2021 20:44:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B26AD610EA;
	Thu, 12 Aug 2021 20:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628801054;
	bh=dGbtEwIfkRj3qTxeh3QQZJYMta1Yvfy9I6/Wj7nzINQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qRCUsYWOy2LO+OYWrdAUWUxhU5wxjbU9R6N6qomWB3u9W8RHmczEHllcc4K2Zlbyl
	 99/WBlqvSQti0a+pZNYHv12bmEofcsNm5utdkir5I0fzcTXWiviZASjRX0gFry3sUK
	 MJjx5ndDHlG5ieS5hXwnUM6t5a49FbA3Tqu2vTg7n5dj4fMx++YB1PMXC7XTuR0pke
	 3qvtIODyg+DbpCEYQ9F6dIVL+aJ9G8sozgFQmHRC5dfR7NYLjf325qTUoPM1d74Zo1
	 hgkUaEJjH1t29RL+XpghD+TqzIQXHGd6vrmu1Ot599vbNQQtTV838X8g8jCNODdxuH
	 9VdJ3PlpnC8Ng==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] bus: ixp4xx: return on error in ixp4xx_exp_probe()
Date: Thu, 12 Aug 2021 22:44:01 +0200
Message-Id: <162880092600.1372486.9999578242110413401.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210807230016.3607666-1-linus.walleij@linaro.org>
References: <20210807230016.3607666-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 8 Aug 2021 01:00:16 +0200, Linus Walleij wrote:
> This code was intended to return an error code if regmap_read() fails
> but the return statement was missing.

Applied to arm/drivers, thanks!

[1/1] bus: ixp4xx: return on error in ixp4xx_exp_probe()
      commit: d2c334f49c8305ff8ce31ea33183977a2935ba55

       Arnd
