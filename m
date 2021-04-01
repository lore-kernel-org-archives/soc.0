Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D31C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 19:24:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B141E610CA; Thu,  1 Apr 2021 19:24:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB654610A5;
	Thu,  1 Apr 2021 19:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617305063;
	bh=y4dKcnGnV+jd4LSVkwIniCXTDonRLqPpBczlpm8sm34=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MvpgvIL9NMvz4ioZ7qRXhUuFt8fsJcVvAhMuf4TLuUcH0KxsveuYc+Yrf6zhgW5rU
	 ws7CmN70uVe39REsVYjKrw3L3gZAUnIVUMrfsBNPMxq5EkJ8gNIF64z795EYVuNg+8
	 YsGJa9DzLe/Ns0RE45GQln1lgU3gnC5yS5yIRY70y/FulfMB5ADhcRkKtSS0pV9geB
	 mjU+C1sS3Ww3eBhezez+vs69SmGVhF212GhdKjNZgF7qOVnhhhsK2ju/MhhwXgHDLV
	 uqB+wZQoVpmuy4FR7zBBkLtLayrjwD+spcewMO94AubV534hWN5/ieeJloBjIQfjuW
	 ziwiYlwOjbVOw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	khilman@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	olof@lixom.net,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL 3/3] Broadcom drivers changes for 5.13
Date: Thu,  1 Apr 2021 21:24:12 +0200
Message-Id: <161730504496.632809.4121560040129719627.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330184006.1451315-3-f.fainelli@gmail.com>
References: <20210330184006.1451315-1-f.fainelli@gmail.com> <20210330184006.1451315-3-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 11:40:06 -0700, Florian Fainelli wrote:
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/drivers
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: e9396d6b3864d235c57733ccb4902834eb8313a8

       Arnd
