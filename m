Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32990C433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 16:48:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0F02164F7E; Tue,  2 Feb 2021 16:48:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A3AE64F7B;
	Tue,  2 Feb 2021 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612284483;
	bh=v1NnVSi+Hlclnm9HV7X6h64hYRp8PCCjPAjlT4F8aOc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AUJdeI0JLDhQlnHpGSgRJuu0LdQacUZB5sD9HykPjOZJSAtqZcEsHZHiesFdwbFJY
	 7uGwQpbdptHRR8rJh4Lun8cBawAuGek/nja5coiq0cwQN/6Lv2lniNFM66Bx8PE6k0
	 8OBsAZH1Tymhi7K5V8CXpTzdrNQT/OoKPynfnTcNQSbkk9ELWOe8CwA7UKkY4Sn53A
	 I3ZXIe1W64XGVbmb3Ju5e7tFqW4l9OB7TFH37QGoWztqPVYD4u0mf9tG22icYsQhT2
	 ggsLOj2m+HawqGfBFUyO4F3GdSb6Ax8hRNWET1NoUTzoy6+KelMwb9ROl7bYfAa80z
	 L+5O1qof6i/yg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	linux-imx@nxp.com,
	Li Yang <leoyang.li@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [GIT PULL] i.MX fixes for 5.11, round 3
Date: Tue,  2 Feb 2021 17:47:52 +0100
Message-Id: <161228438432.1848830.13359081644541092544.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202071441.GP907@dragon>
References: <20210202071441.GP907@dragon>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 2 Feb 2021 15:14:42 +0800, Shawn Guo wrote:
> The following changes since commit 82c082784e03a9a9c043345f9bc04bc8254cf6da:
> 
>   firmware: imx: select SOC_BUS to fix firmware build (2021-01-18 15:49:07 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11-3
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 422d7e3727d8f7b269a7dd2eafc279fd5dddb13e

       Arnd
