Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CA5C433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:10:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 97C1864F86; Tue,  2 Feb 2021 17:10:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20B1F64E3F;
	Tue,  2 Feb 2021 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612285821;
	bh=BtY82ylzczEbc/EAaBTGLwsi5Quq2AHfDBcDXBrGwlE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rWNtlTHqK9Kh9FkLY/4pZ2pV9yL7cnxtBIv1RrQZ7pDIDLjqUrRRv8qwjQNdPkCqV
	 ejKaV39mmCooutYe0HpTz+lnN4WbaRRkvn+qi5uMQCMKVa4L8p0y8byUmcnl9gkcK7
	 6s4070toLqxkzB49x43lP4a07LW/HEoWEUpxOmYRAYaD2J3qPHZKvEnVMgr+oxwwKO
	 4ofKLF6k95l0OhpUrRaDR4Z0bqBA5zbJOs6wFfAifVsqKo/0Ai6dZozYxvQpnF+4uj
	 9HnuI55JDih31R1M9qsd+FzWoWHCzs9yiAWF43kqtBh1RUIuFIqzhKpk4o0KOW83Vo
	 nrcJ1U1H9ANWQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Maxime Ripard <maxime@cerno.tech>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tim Gover <tim.gover@raspberrypi.com>,
	olof@lixom.net,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [GIT PULL 3/6] Broadcom devicetree changes for 5.12
Date: Tue,  2 Feb 2021 18:10:07 +0100
Message-Id: <161228552212.1852435.13012014115118293066.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131221721.685974-3-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com> <20210131221721.685974-3-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 14:17:17 -0800, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/devicetree
> 
> [...]

Merged into arm/dt, thanks!

merge commit: af6e05f171145298d6a6aba29c88c595258d2829

       Arnd
