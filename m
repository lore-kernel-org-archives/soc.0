Return-Path: <SRS0=9x2F=LC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14110C47082
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 16:51:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA0BD60FDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 16:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA0BD60FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6X1lmk4z36IGXLa2ZEwJSgaVikGvSGh3aPqH6oXqfjU=; b=N2l2F5yNbgb9RY
	zMZtYnioxb9pxUZDczEti8L/BsbED9WVXxGJ/6tphBxjmRbwOEJXY9M3ImYLlB5vnkQPWWTT464Ey
	Ya1IeVyToy9OzQr/0Wdx3ovTs7CZFmXhXL7Wkz+ukXm7zhYsu2QrZVdzxL0AWufNQWJGFYR6gAVZ/
	G9OuClCZttrwLq3aVXqoFv0F3gSuRH9tRqvY1vV97H6KVUR4bZWZS451g1yI3TnYJQygDxi1A/6gh
	UYGTH9mLnrYGOweGkQep3o2NFeSxs/bDiNj8Z5+HG/Mfr1WmcfjUx30giHbtvDbqWkHSWXDGCcf2w
	bzTHiPnhXhH739UNYNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqeuh-009b7B-Ux; Tue, 08 Jun 2021 16:49:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqeuQ-009azF-Br
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Jun 2021 16:49:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3543C6127A;
 Tue,  8 Jun 2021 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623170937;
 bh=g1CnEO+bLWj67r3E90OwsKLARWnKaYhTlQdxSZYfl5I=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=EtOn2cixsApaZz38iwirVI0QAvf/um1VFSRwQOMuhnJl05+Qs43ICBvq1bXCwx+Bf
 rpRQpSMVuGmdYqtS1ePKqsb45f8mKLGYJbiCPdYuRdvaqGO3VSySpksUn2/TTj7CMw
 Lw5lls9mclspL0KyBr5VuhUYAzFxPww2uOS5Hb1adRpCFVsT21iR9xRaC+bXUSc8YS
 +y9yMJs4s8Jf2FMZIsgu8+6PvmL+lUgTdTrspsdqIRyyB392JJvGfRcy4W0ZolbjmX
 D3RTt7WKhC4dj/fYdBDXIKjyHweOebAspN+HX4+jLZKIGkIgIIuappcilFwjVtOoxb
 eO8A4mUUuwmqg==
Date: Tue, 8 Jun 2021 17:48:51 +0100
From: Will Deacon <will@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
Message-ID: <20210608164851.GB10994@willie-the-truck>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
 <20210608120128.GB10174@willie-the-truck>
 <YL+A+MPjjaa3nSwq@orome.fritz.box>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YL+A+MPjjaa3nSwq@orome.fritz.box>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_094858_479891_D567C8AF 
X-CRM114-Status: GOOD (  26.48  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, soc@kernel.org,
 arm@kernel.org, Nicolin Chen <nicolinc@nvidia.com>,
 iommu@lists.linux-foundation.org, Olof Johansson <olof@lixom.net>,
 Dmitry Osipenko <digetx@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210608164851.M7jPMK_fZ7Ah9giOj9a-lfwUF3MT7dRgjSycE3UdJ3A@z>

On Tue, Jun 08, 2021 at 04:38:48PM +0200, Thierry Reding wrote:
> On Tue, Jun 08, 2021 at 01:01:29PM +0100, Will Deacon wrote:
> > On Mon, Jun 07, 2021 at 10:49:10AM +0200, Krzysztof Kozlowski wrote:
> > > This is the pull for you to base further SMMU aptches (prevent early SMMU
> > > faults).
> > 
> > This is a tonne of code for me to pull into the SMMU tree given that I only
> > want one patch!
> > 
> > Thierry, if I just stick:
> > 
> > https://lore.kernel.org/r/20210603164632.1000458-4-thierry.reding@gmail.com
> > 
> > on its own branch, can you stitch together whatever you need?
> 
> I'm not sure I understand what you're proposing. For reference, here's
> the set of patches that I sent out:
> 
>   1. memory: tegra: Implement SID override programming
>   2. dt-bindings: arm-smmu: Add Tegra186 compatible string
>   3. iommu/arm-smmu: Implement ->probe_finalize()
>   4. iommu/arm-smmu: tegra: Detect number of instances at runtime
>   5. iommu/arm-smmu: tegra: Implement SID override programming
>   6. iommu/arm-smmu: Use Tegra implementation on Tegra186
>   7. arm64: tegra: Use correct compatible string for Tegra186 SMMU
>   8. arm64: tegra: Hook up memory controller to SMMU on Tegra186
>   9. arm64: tegra: Enable SMMU support on Tegra194
> 
> Krzysztof already picked up patch 1 and I was assuming that you'd pick
> up 2-6 because they are to the ARM SMMU driver. However, if you're
> primarily interested in just patch 3, which is more "core" ARM SMMU than
> the rest, which are Tegra-specific, then I suppose what we could do is
> for you to give an Acked-by on the rest (2, 4-6) and then Krzysztof or I
> can pick them up and take them via ARM SoC, based on the stable branch
> from your tree that only has patch 3.

I think you previously said that patch 5 depends on patch 1, so I can't
take 2-6 without also pulling in the memory controller queue.

> Patch 6 touches arm-smmu-impl.c, though it's a two-line change that
> touches only the Tegra-specific matching bit in arm_smmu_impl_init(), so
> the likelihood of that conflicting with anything else is fairly small.
> 
> Is that what you were proposing?

I can queue as much or as little of 2-6 as you like, but I would like to
avoid pulling in the memory controller queue into the arm smmu tree. But
yes, whichever of those I take, I can put them on a separate branch so
that you're not blocked for the later patches.

You have a better handle on the dependencies, so please tell me what works
for you. I just want to make sure that at least patch 3 lands in my tree,
so we don't get late conflicts with other driver changes.

Will

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
