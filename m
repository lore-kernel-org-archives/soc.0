Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C86C433E6
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 18:21:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 36ED023A59; Fri, 15 Jan 2021 18:21:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A2B923A58;
	Fri, 15 Jan 2021 18:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610734868;
	bh=6QiqIlmR7WlzanFDxJUT65TOIwyU+ERfnpGteDoQbVM=;
	h=From:To:List-Id:Cc:In-Reply-To:References:Subject:Date:From;
	b=ouCp3K0KJYjcJA7aEuqZGWpuY3wby8/OJ8R1z4D4kMyzOaMdEJ5GwImSuK5Vly3JG
	 JXBz8csl+tIZFTBKnHNQY+kojrAir3Kb3VFq0FzYC6dSWC1BSAACJePaJTAWm1VCmH
	 kNjW3YaYZk88l3Bs5F44CIH4UOfgAtuyvv9oCIJBxIAv1xmH/r6P8wLNbWUFcTdqbl
	 L14NTPjhGlBVk4kohr6b32Gg7jMSWAMUDnxyW7qEy6IBohVTKL0r4AQqfAV+1H0dVl
	 gyAPBbYEdMrWtSsN6JgjIeY3xqS8aIN+axey2Ws4vczYcOueEAEMFYUzLx6Y8+gG93
	 jZqF4QK4rqhcQ==
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Michael Turquette <mturquette@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, linux-i2c@vger.kernel.org, Uwe Kleine-König <uwe.kleine-koenig@pengutronix.de>, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
References: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH v1 0/7] Remove ARM platform efm32
Message-Id: <161073482877.12522.15707372087584975608.b4-ty@kernel.org>
Date: Fri, 15 Jan 2021 18:20:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 14 Jan 2021 16:16:23 +0100, Uwe Kleine-König wrote:
> there are no known active users of the efm32 platform. Given that the
> only machine that is supported has only 4 MiB of RAM its use is also
> quite limited.
> 
> Back then it served as the platform to develop ARMv7-M support in Linux
> which was quite fun and still is a blissful memory.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[4/7] spi: Drop unused efm32 bus driver
      commit: 0ba882ae2818193487b70ad39622973538711d9a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
