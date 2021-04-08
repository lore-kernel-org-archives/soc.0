Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D65C433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:25:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6123761130; Thu,  8 Apr 2021 15:25:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38CE161103;
	Thu,  8 Apr 2021 15:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617895502;
	bh=5a4vcNzRLHM6a1J+w5nqqS4YBrOMACR+s98XVYQHmZo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VsrVKuhM8S0g3KmDKlmcRh6tz4uQYhO7wMi5S8NrHt6+VVBu6/wvo7goeIjfl3i89
	 EOaEzlJUCKApJSzACkyWVG9bQ3lCQXHJKoKa49qPd8F6dqUh22C5Ue41n3KyolpeCS
	 ykcKzGwTWC94D3lDuh+bW8xLUgxQo1OSXkDSTqvC4lfsTcFvSzJALy5GY4CZNfzm+z
	 It7b108nASammGR3N8CrvlQaZrn5n2aNEf5CFN0IpRtWcPnRJDp8tR5DKFzidt9Uz5
	 wqeq2HPy86n5tLJnFdLrWdnln3TsLKEeV0QRi1CFtuSayowpKzE1f7D6pqllo0nTx9
	 2qM1w58+SZGqQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Alexander Shiyan <shc_work@mail.ru>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND 1/5] ARM: dts: clps711x: Add SYSCON nodes where it is used
Date: Thu,  8 Apr 2021 17:24:27 +0200
Message-Id: <161789462142.1629934.16505174600939611274.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210405051658.26779-1-shc_work@mail.ru>
References: <20210405051658.26779-1-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 5 Apr 2021 08:16:54 +0300, Alexander Shiyan wrote:
> This patch adds SYSCON descriptors to framebuffer, SPI, DAI
> and modem control GPIO nodes to further rework these drivers
> to remove the call to the syscon_regmap_lookup_by_compatible() function.

Applied to arm/dt, thanks!

[1/5] ARM: dts: clps711x: Add SYSCON nodes where it is used
      commit: 62d171bce2a6aea17c59909756e194d308029149
[2/5] ARM: dts: clps711x: Add keypad node
      commit: 2bd86203acf3afba550e84defb86083bdde85714
[3/5] ARM: dts: clps711x: Fix serial port names
      commit: 94d1ca7c05ee3d34cbf398be6ac8e52a97d3f2ae
[4/5] ARM: dts: clps711x: edb7211: Add unit-address to memory node
      commit: 15bf198197d1485bfd14888665bc3becc21ec582
[5/5] ARM: dts: clps711x: Add an empty chosen node to top level DTSI
      commit: a3c1086c17e44b571410c2594dc54c94779dc918

       Arnd
