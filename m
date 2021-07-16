Return-Path: <SRS0=r7Jl=MI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA2AC12002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:30:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0928F61374
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0928F61374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7hCHuh9lzVjtfJchfMgfJE2LJF0D6XCWSzbPy8k7N0=; b=OGcJIeKB8xWd+I
	wM9ibzE0HmJTjQiRxv0qa9iFNDAZjS2K4cLca4Aass0rAhdfbaaAUQxZrYyJd6SEtj7MJYGu10QOP
	N6/RzKfKtmc9X/GbrPeL2722E2BYvO+UCB+c+oIMHsRwChzt93xAsqJkc62Tt+dgPwOga6Y4SM5KK
	/0BvHB1YI4ysF5tratlI+MKkEY/i/q4NVuhUXL/85bsdd+P/EGXOplghl9SxTMLtJlsL7rnJ0l4xB
	tA4BzzitWd2+YOPCuj+pbHhwZ2juquYDaDic/1H/lLL8GZY5qmfNwOREIbN/OKSev3fyABESAh6+D
	kEOPdLEsJWHce2jpX9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4VNY-005JAF-VK; Fri, 16 Jul 2021 21:28:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4VKg-005I7c-2O
 for linux-arm-kernel@lists.infradead.org; Fri, 16 Jul 2021 21:25:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56B3A613F5;
 Fri, 16 Jul 2021 21:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626470717;
 bh=V6so0Ce82pybLPi5St9R8aT7QbChZQDUHRQyttwxitc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bbucqlljEZY3cXIchAmyn5CPFhTuMMlP9gR1rS18joY4+z43HJBImzI/JmpYqXSdt
 VduVhS/pd6wLKqxuTR+3tvLZYf5tmm1G+u/NcQQ14zPLhS+/0AXukMj3uOkWq5Zljx
 RWgC3818SDo4ftlz6dqYEDedxkKdutGAYP8xOSePU25HbrIR/n9OcmFDWj2nk3PM/5
 RWS4GnpXQG0YZFJkYXFHY4U1IVZdtlGWPUykIiI/DbEPvchvqlsqy5Xefz6FyEBMd9
 dvNyAjSI7s44MqoO1PXqHrz9GlSo149dDZT0NzdtUVMii9nMO3hcy28kJWRZU+jBXm
 twAgTO7SaiY5A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: configs: Update Versatile defconfig
Date: Fri, 16 Jul 2021 23:24:49 +0200
Message-ID: <162647049954.3478428.48874703187519246.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714081819.139210-1-linus.walleij@linaro.org>
References: <20210714081819.139210-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_142518_198828_A2C17752 
X-CRM114-Status: GOOD (  12.13  )
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
Message-ID: <20210716212449.XJCUp8TSjI8KTW7NdJPlEiO_87S_1wfTXFgzMDnEAlE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 10:18:19 +0200, Linus Walleij wrote:
> This updates the Versatile defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - The CONFIG_FB_MODE_HELPERS are not needed when using DRM
>   framebuffer emulation as DRM does.
> - The Acorn fonts are removed, the default framebuffer font
>   works fine. I don't know why this was selected in the first
>   place or how the Kconfig was altered so it was removed.

Applied to arm/fixes, thanks!

[1/1] ARM: configs: Update Versatile defconfig
      commit: 850d8ec92735b3d58b81363c4ae29932a2ebbabb

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
