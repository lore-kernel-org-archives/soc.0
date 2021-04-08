Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C095CC433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:21:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9F01561159; Thu,  8 Apr 2021 20:21:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 611E5610FC;
	Thu,  8 Apr 2021 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617913301;
	bh=XG7ZBeR3dlHMBKcF/vu3FeV5kedebxxNaln7NWAPM7c=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UmVZFYgHg2Qu//Lb1WwP3aMhSyPySThqRBS21XDepOffkW2RDa38E6hL//LpbOLAY
	 wDcQZc/ecE0zc10u5TNjofg8dKLzU2AJYzGG3/eFLGqBMRTKBufH/nlSaoa32Gax6M
	 StiK0FMqBXEcshw9JzE3uE565Gbtm7oTWHtm9bIJvNMHr8PeYE1eD8Xgw9kE89pwVP
	 wqcSD2Ko0G0ywJA1mvTBg41roSqc1zzUH9fTyUUD8AwPeTh6521w3ly4UJYp/NjdAH
	 V5MXYOFir8Y6oNd6SDm6dAkAHy72jrK6u03r+9USRnYshVMPcNjOWZW9cMS53DD+jZ
	 UW/+7xti+M7HA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [GIT PULL] ARM: mvebu: dt for v5.13 (#1)
Date: Thu,  8 Apr 2021 22:20:55 +0200
Message-Id: <161791324990.1663215.15241029409271472842.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87v98xbzir.fsf@BL-laptop>
References: <87v98xbzir.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 07 Apr 2021 22:39:08 +0200, Gregory CLEMENT wrote:
> Here is the first pull request for dt for mvebu for v5.13.
> 
> This one is latter that the other ones, because I've just found a
> patch pending since December. I hope it is not too late.
> 
> Gregory
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e3e1276295a4c5eddc31dd297e8f6af275ca9c4f

       Arnd
