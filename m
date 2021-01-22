Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE02FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 23:06:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76F7323B51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 23:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76F7323B51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LzAsEAFV5pXrOi2wGY1xmxq0bcNA7Y0RWFbxEWy0oUg=; b=Emrm5XU0ySThVY/uedqeURFyr
	PO4UuUwH9AkJNJ5cWd9s0OST0lg30USmu00fmzKm3TRZRBg32ajJd1PkVsZfCbIRo3SM4uyhFhv6v
	YOyrbwhSAW9o4TJHet+zy1YH/+tXdqiAEJxoyJGiMIYFiJZnSUxv7EeTOSNDqx5EFe+kSmjmyLYAd
	KjLySjiBbfxh/U1k/Wpr2q9ottBceGSfyuYH4y6QjEhjRC7J4LjPrgV+59QngP4p7L7PbK+Fe6lxT
	rMtZeCQ1UNGL49igTmPVTbYNXibBdxEGCmQMqQVlXV+lsoQy3v77CJ7QJ/zd+azsH0BZVRc7Ezpf7
	7089S5QJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l35UA-00041h-K3; Fri, 22 Jan 2021 23:04:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l35U8-00041O-Ff
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 23:04:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAAE723B00
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Jan 2021 23:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611356695;
 bh=iv3JQtJXXyDMdrMinxn8ucBa400MIuwVc0IKsY0zPig=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=tQMSotNJYlcz3t2XzW81grZhaPSyrZR6WLFduaZY3i8SacqwmhB7tYd3N59r1MZTU
 LH0OikEfN62Z3chTxW0eVLSBeZfqMa3ghUdjAf1PxZw27dhR8VowJcz/fIddo62wib
 ZGKDHS5mdBzwtVjMBREY1oGRNG0vglqTn8wK/G6dk2Bxa5fMWm8Q6hCRDdZbDheX98
 jLsHtkEzOBMFlbz+aqwpDzjUl3QLkZWecRomJH4+9efys2pAvjjfTjkUtwhzIcr3Dz
 tvPx4Syt/TqHB/7JJWf5z4PiQPtNlMkVa+crOqCq6Pv86xtWghC67uYiS0dRFQhQfp
 S2d8wE0lNQb0g==
Received: by mail-oi1-f176.google.com with SMTP id q205so7798563oig.13
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Jan 2021 15:04:54 -0800 (PST)
X-Gm-Message-State: AOAM530TM7xZWl7Cdejp1yrD6Qx98bM1Iez8eRIAelOizAacFxBkc9G0
 K61dtqp58w4WDmFjjc01vx3gMKl6sNbdWjII6DA=
X-Google-Smtp-Source: ABdhPJzVwEf9zIaoqHXWeCSJw/eGuoRfATYED0ebRyfTQcq8bKNWds98uWZMBtOTTB0zZ6L+Nil5hdtGoDXads0y//o=
X-Received: by 2002:aca:eb0a:: with SMTP id j10mr4935968oih.4.1611356694116;
 Fri, 22 Jan 2021 15:04:54 -0800 (PST)
MIME-Version: 1.0
References: <20210121203302.3639841-1-f.fainelli@gmail.com>
In-Reply-To: <20210121203302.3639841-1-f.fainelli@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 23 Jan 2021 00:04:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1fk7vLa5z+VWA=TCXhfYvmuiv=ii2UnR-a0=WOsHhBRw@mail.gmail.com>
Message-ID: <CAK8P3a1fk7vLa5z+VWA=TCXhfYvmuiv=ii2UnR-a0=WOsHhBRw@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Broadcom devicetree-arm64 fixes for 5.11
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_180456_613643_24ACCC13 
X-CRM114-Status: GOOD (  13.97  )
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
Cc: Bharat Gooty <bharat.gooty@broadcom.com>, Arnd Bergmann <arnd@arndb.de>,
 Kevin Hilman <khilman@kernel.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 SoC Team <soc@kernel.org>, Ray Jui <ray.jui@broadcom.com>,
 Olof Johansson <olof@lixom.net>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122230437.9Jbt9ffR5j6jFjtgs-u99Y9sCekZSlGtD-_TlD9ewH8@z>

On Thu, Jan 21, 2021 at 9:33 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:
>
>   Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/devicetree-arm64-fixes
>
> for you to fetch changes up to d68aecc153ea4bd55ff32f083f05e9bc5610ec78:
>
>   arm64: dts: broadcom: Fix USB DMA address translation for Stingray (2021-01-20 10:45:56 -0800)
>
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM64 SoC fixes for 5.11, please
> pull the following:
>
> - Bharat fixes the Stingray USB controllers ability to DMA by providing
>   an appropriate 'dma-ranges' property for the interconnect

I cherry-picked the commits from both of these pull requests onto
the arm/fixes branch, to avoid a backmerge, or having you rebase them.

     Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
