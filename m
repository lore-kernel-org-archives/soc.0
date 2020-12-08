Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E8BC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:37:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC90233CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC90233CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IHAzN2tyoYUAJa5sg/s7Y4h59pyIgrBBaBpNPYtfP2s=; b=qFaNva9k5OalDcDCD1xPLBsnp
	ikjNNG/YEVw1QTD1T6Fzj58xYUzSf1fwt3iI/sDdeRa3XrpJLUJg0OzS4AlgwJk+y9CVIlYRXgJww
	54zB1T8GZvUKZukfoSUpts4i5oI9mILbLKAb2auj7Uf9gGJV4uwUFhDle04a11aTam/ZBcpqsVg8n
	KvZDGcK1MF7qNuBNWNYk3ydGr6ODsLw9P9arRT6ToL2sOdLxDX/mVvwdzYLL2rTyZ1Ppib1qGV3nN
	OSwElqVFdD5OD3pV+rnI6t6sBTcwXSfPrY6tjgQX6CmLaeBAD+eglIo7daZFM0dpus++W6YSFmtJU
	zEXz7pE4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfyC-0001ay-K1; Tue, 08 Dec 2020 16:36:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfxS-0001Ms-0C; Tue, 08 Dec 2020 16:35:23 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: arm@kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [GIT PULL] Rockchip defconfig64 changes for 5.11
Date: Tue,  8 Dec 2020 17:34:50 +0100
Message-ID: <160744514199.359082.17164148059956859156.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <2750818.e9J7NaK4W3@phil>
References: <2750818.e9J7NaK4W3@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_113522_222379_198DAFFD 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-rockchip@lists.infradead.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208163450.P1rYXffxuh7RWykofc6pXWwKYJ6CADDRTcbMJNfZe-8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 06 Dec 2020 19:32:35 +0100, Heiko Stuebner wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-defconfig64-1
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: ba2f9a5fbc38fc7d82b523b3674324b8ad6d4be0

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
