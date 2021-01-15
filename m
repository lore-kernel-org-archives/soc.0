Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA92C433DB
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 016F8235F7; Fri, 15 Jan 2021 17:24:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A30F235DD;
	Fri, 15 Jan 2021 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610731486;
	bh=OQsLRT05ZNF0znQn5QLJSm7CabOyjrFTY8JiQ2EO8c8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S0ZJCLlmInHg4fRIX4Ti743cmpAqAAFElooOsJJcPVK/zBXmtCVItQ3vGJ5aCcpiz
	 5NRqIw9pZrANNbQFd1U2AYOJoBYlDTKMqNOck8Gemf/sFlzKGVTK3su8R960SS6WLs
	 9ajogrEWvXN7DxnMkOGA1R6vHdojhmeTrPNOChcNz0KATgcz67hnAlcK+6ylL0XcxA
	 5SKkae7z87KXDOTKydeyzNuCl7JF2bJJEA3kwzgMbHVuP1rir/fHbMGVdEuuL8gNSg
	 S8pY1YOkK3Ogx8mGG+FoKalZAVczE6KLbZt9FDxIH9jFXkVGrsuifTnnBa/tgHyuZ8
	 oj+yFlIELDTkQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <soc@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/2] Renesas ARM DT updates for v5.12
Date: Fri, 15 Jan 2021 18:24:37 +0100
Message-Id: <161073140429.707311.9431331517406763943.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115094610.2334058-2-geert+renesas@glider.be>
References: <20210115094610.2334058-1-geert+renesas@glider.be> <20210115094610.2334058-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 15 Jan 2021 10:46:09 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.12-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 2555a610906b741e2f399401e39111db91c07c6c

       Arnd
