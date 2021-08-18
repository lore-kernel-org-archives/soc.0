Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3629DC4338F
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 12:59:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0447661075; Wed, 18 Aug 2021 12:59:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7AC5D6108D;
	Wed, 18 Aug 2021 12:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629291584;
	bh=kaFdSUB1vCXsW9txP2B+ZcDmzRL2H2ebjNpIqOXnAKA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O+H4KtMOeXmtd71yTDxzaTF8RVIhEXVHiyefHb7N9xDqreoxyOz0/tap10CTQwWwj
	 ohS7b5enBCDsx5wAw2KwfaPYkhwB8VbLwIapoX1zK4d8E/Jiyad+Z2y/l0ZnkHvyub
	 fhRs9kf8ioUSIzPvnMYzCzLedhZeF2Uy3bLd+wwDTL6hixHtvaVrXbyF5+7sg839rN
	 otYJSJ8zNwr2ADWh9m0cO3U2Giv029s1yJ4YxC1AeptFrGwky7zSCZGOUQRDkrPCcF
	 pST/hW5Re0//vbM7mCPNx8a0ANl+AOM3pahdDLxSKGp+kt+IydYZBtjful7zeDURq8
	 GLwQvDDLSvQLw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Andy Gross <agross@kernel.org>,
	Craig Tatlor <ctatlor97@gmail.com>,
	Matthew Hagan <mnhagan88@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	linux-arm-msm@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kevin Hilman <khilman@baylibre.com>,
	Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Qualcomm dts updates for v5.15
Date: Wed, 18 Aug 2021 14:59:23 +0200
Message-Id: <162929137177.372162.12275626408150474282.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210816211957.579365-1-bjorn.andersson@linaro.org>
References: <20210816211957.579365-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 16 Aug 2021 16:19:57 -0500, Bjorn Andersson wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4d314179d62b19d0b5ac8de51b491494359c7a19

       Arnd
