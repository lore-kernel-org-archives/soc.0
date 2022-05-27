Return-Path: <SRS0=/f1H=WD=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB758C433F5
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 18:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1B7BC385B8; Fri, 27 May 2022 18:26:11 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 240F5C385A9;
	Fri, 27 May 2022 18:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 240F5C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nuef3-0005E6-Dl; Fri, 27 May 2022 20:26:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip driver changes for 5.19 #2
Date: Fri, 27 May 2022 20:26:08 +0200
Message-ID: <6492509.1IzOArtZ34@phil>
In-Reply-To: <6613768.ejJDZkT8p0@phil>
References: <6613768.ejJDZkT8p0@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 17. Mai 2022, 21:35:07 CEST schrieb Heiko Stuebner:
> Hi Arnd, Kevin, Olof,
> 
> some additional things turned up (fixes) or got ready since the first round
> of pull requests for drivers and both flavors of devicetrees.
> 
> So depending on the schedule it would be nice to have them still in 5.19.
> But if it's to late for some, that's also no problem and I would then simply
> move them to 5.20.
> 
> All new tags (here + following mails) of course go on top of the
> previous tags.
> 
> So if timing allow, please pull.
> 
> Thanks
> Heiko
> 
> 
> The following changes since commit add9f6f30e54b5c07e7a0260cda459ef1d9646b7:
> 
>   soc: rockchip: Fix compile-testing SoC drivers (2022-04-30 15:06:14 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-drivers2
> 
> for you to fetch changes up to 9b59588d8be91c96bfb0371e912ceb4f16315dbf:
> 
>   soc: rockchip: Fix refcount leak in rockchip_grf_init (2022-05-17 10:49:37 +0200)
> 
> ----------------------------------------------------------------
> Refcount leak for a used of-node in the grf-init.

superseeded by v2.



