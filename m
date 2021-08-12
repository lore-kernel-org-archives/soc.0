Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038FCC432BE
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:06:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D020560E52; Thu, 12 Aug 2021 21:06:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7839F6103A;
	Thu, 12 Aug 2021 21:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802364;
	bh=OGDIeApfqC8Joka7WYJErUv0ZmCZiuB0zUmzx9K00gg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hOQ/MbxM+8ZUCvwedCiyMU+2eguLbFwo6djyOyWQeUAptNmUihcmFFG8V9TgE7lhd
	 YIItxQkESyOx6bK1QsLGqyczM++PsTJVEPPqlKE5Nf7AFq0L0OBH1YHdA/Ir6bQ+sk
	 Q1XJ6zutnWLi4f+i8E6ZfpJgxpBMRsKTcrCQndy/WTevGJzsJA2zltRTWH2qO4LfNi
	 tu2B2yKY3qezOWND/s4jAqAqxfrQuDskSM0rRn9B5nnvyNLJcm8GVAt3TxPdWli6aB
	 qfvwCpSqGfzoic1bdn7BSFOn1wSLCQtrTGdG8p2oJnebKLhhvk3SJ6SRhSQV2Lpxkb
	 5ogoPjJaZ9n2g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm: dts: amlogic updates for v5.15
Date: Thu, 12 Aug 2021 23:05:42 +0200
Message-Id: <162880206165.1376011.6655305408575524550.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87519792-c9e7-76a6-5db5-0e955286b564@baylibre.com>
References: <87519792-c9e7-76a6-5db5-0e955286b564@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 10 Aug 2021 09:45:21 +0200, Neil Armstrong wrote:
> Here's Amlogic ARM DT changes for v5.15:
> - meson8: use a default higher default GPU clock to solve probe failure
> - meson: add AIU audio controller and codec for ec100
> - meson8b: fix pwm regulator supply property name
> 
> Neil
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c2632c3afead6e4c6208f90348d142ce1bb372a2

       Arnd
