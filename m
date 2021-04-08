Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926B7C433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:00:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 36AB6610FC; Thu,  8 Apr 2021 20:00:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C110610E6;
	Thu,  8 Apr 2021 20:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617912042;
	bh=SxBrRGT9Tl+suqUq4BMurqK/q3IW28mwJhRYcfWDY+w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T9yfnvuZ/3/CmeTb35U1fH5lws+uc7smOtvmu6qYdgkrs8byvFjX8BkeM6NNMImMD
	 +lZKYl7oD64IJcMIyJbfM6r7YFYiVUbxjej4gFz1dBmOFcQ4+FSw4LGqNiQD8iZJ+D
	 7LWZOhXtipEpTF4Lb63n0zzm1bGPKuKtveS8/2458SzbHnmsqTaPBjvNIR1oULR61C
	 vg0DCGw2NZr74Bye65HGiPqrvVQLTfSxEaKkoY6OX6IXwFsMwBaR6Eb8ol1++RHhjM
	 Ubi3LxB2fw6g0cFIgCwLhM9DGWbVcC7b5OsXWPTQVhKGIlrk9ms4JcTjitfQK2iQwz
	 YabzknaqjhtRw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Hector Martin <marcan@marcan.st>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Christoph Hellwig <hch@infradead.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	Mark Kettenis <mark.kettenis@xs4all.nl>,
	linux-doc@vger.kernel.org,
	Stan Skowronek <stan@corellium.com>,
	"David S. Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Alexander Graf <graf@amazon.com>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Mohamed Mediouni <mohamed.mediouni@caramail.com>,
	linux-arch@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Apple M1 SoC platform bring-up for 5.13
Date: Thu,  8 Apr 2021 22:00:12 +0200
Message-Id: <161791200652.1659138.4978126472531717438.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <bdb18e9f-fcd7-1e31-2224-19c0e5090706@marcan.st>
References: <bdb18e9f-fcd7-1e31-2224-19c0e5090706@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 00:55:28 +0900, Hector Martin wrote:
> Here's the final version of the M1 SoC bring-up series, based on
> v4 which was reviewed here:
> 
> https://lore.kernel.org/linux-arm-kernel/20210402090542.131194-1-marcan@marcan.st/T/#u
> 
> Changes since v4 as reviewed:
> 
> * Sort DT soc bus nodes by address (NFC)
> * Introduce defines to better represent the meaning of hwirq IDs in
>    the AIC driver (NFC)
> * Update stale comments in AIC (NFC)
> * Make of_mmio_is_nonposted static and not exported (export change only)
> * Rewrite pci_remap_cfgspace() more succintly using ?: operator (NFC)
> * Update FIQ series merge to arm64/for-next/fiq
> * Remove the nVHE series (we will let this go through amd64 on its own)
> 
> [...]

Merged into arm/apple-m1, thanks!

merge commit: 1bb2fd3880d479a7a1bf833baee731ae69f09060

       Arnd
