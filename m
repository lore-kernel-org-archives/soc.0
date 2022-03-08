Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E97C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49756C340EB; Tue,  8 Mar 2022 16:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A299C340F4;
	Tue,  8 Mar 2022 16:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758155;
	bh=qbdlz1nGrM2WuOMwyog2y8b9+U1xPPFoRP2Jj4sbFnw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GYhxDEgC4RV3yjiGvzU6jv/TV20BmHTDfeIBq8tY4ctZqcQpaszqN7dJ8uycKtRoq
	 85/v2AALz7/Y41PEoixh07aPUg1/Bqzbyc4zKpAOFL0a+cRva+5EDg4YVIQygC/6nR
	 7rSciZvhIwHZ+6tr79m5XWuquEFELcJfcJlIi6cUNuj8jHy2YC/15vrlIE/GffLAtc
	 XKuOxQbMFviqKHfBqx8I8KMCzut6prtxjQJ9R9kjkVj64Zw6P6THAWY+dHZ17fZOe6
	 HuTw8rQpKifK3JQp92ldHnN0A+AOp/gudeoc02nC31pT1GWdEl8iJ9Q/csGOFycVJp
	 4cPrdUVRtTDzQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	bcm-kernel-feedback-list@broadcom.com,
	khilman@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	olof@lixom.net,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>
Subject: Re: [GIT PULL 4/4] Broadcom maintainers changes for 5.18
Date: Tue,  8 Mar 2022 17:48:59 +0100
Message-Id: <164675812312.4164061.7087808908072435666.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220307194817.3754107-4-f.fainelli@gmail.com>
References: <20220307194817.3754107-1-f.fainelli@gmail.com> <20220307194817.3754107-4-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Mar 2022 11:48:17 -0800, Florian Fainelli wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.18/maintainers
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: d25ca90833073f2b807e0e697dcf05ba75396de7

       Arnd
