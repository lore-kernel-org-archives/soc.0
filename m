Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D07BC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 22:14:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D6360F3A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 22:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59D6360F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kot7S18DSdUE4bZ9AZrPEGihWjUF+T75VpxMxFPmnnU=; b=4cMCOM+n9tsmRk
	aYqFMe88h1CAssNBK09EYlq+FZcsG0ktsw+xPPMy5HtA9LBOoejHL1jlG18J/tfta+qAeGTOrlFdu
	RHdUQOCVccgTkNIYGgFw4XSvGJczoD8Rth5bGImvv/TDubT/AioRGQDRrOScIKpIM4bx6QmK0+Drg
	x8AxZc7NHGteLz7ATsU149IS3KMc5PVqf+UlcJuwqElOy2VcfjV49litDACfhonaSCNCWDqiOi9/0
	nnCMHTP+BIomeYQ+d3e0XzYetnK+zT6h3caBCU1NEY5M9A6cMtJBuX/zlsPr7XfGV1ntDKVZEu/Rl
	xZ/AdnTzX4zTXYZHfNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma3XN-00Aqw9-Oj; Mon, 11 Oct 2021 22:12:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma3Wn-00Aqmt-D6
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 22:12:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A75A061074;
 Mon, 11 Oct 2021 22:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633990333;
 bh=hHn5DDSjq8SpP4KOM+zZtj1bwdwzFAEpyBRm3GVitr4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=doeBgO4AUT77FTMsIrb35CRcDeLoaavwzEiXVewL8dYLLZmN8ySSRiHsvQi+6yDyh
 d+BIBcHGUMM3Q4tPVvRVyY8Hpr9yiuzfIY/IZ9zvqqy62N0pOcHFSjlYTt9zH0ck6F
 o+fr/ubzW69Uv+p+bMJbl2pB+ir47lnDQ50nwu/hTUGA6TWEHD4qCy9DtcIghN6ebC
 Mov3n8Jtu/o/eARdLYuqWUnhsOpg6kZ15R0P6RgFlOa64sE2r/16mS0oD6htC1lYWt
 KTKqPQFYl2+6jnC9gpFxn6ZDuNd01LvUSVAFB0qRa4IndTFfM0sWOcJrYAGLPsJZsk
 mLkpgp8eca26g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org, Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v5.16-rc1
Date: Tue, 12 Oct 2021 00:11:47 +0200
Message-ID: <163399027739.3049179.11971461150420845165.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211008201132.1678814-7-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
 <20211008201132.1678814-7-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_151213_512204_0D957D70 
X-CRM114-Status: UNSURE (   5.96  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20211011221147.WYwbuzXJR-i3knuPnEyxAqrP5NiUiuB2B3YhlhwZins@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Oct 2021 22:11:31 +0200, Thierry Reding wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm64-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: d1edc9865caca19cd0fecc4fda4f90962b4f03c3

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
