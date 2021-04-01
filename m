Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B6CC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:25:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F401610D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F401610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eXGKcoJWItMq5Zuz4I5rRzfFA/UGJNcxE2ztfZ9y8Uo=; b=RlMyPy3A96XMBL41jjH52o/Bx
	bUrAIVCAqvgQ+KmpTuyblee9D37qAYJJWVg9px+FqPhKps+81g7s+4cuAmKycET9iBOklEojDbBhX
	i8hHiytCvIM/KWiEC6QhWwjj//dST1Ve+pP0Wl3/xNZmZ3yPD7bfpXabUbddAF0ml3D0pGqF0yNAV
	9PO2H0W9L+CHO0nGrA5Uem7FJ0hijJySaSdRCqM6dpMWy9pxNgyCn7KUCAFrq7QhKOyoZGYvIHk+e
	FHfdsY1e1fScZI18FkIT9I1jFf3taW2+IBhCVJFOAuV4Vq8G8zoChQZIIkp5neJL0q+Klr8qbGj/c
	Ghm0oKkHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3qc-00AvUh-8B; Thu, 01 Apr 2021 20:23:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3ja-00At8R-Ca
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 20:16:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0315610D0;
 Thu,  1 Apr 2021 20:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308165;
 bh=jPNGUCNbVcKITJwrKf1PZUGFtBFu7AyQnlQFiQYd9RA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OxcexJ4Epc6tStF3C743sU3DdK0PW8I2qXOTWjjz++zd2V1xCzI53JNPGQmcF5AjI
 +kqX5Oz8ihsXWe0LBJVdeSVntbtaa2RMUIpoQCE9uAmIQFqzbvpIKFpOQJaktDzrVS
 pw6kqylx4oORyObFGPrjjML0Et3VfCp5bZagdk/iw6f+WjzXnkXEAtQY1n/vAPW+G9
 PEWCUHkQg9mwsQndlPX05coMMP6m+BLwIZy/mfJDpmLEM6Ex++lcAMCe8LcdghOetY
 XKuS/G5Ymwr67QHy1s5QD6+o+XOR2R4qMmGF2c4KGLIl7XhxiASOTP0+aKhy4EjZmD
 C/6SXBucKjtCA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Thierry Reding <thierry.reding@gmail.com>, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree fixes for v5.12-rc6
Date: Thu,  1 Apr 2021 22:15:29 +0200
Message-ID: <161730808690.655497.9362657785877242094.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401172622.3352990-5-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
 <20210401172622.3352990-5-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211610_350067_C9F41981 
X-CRM114-Status: UNSURE (   6.28  )
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
Message-ID: <20210401201529.7w2NAoN-Dmz3DzLVdgqgWFicRSiRQnwG1uiCJRzemEk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 19:26:22 +0200, Thierry Reding wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm64-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 520f30feb864e9baaf7bed677892b478ffd10232

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
