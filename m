Return-Path: <will@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBD2C4743E
	for <soc@archiver.kernel.org>; Tue,  8 Jun 2021 12:01:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2D03C6124C; Tue,  8 Jun 2021 12:01:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8803F6124B;
	Tue,  8 Jun 2021 12:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623153695;
	bh=10kEx6AcAb1DYOk5Z6m1G6xVwL5MwyY7cY33NxXwLrk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=SsQvAaGqZQb0LBQkPOgCYXgFcwAzPujSZ9KfEoKR2ol/qWGjWOO0/5QWAIV1Nby01
	 ldU+xg2RfpyZ+zgoSh9GhsheHlKWppU6Id+1y2pL5i9xvqYExqOs87KOsxgxLr/7UW
	 sbwdIBNinAwa1J3B+8/VlKzTDmQSTVMFEF5OqNE4kOJqiaDu5Yz3ZcK8r8C0HARXZG
	 N/h6RlBfSY/yHUTuWvTzrp2NpBDYGmJHPYHwEl+xJlR81jnwMkii+oY9IXCq7uiKtC
	 1BAqX28wPSxTAR+OKpRNiQwf/C4g0reY51q2Gu5B5gxseGadAbg5uYFvFL5UKfPO2q
	 uXMooaZOHunxg==
Date: Tue, 8 Jun 2021 13:01:29 +0100
From: Will Deacon <will@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
Message-ID: <20210608120128.GB10174@willie-the-truck>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Krzysztof, Thierry,

On Mon, Jun 07, 2021 at 10:49:10AM +0200, Krzysztof Kozlowski wrote:
> Hi Thierry and Will,
> 
> This is the pull for you to base further SMMU aptches (prevent early SMMU
> faults).

This is a tonne of code for me to pull into the SMMU tree given that I only
want one patch!

Thierry, if I just stick:

https://lore.kernel.org/r/20210603164632.1000458-4-thierry.reding@gmail.com

on its own branch, can you stitch together whatever you need?

Will
