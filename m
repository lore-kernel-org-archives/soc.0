Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E381FC433E6
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:28:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A1FF764E0F; Sat, 30 Jan 2021 11:28:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1D9864E0A;
	Sat, 30 Jan 2021 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006123;
	bh=wVl5bVcuYp/HPn8t1zDIIFe5Z6C9zjZIpaJ+Ow+lRSs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NVv6UnX/tszV1BOXlC+wIP0QH8avjaa2gj6YfUIcPkViGHYr9HpGr3BGJogEXbyOb
	 SVVL7ML3ilNe7MQVSxzpqkrI/jzVxU4FVGNT5XhcELpySi3TK6+5vcQI0G2Kwp0tgv
	 LRFRwK/WX3sitUWwHj0T0Hr6tT3ytg+x3wWKlUhVLedg3hbU5q4JULXWzNIPZntgc/
	 qfJ4e42ULPSHpCW/Y7VzVEzQ3vn7e5+NHUSvezmcsMPsBA3gFp0F8jRm8fG3V/rD8i
	 +nR3os8BB25B3yxUgIHEpubgdBT+7IssWi/mI1EwkTljLcO7jAVsL1IqwC9CUVp4Rt
	 wGMv0Q6ZiQ1Hw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [GIT PULL 1/3] soc: samsung: drivers for v5.12
Date: Sat, 30 Jan 2021 12:28:34 +0100
Message-Id: <161200610095.2091874.8775611267645584082.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125191240.11278-2-krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org> <20210125191240.11278-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 20:12:38 +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.12
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 8bd99a058fb62af53f9603057f2efd635f149575

       Arnd
