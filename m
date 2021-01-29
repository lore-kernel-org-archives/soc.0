Return-Path: <SRS0=/U+x=HA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FE6C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 13:48:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C0C60235
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 13:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C0C60235
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=07DLJluTkKsKtPz8CwjWnYDqyQiyomf4ZeJGyld8fXQ=; b=Eh3a2L4zxQujehFJlGu+CbnD7
	9I827WBF85G9PhSV6QkoCAiXd5EafIPMuUHZJeeixxmdMxaRvlyAyMiSbLP8jZpjNkIQPRnsWOVRE
	8xxXFE7eSOmHxYokaN6NKHMIdUr2FkJryd1EQ3lT0iQXwHwz7RYAhZoXzuDngc9YqeammzGx2x0/E
	LDyWeILpNpxo/Ms47s/TfzUlhMI/pUxbnH3qMhZehSfFGAOfXSEz4UEK0ACWzuOmEwya3V8ul82LZ
	+JL/kzIFTfeE3WJ0Er2MVCLXd/mwzPcuJzzCtLBaOsdFkRLp8DluAgmkYNUX7n859BIjZUMzFtRLD
	/Dst/r4Mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5U6q-0003ML-Jv; Fri, 29 Jan 2021 13:46:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5U6o-0003Lk-RK
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 13:46:47 +0000
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
Subject: Re: [PATCH 3/5] ARM: remove zte zx platform
Message-ID: <20210129134640.GG907@dragon>
References: <20210120124812.2800027-1-arnd@kernel.org>
 <20210120124812.2800027-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210120124812.2800027-4-arnd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_084646_961567_68AD934F 
X-CRM114-Status: GOOD (  16.37  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
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
Cc: Jun Nie <jun.nie@linaro.org>, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210129134641.h98-LwjdGThNoLwde8w4AFWKXm73YW9Ez5-nphN96Uk@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
