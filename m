Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418C0C43334
	for <soc@archiver.kernel.org>; Mon, 25 Jul 2022 15:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 268FDC341C6; Mon, 25 Jul 2022 15:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BB9C341CE;
	Mon, 25 Jul 2022 15:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658763883;
	bh=rDXT9rfgN8kx75SO4PMXXfnRzvd1C7EorSEtPG1a04g=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jY5t2yagKen3U/7wINlO0pnsskmmBPThcvMPFPcKaqLvqcyAJoAv8S1pMhMC5no/k
	 kFVc7ZBhGd9UmBVOd3h+/HZdiAnteYJF6VPs3ybWi4JjU9KgKAdwD0kSprfWBw6o+6
	 TQjZFDoMKAbdZsmkyOjAY021E29uF1sOZEoUeJwbUSsBH3XEGyO28N/zzi8FJlw4dc
	 TppjgQF2BYPIwfH/+LhnE3RkL/57DpGGNnUcxazsFDwPpGtBP6G5EIesGgmX2JAe4T
	 C6WGG9ZxGSZJAr6WtBzudjBomhBEA9eEM0YYIa85J0WrvhDKXl5TIvNO/8u8im2zkN
	 3rGyC1JM7Jxzg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>,
	arm@kernel.org,
	olof@lixom.net,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com
Subject: Re: [GIT PULL] AT91 SoC updates for v5.20
Date: Mon, 25 Jul 2022 17:44:17 +0200
Message-Id: <165876383599.2817697.4389136314815946994.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220721085852.1740924-1-claudiu.beznea@microchip.com>
References: <20220721085852.1740924-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 21 Jul 2022 11:58:52 +0300, Claudiu Beznea wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-5.20
> 
> [...]

Merged into for-next, thanks!

merge commit: 755d0ebc03f872c33b108534f23d82d2778c2793

       Arnd
