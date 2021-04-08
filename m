Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5409FC433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:20:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2678E6115C; Thu,  8 Apr 2021 20:20:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51C3161159;
	Thu,  8 Apr 2021 20:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617913235;
	bh=Ol4v7YNDLR8aNW/yj8HuDlxq+pgknT1KPgaXlcHNMB8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hRGX3OIV2qmFI3/Y8vn0ePHMzdUSa448Gjc8yQFeY1kKqk6eCYaJcCo3JWQyWyrOj
	 wqviZRY6KVOjnbm3k2knNg/iuDRWgdGMwbk8pdmc4C9GdBxsFIb1lCpLH6n8P3ZNft
	 UUxDZMnxA3ezGLueNOkr8RbXhp5T38z69IFr/CEOdt80QKHXRcHmDO7X7Yi757qF06
	 4Vxo/S0FzArPgbrlPirsM8IrjyghpjFLmAgcfUHZp34YmbD7Oh6cfUmLIrzl5KIOCC
	 mKo9CGAkVRZ7SBL6mj/mAGuLQTScLQ2LF45JtXx6M7zlg2P/flRxRk8aYJKJXkSFyN
	 W8HB23nuJw6YA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org
Subject: Re: [GIT PULL 3/3]
Date: Thu,  8 Apr 2021 22:20:05 +0200
Message-Id: <161791320105.1663026.3535744727493035044.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617703816-65652@atomide.com-3>
References: <pull-1617703816-65652@atomide.com> <pull-1617703816-65652@atomide.com-3>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 6 Apr 2021 13:11:00 +0300, Tony Lindgren wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/defconfig-signed
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 2de5bb995656312ac1464ee29294140e9aacd642

       Arnd
