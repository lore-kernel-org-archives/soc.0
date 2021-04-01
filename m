Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4E2C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 21:06:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E0E60610F9; Thu,  1 Apr 2021 21:06:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6827C61105;
	Thu,  1 Apr 2021 21:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617311176;
	bh=aU5eIRlokgwXpE9A3/ENaHVe8YqqSvWFabzY1JGsmUs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q1s2JR8X4t8VeznZAJxE+1W7kx12/X0Vyr2hMpzoLGLTbfRIWzmeR6r2smklDQmH5
	 kWplSRIz9z51nUgkcZ0hS4R08lgzxQ9IrNqk/X+Cj96SUnARjCLPYO6wg/NrmQ2mUl
	 RebGfqM9eU1h8lZyCcMIqZzIKV01O2h9ObNRrPKZFyY/TtnU5w2ZFMDwmB+4j2xUXb
	 0PR8WxwtSHWS4Kc8FtwDDoFe5/ac/PCOW4YW8xCxYa/so2L5qU8VfluMiruGmuWOSR
	 1EGgRwhM2sUYiDrUCuN6IxIMdL8ujIAL2ZcEiT4pAAvg9dFB4Wn0K0Q8MR3QxXVhaC
	 fu4rmCsnfSnmg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Enric Balletbo Serra <eballetbo@gmail.com>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [GIT PULL] defconfig: mediatek: changes for v5.13
Date: Thu,  1 Apr 2021 23:06:05 +0200
Message-Id: <161731114634.662954.7269701673980981374.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <70f6a2ae-2a99-6861-e591-9cc71bb174af@gmail.com>
References: <70f6a2ae-2a99-6861-e591-9cc71bb174af@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 15:58:41 +0200, Matthias Brugger wrote:
> Please have a look at the following changes to defconfig. There is a small merge
> conflict with the IMX branch, but it should be trivial.
> 
> Regards,
> Matthias

Merged into arm/defconfig, thanks!

merge commit: 03c623535fbd7313f854f944b1e22f364e7b4c98

       Arnd
