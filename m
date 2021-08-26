Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B808C432BE
	for <soc@archiver.kernel.org>; Thu, 26 Aug 2021 09:46:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F2C09610C9; Thu, 26 Aug 2021 09:46:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FE1260F44;
	Thu, 26 Aug 2021 09:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629971216;
	bh=UZZH19xbwj74O/7bpUUVl19SrnCrf9VLxXK24VhzoDA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H6eL5Tie19SlPwlKpUv4B3GhTJy5q0CRd9/+xbTJHSpng6O1tJ2Jit8t+i9PcBRjh
	 hWTy09bX9ZTn76P6mZfgAl/pCFDL5L4SGtfwv2yY2OCRGVq9LdozMQFEn4ouCnAY7y
	 lVDVgmTiSjYJRI5q9R8TthPjiFHri29nA7k6IP4jsuygtiARzD+WPXsafAmzaD0e9J
	 huqE3KUp/SDBmhTXuWZoZENKaLaEsBA7WPtnla+4e+nOx+aZjR054LnkYV67xGcjxX
	 bIdjPmG8Y+ys60K9sbmVyLniVrbYpXz6rtVD82/A0ZgN/iTYx/D3jGIQhfeD2wCPFV
	 3U7DXg6r0XKvQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Michal Simek <monstr@monstr.eu>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	arm-soc <arm@kernel.org>
Subject: Re: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.15
Date: Thu, 26 Aug 2021 11:46:48 +0200
Message-Id: <162997120238.839533.17091999406711694821.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <f3dc69c8-8a22-e938-4ddf-b1052b8c1437@monstr.eu>
References: <f3dc69c8-8a22-e938-4ddf-b1052b8c1437@monstr.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Aug 2021 09:28:55 +0200, Michal Simek wrote:
> please pull these two patches to your tree.
> 
> Thanks,
> Michal
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 9fdbbe8443a372088c809eb8f2cf4488a41333e8

       Arnd
