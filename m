Return-Path: <SRS0=r7Jl=MI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5CFC12002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7032A613C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7032A613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVX69r+Rsxo7krfXR9PahWpFPdy1fj/SGGuWG+IL8Pg=; b=geQkhp2blXVX6B
	ACUlQhkgbZZaiZzoo+r/6ilCJF3ajXOSJ4bgntiBtTJWxDwDDtLgI6G4R/XlUoBvExHYYw44oDH04
	Kyj3fVQ/TmsLtsd3SMuHfmSmqiWeU2oKlwBC6WFRmAa3kPXcLLNm4YsYJCSEJMkf90f8tj1IMRwJ7
	glzDGtmq548A9MYJzzFU66ZysgA0mnLEwyLC6i5LXvfz/BH+xd2BjmJIwLmIXXIDWTu5cnHQF0Vhz
	MHqQVxzQ+SejvmMa/BuF83kClhBJXW4CCfAywjpqXtHMdPyjJvqMEEsPOFtCknd+0M6CQXnX1hYjC
	mA2WnjlbLULzyTmjZj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4VO8-005JPQ-FQ; Fri, 16 Jul 2021 21:28:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4VKi-005I8L-9q
 for linux-arm-kernel@lists.infradead.org; Fri, 16 Jul 2021 21:25:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E905613F1;
 Fri, 16 Jul 2021 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626470719;
 bh=TE8O2TmOc+xTJGZBBVaggLBG3KUpoN3259hHM/XwCbI=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pkC+hGWrTGX9fm14KgmaAeMcisjCuXBS0KveuKMRdOn1DYbGlZ9/17+WV6WEFhgN9
 38IFbsEFT8e4ZvksgcmVAcr0cZ2q1XNddbZ2jRh+QmTzvFd5Hyos2Sw3d2gtQAWYix
 4hymnrWJeuBpA9kNziYi76v5YP6DV25A0jXPZY3rc9Tkslg4teAdjB0RHZvdvSAiLU
 CPTw7mbw5btedR/aF594BwATgGXLa7cb09Xn3+gaUiDE0F7praWhKMIOJQq4LJ5Fpb
 iVIphbTfJIti33E19MW9owHJj+cfQXxTfYQKJZRFYSrggWHsGrgVwfShf38nQc4R2L
 18FoD/MI3YyOA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-arm-kernel@lists.infradead.org, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ARM: configs: Update Vexpress defconfig
Date: Fri, 16 Jul 2021 23:24:50 +0200
Message-ID: <162647049954.3478428.6613741918159695075.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210713133708.94397-1-linus.walleij@linaro.org>
References: <20210713133708.94397-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_142520_403898_F6401B25 
X-CRM114-Status: UNSURE (   8.80  )
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
Message-ID: <20210716212450.pFXgxe1fabyVsnLrjfOaFRGYqD6mN1e_vaQOJe0hkOo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 13 Jul 2021 15:37:08 +0200, Linus Walleij wrote:
> This updates the Versatile Express defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - CONFIG_CMA options were moved around.
> - CONFIG_MODULES options were moved around.
> - CONFIG_CRYPTO_HW was moved around.

Applied to arm/fixes, thanks!

[1/1] ARM: configs: Update Vexpress defconfig
      commit: 49e7757a73d181b35851cb01b5d285888014f8b2

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
