Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682D6C433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55979C340EE; Mon, 28 Feb 2022 15:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C6AC340F3;
	Mon, 28 Feb 2022 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646061428;
	bh=Ueo4HSLvVj+bSswxxlhIb538hti/btJ1Q4eSWoqLWlg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pp4xl/2bCbgdtmvakjpIS0HNvwkg1Jd4ciAzMMyiaiiqmP4aYqaB7wk6Kj4WABwGN
	 wQdZElDH6sZtSMDxisTG54eZDSMccXsduFrmm9pfhKKgt41BvSdrggBA6db56WRFFT
	 dCdhViDeUwqThc6XMy4h5zvir0i4GqtyRcNozytUvinIp3/ibe5Q/IGmRBal8UHMNf
	 8xY6XPJFxg8hqmsIldjaVHfR6mjHdXHVJdZVGd/f8tjxo7vTVB4RhdeJjV5K/gcL4G
	 2ajKiOV2cEcMolrcHg17r+uk12XrJYFAUi84/TVG9A4t5M6NGMwgs0cCcm34hfnl8B
	 3aJ06fHNGP90g==
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
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 3/3] ARM: samsung: mach/soc for v5.18
Date: Mon, 28 Feb 2022 16:16:36 +0100
Message-Id: <164606117158.3364867.18410361494517135661.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220226220116.13452-3-krzysztof.kozlowski@canonical.com>
References: <20220226220116.13452-1-krzysztof.kozlowski@canonical.com> <20220226220116.13452-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 26 Feb 2022 23:01:16 +0100, Krzysztof Kozlowski wrote:
> There was no mach/soc pull before, so on top of master.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 27888394504350569978487bb39e577cf5142b3d

       Arnd
