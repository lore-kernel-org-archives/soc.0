Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C939C433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:04:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3F64B61104; Thu,  8 Apr 2021 20:04:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F67760FF3;
	Thu,  8 Apr 2021 20:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617912247;
	bh=rcKN5yldNAxejhRQZhc4YXYKEmOYpJwJphmoRcDbirE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pT80TH38nr+H7toA4cLZ91LC1Tk+VynJjVP7HCABS18DGacVl/jvvft/+Oqnq7lxw
	 eqIi48xzp52h2hqhfJgnQqbrKTk8/v5+j1QPL1IkOfqIccOXp1jiIdJ9uxE4XZHVVj
	 /WLK0hjpk+ruzGV5YNfl7GnadJPdOR+OLKUj8pLMefQ+R1Lmb7+zEZPutp1vSDm9Lh
	 91H2okaU8gYkbH+Ysy0yUjlFrTszVVHo3gpgjmqsY6uSgAzn6GBPLhcekxhbHmlGpw
	 t4yP/Zcv+ephbmafcv95/jIpjNDq9THEBeHZAwNML6wAdLm8LN9XvX2JPa70tdYeDJ
	 6UiqKUmKFKi4g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org
Subject: Re: [GIT PULL 1/3]
Date: Thu,  8 Apr 2021 22:03:33 +0200
Message-Id: <161791219767.1659621.8262556060310725064.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617703816-65652@atomide.com>
References: <pull-1617703816-65652@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 6 Apr 2021 13:10:58 +0300, Tony Lindgren wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/soc-signed
> 
> [...]

Merged into arm/soc, thanks!

merge commit: f47e8e14373a731ab4fbd08615b2694ce1fc5142

       Arnd
