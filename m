Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219EBC433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 21:47:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BBC0464F86; Tue,  2 Feb 2021 21:47:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA36764F6A;
	Tue,  2 Feb 2021 21:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612302469;
	bh=i6wiBXjXHYMQrIXKdhkijXXD3Eo65HiYuZQsy41rUO4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HCTYCrch6t+4j01Nt79LG/6JvBALr0O2b2WQbiygm/fkM+WMJWDU1mQ2jyrCGQNqF
	 pK+gzu6biTZmfs4RVkRVU3lJ0g7K8yq3b27bmULlLxoUXrLVOpXicMxFDeunLZMkqR
	 OZ5M8PKnpI8A9idWE+VUUqcdU1IUja/09vjHBUUfj4Qd+7H+GvutiiylsAyaVOlcYW
	 AfdD6L8NV4s8jhkgCB+HWWOd42roMwQCE+8Mj7OfeQtxhTUWgHEeLgSSPfYpmyebFg
	 6IbtWZkKe5MU3dBSWqmzH+qSNpDuKxMDKorZFWoM6rM0xOsoX2+lEAkseaZnenvg17
	 RebhoCemZfQ1Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	khilman@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxime Ripard <maxime@cerno.tech>,
	olof@lixom.net
Subject: Re: [GIT PULL 6/6] Broadcom soc changes for 5.12
Date: Tue,  2 Feb 2021 22:47:45 +0100
Message-Id: <161230245972.1905468.13486794667754807651.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131221721.685974-6-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com> <20210131221721.685974-6-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 14:17:20 -0800, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/soc
> 
> [...]

Merged into arm/soc, thanks!

merge commit: f79bf56fb2b5f1540ba5605ba28cf89ee9dbaadf

       Arnd
