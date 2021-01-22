Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72FAC433E6
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 22:54:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 81EB723AC0; Fri, 22 Jan 2021 22:54:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B22723AAC;
	Fri, 22 Jan 2021 22:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356045;
	bh=BFX2HYev1d6TjynEtQaOr/i6Ffu/KsVhtXwLDJpBj0g=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gGx+O32ys9uN5xc/ukmkcN8JGi/HxUhOUV0/z/WFAsUEkrtBeoOq1bhKiesyUzraD
	 ch4RzxiyX7AhvzrUHpSIzKPGrHqZC++m6Ne2W+gNIE75hlhwETYWfkaDJsAindtkgT
	 U/DVlj5YLevKDk5YkFz9pKC8HVEOdXHtyNe07Suev375jEM33ciUGHRCKzJ/kSSYzd
	 XohtRiRryVRMkkGfnslNMqJGwn1jFX+NOxYKk8dgE7zi98tDbiNMptGhmNnBpMsuHQ
	 MP1+jmES8q+UGuliYgyUqljBMbACxobftmJJgE9863lrLTjgzxOU3BtDrnbn1vMewS
	 nkTFt5m9PDZ4A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Li Yang <leoyang.li@nxp.com>,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de
Subject: Re: [GIT PULL] i.MX fixes for 5.11, round 2
Date: Fri, 22 Jan 2021 23:54:01 +0100
Message-Id: <161135603548.1322254.3404706975452422521.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119091949.GD4356@dragon>
References: <20210119091949.GD4356@dragon>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 19 Jan 2021 17:19:49 +0800, Shawn Guo wrote:
> The following changes since commit 5a22747b76ca2384057d8e783265404439d31d7f:
> 
>   ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming (2021-01-11 11:41:17 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11-2
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e49c24c8cd00ea9d7471520fff562fb4e7e9f61a

       Arnd
