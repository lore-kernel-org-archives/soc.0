Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D93C432BE
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:05:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A778260C40; Thu, 12 Aug 2021 21:05:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02C2C60FC3;
	Thu, 12 Aug 2021 21:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802359;
	bh=P2+yjXgpe5h9ZiR7iZDKUesx/rUkYvbe4X2FBdeDs40=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eQ7V4fAcxaBDtY2X0HnXmQ+9SyAXXZS8Nnr/Hb3OuI+t7JoVV+HBaM/7QAFCtooGk
	 mBo8OSrpOJC8Y2yrVev6FVqtJzWL0m3zh+/I18aELTE1rQmTp1QJfsP8PTqn+DiLc+
	 z955BNS9+JQe9QEYDkDS1s65cX16D6t+dWUuzdfMkGkwvxIyTKuobou9/aCbbztme3
	 H+GWdDcczJCzX6NTkLX040fAZ5g4nss2XZxy4eAgtCQZDe8Ny0yLgelNL4BJcQINJd
	 8DHWSY03L8hQhoXAzHAI5rml3+umMTTbKWdlBCM1hyHbmbkcI9S9WGF5K1yTDX7DD5
	 LD7E8yGndMrwQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Bilal Wasim <bilalwasim676@gmail.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [GIT PULL] arm64: dts updates for v5.15
Date: Thu, 12 Aug 2021 23:05:39 +0200
Message-Id: <162880206138.1376011.17456680023998324459.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <26c4026a-9f26-d5a3-c30f-439120a4eaa0@gmail.com>
References: <26c4026a-9f26-d5a3-c30f-439120a4eaa0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 14:20:11 +0200, Matthias Brugger wrote:
> Please have a look for the arm64 DTS updates. This time we only have smaller
> changes for existing boards, but no new HW. But don't worry, probably for v5.16
> we will see some new SoCs.
> 
> Regards,
> Matthias

Merged into arm/dt, thanks!

merge commit: 261a910d6cb7f6079974aa61d31124483832911a

       Arnd
