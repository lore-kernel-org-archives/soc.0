Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783D4C4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 20:41:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5A6FE610CD; Thu, 12 Aug 2021 20:41:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE4BD610A3;
	Thu, 12 Aug 2021 20:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628800896;
	bh=7oRSYR5XXc1fs9uoTljNkjs9LQwRhwjQKrprY2tkjH8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=or++Sj+XgZ3bvZUzACSh+09MONBDX/RAZQ114pJUJ1L5zfaue6zLibAIUrgCDQ5Fj
	 T6KaIehX5Smvyfga97Wh+dkxCzjIPedCES2p4ZHWSt6jcHTCTCS48EdhycAZHCYHM2
	 m9OEmObEzGAk7KqHb4E4Sc5dsgWmz1MD2L4U/ebXvr/Urm0Ul7nmD08D5TAc1WQKHV
	 d0yqwuh99fCwQzISt16kai85DdHAjWF/W4znY4X+0iwRhr4FC++eJZj45iwX6GJSHO
	 PH24Ufz/7tEWDx8bPJU6l35TFfXFIIYZ1q2Iz3gH3u2devo+lf8Onj0TkkyvQ463Oc
	 t/CUxRBx+5mmQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	arm@kernel.org
Subject: Re: [GIT PULL 1/3] SoC changes for omaps for v5.15
Date: Thu, 12 Aug 2021 22:41:30 +0200
Message-Id: <162880088338.1372369.14302259325676706777.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1628153040-834155@atomide.com>
References: <pull-1628153040-834155@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 5 Aug 2021 11:46:42 +0300, Tony Lindgren wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/soc-signed
> 
> [...]

Merged into arm/soc, thanks!

merge commit: c8d9a986d0f2466d11ffd07e66fed9f4a34631a7

       Arnd
