Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA60C433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:06:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8ED9F64E40; Tue,  9 Feb 2021 23:06:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB7A664E5A;
	Tue,  9 Feb 2021 23:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612911997;
	bh=BuVGOgcKBY6v/5FQJuBvz93sC+cXkuKqd0cBByl/3tk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bOnZiT0zQdcbqnndwCxAai1B1pIfzx+4ZxoW7PrIh8A0z662KyrInNnfLxTc6ed8W
	 CEgPqF94U9edY4E8/vVx9Ywh2RgmREOFIVrmE9YHTcFibc6xeeT15gyacgauVl7dwQ
	 ueD42Vkr78SbAckkajqqMPDjsS0lUa9mJNL4GaxS0TbB7yM5vFWxrwMKDmwNCDk5KO
	 uICn8wh9b7o+brGVSGiJNhkdDB1pVZO/Je16Zy+ksceBCmazY6sUfvyo9ivhjY9Vg6
	 CU8bsLIiy8byGl3sDx31lUwOV5LpSswH7/bhA3dpGL9TMaqRefKrOYpmQhUMDJaOex
	 87hcmpgcEx4ug==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Date: Wed, 10 Feb 2021 00:06:09 +0100
Message-Id: <161291141019.975053.14323750026373147341.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125191240.11278-3-krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org> <20210125191240.11278-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 20:12:39 +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.12
> 
> [...]

Merged into arm/dt at least, sorry for the long delay.

merge commit: f3d8876acac00e7430e46679fb1da26e50c006d5

       Arnd
