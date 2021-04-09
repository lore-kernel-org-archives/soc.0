Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE9DC433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 19:49:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7F851610F9; Fri,  9 Apr 2021 19:49:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC80061001;
	Fri,  9 Apr 2021 19:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617997762;
	bh=gUjb4/opSryKjWBhGwiAhhKnOxqBuUP2YiJ/hvd9zSE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JcYJBdxz/m+LLq2obInUAlZFXUJ77PHo0WaRrf7o6NFOm9WSxfdQKeUL/cdbwuJ5V
	 i34BjKEzxLpxll/g0LZDMiXVOsa2h25Pt+uq/ONRj6ccqUEEufXy5Kqbnd9AVhqYBv
	 Dcg1kvnGlKbw3W0ZpXrBer6et0nUKYHuGvsUy2Dha3jhbBrYQ0aqhDxYdi/esO3uil
	 XQ9nTGRJ6NUglEY+LEXtJ3/k4/sAZLvRsra3ddQuvJvTCzVV928TconhJ3UKoV6kV4
	 VGjRo6ZsCGcomyilRHtkmDTgCNKYfk/DoVLef1x2GP2oeC2WQPn+1M0IvMtAVqOBEu
	 d8EJEaNhjT9Ug==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	olof@lixom.net,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	khilman@kernel.org
Subject: Re: [GIT PULL] Broadcom maintainers changes for 5.13
Date: Fri,  9 Apr 2021 21:49:18 +0200
Message-Id: <161799773277.1861470.10984939931826324456.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210409175018.3051283-1-f.fainelli@gmail.com>
References: <20210409175018.3051283-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 10:50:18 -0700, Florian Fainelli wrote:
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/maintainers
> 
> [...]

Merged into arm/soc, thanks!

merge commit: d92e5e32fb4fce7ae939ad322aad77955dd5dcda

       Arnd
