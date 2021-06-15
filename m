Return-Path: <SRS0=fFfY=LJ=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B70DC48BDF
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 15:31:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 54FF3615A0; Tue, 15 Jun 2021 15:31:47 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08A5F613D3
	for <soc@kernel.org>; Tue, 15 Jun 2021 15:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08A5F613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=olof@lixom.net
Received: by mail-lj1-f177.google.com with SMTP id z22so25590743ljh.8
        for <soc@kernel.org>; Tue, 15 Jun 2021 08:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=duvyCvHmd+BTAVZBBLmhVNs0XfE4IjvR7HWUZ6wXD0Q=;
        b=kh5XeM4AlBuNpa8W+eTVOW3BNR+k/sn7xKiTD4y/Kft1yOc0RifDnYBT0UJ/rjsWlG
         rd3Teimmx6QIbNXH88db+ajpGAS8kqBWlNj0kigY1BxlulthHK36+Xet+xYXkGlawdE0
         hyxMSVXgsccotkq3MObcFrECoX8x+N3MWf4oThC1fkCACWCasFGvy5TcYxotpPxiWCcy
         NLBiPUcV2IHBdX9/sC8mpwoFUIfTa56D41mlr2VbBG/9gOcGlI/EC0tkcUVIHKA4prXT
         KcLdS8jVEuwKFKazp853TsjOM7x7mUjIzMEKS+qpgDAfo5bxVKtEMuoU0C8faNV67jRl
         18Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=duvyCvHmd+BTAVZBBLmhVNs0XfE4IjvR7HWUZ6wXD0Q=;
        b=nXIxtly0lcJO6tZYIVl4G/SfpuO4N6S0uckHlOAiyqI7D4wmTyIVjXXHzNf/TL+fpb
         ke9rXtT1sfWpKQ5GvKC8xbT1wF/BlqFABn/0gEX/HpzXYOsz8hDzai4JYu+sfe7vCSnc
         OxK4oMp0HYupmbl+tPKkS1ewEE6+R9r5ZeLIkRf4oNXRu8AxzFpJIEM3CkUOAP7FarBE
         s6/tORWj539ihS0hXtxiwfFg4jgOlgVlcaEIbSRyj3T25YLHE2oizyu0cKih3X3ygBbN
         ad2MsLqMFpAcg8xn3f8bot3e9914zzVhopHMnv4eEdh1S7CmAPJ2u9ySojGBLwEXOmi3
         g08A==
X-Gm-Message-State: AOAM53242tVUX8rA59zCJw/F+Njcupmn44K81LupBzEciS5FXspfSQ06
	xB36Op8JEdOc0/MPcCFp/Nx77Yln9BzB86xF
X-Google-Smtp-Source: ABdhPJzggL7iEcu3ExvaAAL+Yv90Z0v1MCfcoLGjXHfnT4RC/2FQaj7hd5Gg2CkF5s7iu8rnmpi0jQ==
X-Received: by 2002:a2e:b528:: with SMTP id z8mr167525ljm.350.1623771105401;
        Tue, 15 Jun 2021 08:31:45 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id r25sm1152693lfg.246.2021.06.15.08.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 08:31:44 -0700 (PDT)
Date: Tue, 15 Jun 2021 08:24:05 -0700
From: Olof Johansson <olof@lixom.net>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v5.13-rc6
Message-ID: <20210615152405.GC11724@lx2k>
References: <20210608121457.3202430-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608121457.3202430-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,


On Tue, Jun 08, 2021 at 02:14:57PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm64-dt-fixes
> 
> for you to fetch changes up to 9e79e58f330ea4860f2ced65a8a35dfb05fc03c1:
> 
>   arm64: tegra: Add PMU node for Tegra194 (2021-05-28 17:45:38 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Fixes for v5.13-rc6
> 
> This contains a single fix to eliminate an error message during boot
> caused by the lack of a PMU device tree node on Tegra194.

This doesn't seem to be a regression, so I'll queue it up for next release.


-Olof
