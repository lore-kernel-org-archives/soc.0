Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF32C3271E
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 09:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FD25C4AF0A; Mon,  8 Jul 2024 09:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF71C116B1;
	Mon,  8 Jul 2024 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720432227;
	bh=LjbhjXx/iDxJiWp8ze/pXr1zrcjJiznxsH2l24v6G04=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=nKPrPvrWfxH/gXX7LvBHEHyQ38mDiLFaXwfUmEEXe94yr+XqP5LK8ydqARDuZuX1Q
	 jV2vgau3IHTuXqwYLNauAU8zbMnVosAMzR9LNxwTzGvyWzbVaNfr4snpha+n6qsp7/
	 WDfj7Jh2AAFkH2nGF2dh0WWnhFKlk0Ywz0wKsRoVrD9HTBh5Le6hwdfaApmS8Agv1Z
	 1rxkkS2s02YohCEfzCPowYAvLvSoQLSMRw+Jb7gojSA/6RMMF1XMtsL8RhQjNtnO95
	 AQTHjZ66GCBYVkr86won4qrLOAIraDktauPi+YQiyyCLQFBcs6m9OVU/aL4P3q3JGl
	 QwK5CBJ0uznew==
Date: Mon, 8 Jul 2024 11:50:22 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, <arm@kernel.org>, soc@kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: mvebu: dt for v6.11 (#1)
Message-ID: <20240708115022.4b8a16c8@dellmb>
In-Reply-To: <87zfqvixn4.fsf@BLaptop.bootlin.com>
References: <87zfqvixn4.fsf@BLaptop.bootlin.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Gregory, Arnd,

On Fri, 05 Jul 2024 18:58:23 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

>       ARM: dts: turris-omnia: Add MCU system-controller node
>       ARM: dts: turris-omnia: Add GPIO key node for front button

these two commits of this pull request are already merged into
soc/soc.git, Arnd took them already:
  https://lore.kernel.org/soc/171986763734.7657.5378232958439993899.git-patchwork-notify@kernel.org/

Merging those will cause them to appear two times in git log...

Marek

