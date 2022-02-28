Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BDBC433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C6B7C340F3; Mon, 28 Feb 2022 15:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFE8C340F0;
	Mon, 28 Feb 2022 15:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646061414;
	bh=btDhWaDE8RyQM0gyw2vpPSB7XKpxRxKTEtK4ffMPtBI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z2+mKdi48QUVWHm20/OblTIThVW88ETqrNRUZZADw3rWakqywFSj8W91+9nY5YvDK
	 fmQixQUcnppUi/GNkutjnFmyKvHDPWNZAgXNEOYP/IcCakU4LlfLqJLKfuN3MKz4qw
	 VRcWoefOBmzV4l8eis2BVHXVljinbPYiJnZa5X+zfLWKkI7UYK+cRA/+pl5kufr6ZU
	 Y6J4wat6O35Gyi5hahievaAVy+a9pW71cMGGEEaxhi3+IRCkdf5ji72jlCy0srWe6e
	 0F0+uTbu4UFDHVXPElsevsjDv1+fjD0+MhEToDrlPeyviK0s2vYWse8O6O5yQxk712
	 MfsO/UlPR4Q7A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 1/2] clk: samsung: Tesla FSD for v5.18
Date: Mon, 28 Feb 2022 16:16:31 +0100
Message-Id: <164606116813.3364867.11149175854504513678.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220204154112.133723-1-krzysztof.kozlowski@canonical.com>
References: <20220204154112.133723-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 4 Feb 2022 16:41:11 +0100, Krzysztof Kozlowski wrote:
> The driver changes for Tesla FSD clock controller. I got ack for these from
> Sylwester.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: ab930ecfcee86fb333ab42954caddaddd3c2e82d

       Arnd
