Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5204AC4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:21:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1EE7E60F46; Mon, 16 Aug 2021 21:21:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAB3260232;
	Mon, 16 Aug 2021 21:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629148860;
	bh=/dLDdxhN4wN84E8SgCqPOUOIc7KQmce8hgFwVOioDWU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f//CBE2CFwFnceXN187DOQMPnMdNWox59GkEs3+eyIIOK+gGyAZ2pk5gQMPKsE2xO
	 X3OY3mTyLAt5m95LxNVHJnZqEf4yRpfQgawtF93G8dNJFD5KDCtsBljeZMPwfVsKOU
	 fqv4//tOtcah8wCdex5dvahdwg/i8CTCM0BZqMHWtNH7SHJ4rynkfEBlP6KLBArccr
	 GzxLCs0A5tlKQDbH8XYJ5Yx+XKyOu9L1G3vce5+YObPGr2cFmDAoH9jD6doTWqruPY
	 mIPvqFevZnS3cRVVWmflHjBs0hHWfKLCWm/PmApDZGnCgyOZ3o5mrlpPvKA8HB663D
	 iB5peO3+SgQgQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.15 part 2
Date: Mon, 16 Aug 2021 23:20:49 +0200
Message-Id: <162914852228.237905.17625199363925328243.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <47d77095-eee7-bbd9-d3aa-1dabeea3f0b9@baylibre.com>
References: <47d77095-eee7-bbd9-d3aa-1dabeea3f0b9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 16:12:59 +0200, Neil Armstrong wrote:
> Here's the second set of ARM64 DT changes for v5.15:
> - add audio nodes for vega-s95 & nexbox-a1
> 
> Neil
> 
> The following changes since commit 4b5260032ec691b11a9185f7f38f5761e67fab48:
> 
>   arm64: dts: meson: improve gxm-khadas-vim2 wifi (2021-07-26 10:08:16 +0200)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: fba65f104ea83d188ef470a3f32c519a7f4b5796

       Arnd
