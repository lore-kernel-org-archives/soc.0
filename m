Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72E8C433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:10:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 73C0B64F8D; Tue,  2 Feb 2021 17:10:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B181764F8C;
	Tue,  2 Feb 2021 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612285830;
	bh=RDAJBs7hZAG5GvM978VxZJpSkxhRuZNwaO6Yq94kChw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vDaHzrjDb3AGR4e5b34K6gS00qljX3gLNowscx9++KNcpdMLf56srrZmgm+5rKt53
	 c7kOaA0sG+5Kx7nwgqEYCH3YHspzic1cJpibp/ayf3x5A8csdX80uBnzJ4W+0KBIDY
	 dPQwc2MDDXk6vq6S7BHQFT251BCNh+XaMTiBsp1guVnoO/8Qx8fZp3zwoEJvQSwCJm
	 XgESIclHh07vizO1OVvcJUQ/1sgD42svxsx5vGwXJyvi+FnXHADvLfJn13uygtG84K
	 GTO0mPmZo2GMT1WWwxGEyJsLOR35Lj/ZaOFLra5Xoi/1Tyr3BVjMC8CJET74CNEjSX
	 xuLCv29AbrFTA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [GIT PULL] ARM: mvebu: dt for v5.12 (#1)
Date: Tue,  2 Feb 2021 18:10:10 +0100
Message-Id: <161228552314.1852435.14453137896753476944.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87sg6fn49o.fsf@BL-laptop>
References: <87sg6fn49o.fsf@BL-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 01 Feb 2021 17:26:11 +0100, Gregory CLEMENT wrote:
> Here is the first pull request for dt for mvebu for v5.12.
> 
> Gregory
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 7e500c897ddf99f9f794a1ff80175a3a18547095

       Arnd
