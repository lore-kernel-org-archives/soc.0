Return-Path: <SRS0=uLNJ=LJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A045C48BE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 19:48:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F13D461246
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 19:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F13D461246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHEj5A03fthrBk0UF78PTZG0l+m5xJFgDYqcoDkuQsw=; b=Y1o/B14ZDE4P08
	CD/8LxCwQ6PjNA6l7wN5UWavY26C9XS41+TI3utTGcwIXGRtpI9ZTH7aSro31hEFWW2YMHpbwMaqi
	oTrZY94+UUXIb2ce1V/iUKKyJJAyfkkVZoMPPAO9TkVPm/MP5DwQ9xpgn0q5SR68bx5C9/FIEm5TW
	Nca/iU6sVjPZExuYVYdECyYu0CBBhSCWAZTYn6LbEpGPxfYXllE4SqKmEBLE4JBlOH1Pwq9SJruoF
	5uhAoyBdTtnVrNJAcA8s62IWkx+/8+lk7UtME1ExhU23fIsgDOtzzG5uteUqBhfZOwQTNcp63NpAw
	40STM5r9FZipTPJDSQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltF0x-002Yk4-Uo; Tue, 15 Jun 2021 19:46:24 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltB2Z-000zQc-GL
 for linux-arm-kernel@lists.infradead.org; Tue, 15 Jun 2021 15:31:48 +0000
Received: by mail-lj1-x22d.google.com with SMTP id s22so25637944ljg.5
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 15 Jun 2021 08:31:46 -0700 (PDT)
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
 b=fYZ3Q3lYy/fcOFWCUjgPlfnCE+riZQY0SPBRbfw82bwq3MPwLzdLpkFUt33hBVCGWx
 rDprlYdMqVBIG64mIlKw94UX/GrYA7M4XQ0MXY4GMDihGVWh2QvjgxSSRzXu7KjdGuri
 cejfvDZ2Et/aS7lbGMAc1p684kQ5ek15rAiZf9j7lM2TURmRcgwYaOhLgx+5wijZLxas
 ydsUzlsOeqdIjTAazv5NV38fUnCH/kTMADRI3HcSG9WyfNx1c0/f1LweOxzhi2OGgJEY
 fNMFcgcRDtAvsQt956DO73dcUGaLKozm5AjaT670+wz3e6tFegQU5WghOUmudOSczQeW
 aTVg==
X-Gm-Message-State: AOAM533wsUogYtKehtKbM+JH0KZxjj+KZIrDy7/ivEYy/Fxq+e1fVtCj
 l7c1KVbdbJoWTbfoJFMkkhJCXw==
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
Content-Disposition: inline
In-Reply-To: <20210608121457.3202430-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_083147_603399_A1817A6B 
X-CRM114-Status: GOOD (  14.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210615152405.q6oGi2piT8pDLM3TIIvGvdydXSC91wHzjPy2NaWb7Gc@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
