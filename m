Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3CBC433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 21:53:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D41DF64F60; Tue,  2 Feb 2021 21:53:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F91C64E4A;
	Tue,  2 Feb 2021 21:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612302798;
	bh=/iqLl1BUbBvIq02FSb76w14k0wBG8cwfzgfHCy0DoJE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y9ISv6akuZggdUWwtfLNWZB1OroAXmHYMedVSQDzPrJorUzWDVVzs/lq0Eoce+uGT
	 TSHWxR7w2h0lQqbf/2I+XpvTBfZDPEcdFT+Zp0K5DoGydvywAjy7zAd+EGPpPa5Zj6
	 iqn6kIRYaxkzkZfiBIWjx4ztbbC6+fCyXpTxjvkugSYj1pk8ZdqFeJgBRtUV83JWUk
	 dnujkRAK4MnYAeN2iVuRFvsWJygkbOVeszKUtjhiaKWrbdSigqlTHIDeBDeZCnWWVp
	 7OOBYrfU06u0oz3VZlgzZ2LKXedBJOTFx7cbnadvvprYTA+nPh3YF+hHGGsKiKdRHc
	 ZJTUWMSmDOPCg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [GIT PULL] ARM: mvebu: arm for v5.12 (#1)
Date: Tue,  2 Feb 2021 22:53:08 +0100
Message-Id: <161230250389.1905703.11481925970231429793.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87v9bbn4az.fsf@BL-laptop>
References: <87v9bbn4az.fsf@BL-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 01 Feb 2021 17:25:24 +0100, Gregory CLEMENT wrote:
> Here is the first pull request for arm for mvebu for v5.12.
> 
> Gregory
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 1d025e0abff92668a102c0d798a9faa228ea0896

       Arnd
