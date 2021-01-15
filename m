Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93ECC433DB
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CDA07236FB; Fri, 15 Jan 2021 17:24:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EC2423603;
	Fri, 15 Jan 2021 17:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610731488;
	bh=KZseVbo9RoGphRIP1u02wuJ+X2mAvguu5YPOXFM5qoA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fxNaUlV1Xo/14Yl+Dg1UeNXvDtJA7JIM1lsFtvBiyq54qrlZrAcJ4MgHgn+EDmujj
	 cxaSqnKnzACMqDruyZP7slQ7chaADhPci2/zvaygI5CWTvoVlQE7lROll/c3DNxsol
	 F1z+pI7Hjplab0HIyky9dBtLHvL01KVI1Pde0jAwrhfbY1SCcZXEHod4rpHE65CvmX
	 AgjJkiaVKBcQC7XIgaICRj5fa3mbkDyk2yZ23iioMUhno+Hwjfmx7cB4IOV/hVkTDM
	 IDQJmTAojEAofh4HcHXAj71Bq1DzlWne9pJXx3367FPHL5ULXtSz7dxR54B8cseiJ8
	 LOpgQCqQTtJwA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <soc@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/2] Renesas DT binding updates for v5.12
Date: Fri, 15 Jan 2021 18:24:38 +0100
Message-Id: <161073140443.707311.7075669932973488887.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115094610.2334058-3-geert+renesas@glider.be>
References: <20210115094610.2334058-1-geert+renesas@glider.be> <20210115094610.2334058-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 15 Jan 2021 10:46:10 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.12-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 7a367cc8d61e2542b0614cc7c8257a08a694c4e6

       Arnd
