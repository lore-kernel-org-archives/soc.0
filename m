Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794A5C433E0
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 13:46:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 363BC60235; Fri, 29 Jan 2021 13:46:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF18D64DD9;
	Fri, 29 Jan 2021 13:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611928006;
	bh=oPq4sFit7YO7Rft5AJXMHtPa0VnDL+Ek/lfiIAj7SFc=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=i6jjs2ZN7u4agWkQeVuQzcj5ycUfQipZx1qmvdBMPFPr/i1VXWh/YsjeOGKIPWq5a
	 NRe79fuNoaCmK6U4Tf7Ss1a6ht4mnfRl6bSukL/VqGpSG0DWnXK8uwaQsLqPCoFglj
	 h9g43jyQUlr0mSVimFqOnHqp9M1NVO0gaH+UFVdMjODulg1b4t9duc28SkkBMH8+74
	 poJipD6FlNJxna0bZYFwwP7NUhkEHBQnaYMXqzIF7Hssb4YIClmuOFUoVDOO/dIBSO
	 c03svx0Eyz4yr3XJGCkYFx408xgawATUn9UJvptPEIHarc4Sz7Ei6idrlz21C/nxFU
	 vLqYnxaJzOi2w==
Date: Fri, 29 Jan 2021 21:46:41 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Jun Nie <jun.nie@linaro.org>
Subject: Re: [PATCH 3/5] ARM: remove zte zx platform
Message-ID: <20210129134640.GG907@dragon>
References: <20210120124812.2800027-1-arnd@kernel.org>
 <20210120124812.2800027-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120124812.2800027-4-arnd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Wed, Jan 20, 2021 at 01:48:10PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The ZTE ZX set-top-box SoC platform was added in 2015 by Jun Nie, with
> Baoyou Xie and Shawn Guo subsequently becoming maintainers after the
> addition of the 64-bit variant.
> 
> However, the only machines that were ever supported upstream are the
> reference designs, not actual set-top-box devices that would benefit
> from this support. All ZTE set-top-boxes from the past few years seem
> to be based on third-party SoCs. While there is very little information
> about zx296702 and zx296718 on the web, I found some references to other
> chips from the same family, such as zx296716 and zx296719, which were
> never submitted for upstream support. Finally, there is no support for
> the GPU on either of them, with the lima and panfrost device drivers
> having been added after work on the zx platform had stopped.
> 
> Shawn confirmed that he has not seen any interest in this platform for
> the past four years, and that it can be removed.
> 
> Thanks to Jun and Shawn for maintaining this platform over the past
> five years.
> 
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Shawn Guo <shawnguo@kernel.org>
