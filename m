Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468FFC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:26:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14B3260E97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14B3260E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZWkbbZctm+TUDBU2/aLGbo5QS9z3g/7OwnDYJhjoSk=; b=FRVPJIxfX5e8BL
	6Bieqr7ejmHcC18noAP34rwBzYpcOVseC7VR2WroJIK626rP37fgT0AOB76em0y7Z+f2XkzAN2/nu
	Kza2vY6fAaEvttacfpGODKvth672mBOA7Jd23V+NrwXYD7h+kiwoibRavG9aRLXsxTh6lA5qRhIpu
	1Zej48i2YE+KtdLbCCzDF8+yLFx+5TgC7cPBYN76y1vYsrfUPA0HPlI6Rv0cfHoU6kMKgkdER+KOQ
	DueHx5XOOYVuM5g7+rQa06i3nIC1vqP9QKFfwVCiVq2wIDgQm7zBc4wFbcFkGEEWkn/z3RZO0Oe1S
	0GI6MisjEG4VHOfVV17g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFk5K-000LZ3-9U; Mon, 16 Aug 2021 21:23:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFk2y-000KWQ-NT
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:21:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E22460F11;
 Mon, 16 Aug 2021 21:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629148888;
 bh=aI8efoaCxMX9buTKx1yYutE/U7M6S1HQoY4SyxY6B78=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b4x9gQRH/3munsAxRLPiRFNFhxEeCJ5roKcBDagdYetGKp6s0r2ZzL1dr4HpBCoIy
 2FHhYfXVM/KBc8QcCH/Wajn7HhvkGum16CI/NzLePFh0kOlVd3g5USno/2r3lHAU9M
 VLmrl7Os69NUxvEvl0EyVOv8xmcjPeYN/KPM//4+kGHOGHjvjmoi3V0gX4xNyGc0qR
 59CV7vAhe3/yp8oyHghYYFfQFJfdnW5dFjjAuVo11BK2I8tfli9akGGrau3c6NZl6a
 JZBSzxCEpzMfy1EovwcniWb9PKBTU/RNL3aPt9+JC+6OJa0s0X7oM1j6f5Rwhurqaq
 uKMVYKfcgZW0w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL 2/4] i.MX arm32 device tree changes for 5.15
Date: Mon, 16 Aug 2021 23:21:24 +0200
Message-ID: <162914887787.238436.2285917910205643269.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210814133853.9981-2-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org>
 <20210814133853.9981-2-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_142128_849940_047395DC 
X-CRM114-Status: UNSURE (   5.73  )
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
Message-ID: <20210816212124.onF8fEd3yGKh_jBTFVbbXQ81pxEwvAn_kT7CPQGOjJI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 14 Aug 2021 21:38:51 +0800, Shawn Guo wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 9b35ab1e314c3f563f8d6982c0a8f2c8964e4a36

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
