Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77359C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 19:24:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 58505610D0; Thu,  1 Apr 2021 19:24:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11D6C610C7;
	Thu,  1 Apr 2021 19:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617305073;
	bh=D7jJwnU+o4TFZE/ODZG4YwaqAYa78t9bwwiTUI35u18=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZIHdbmYtKJ2K5Gb+IqDF5ghFYdXZGeeYOn6xU62eZm2jW0FB74wxPqtj/UnMDM+od
	 mpiYHvPoSNgufD2iFABfOpEFb/bQHL4qJfA0KRUpjgiX26EJg8PeK4d6HSh78O76ft
	 onHziqy7iuDr6f5qJp1MtxYLOZ0KHwel+dfjgvzl23I/xM1Uj1dUadvdZKenqH23Dg
	 EcBSNie2F8z1sSGDwkhrlfvN7y7+Vtc31+ZybYLK+l/t0sgI9MF6hEk3dYrXmsDfge
	 x4voyWl+aC8B0CUFFjxH7kth8GgupVjzJWorp6PloD43K9AXow+MHlB3fLzwNHLMgX
	 V1GDLDt8BIRgg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	sboyd@kernel.org,
	dmitry.torokhov@gmail.com,
	robh@kernel.org,
	u.kleine-koenig@pengutronix.de,
	bgolaszewski@baylibre.com,
	thierry.reding@gmail.com,
	f.fainelli@gmail.com
Subject: Re: [GIT PULL] Raspberry Pi driver updates for v5.13
Date: Thu,  1 Apr 2021 21:24:14 +0200
Message-Id: <161730504479.632809.2179392548261995613.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322174232.29549-1-nsaenz@kernel.org>
References: <20210322174232.29549-1-nsaenz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 22 Mar 2021 18:42:32 +0100, Nicolas Saenz Julienne wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/nsaenz/linux-rpi.git tags/rpi-poe-v5.13
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 7da68c64bc9037da7e470bfd219a2b5b7e7c5af1

       Arnd
