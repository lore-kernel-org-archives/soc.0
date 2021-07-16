Return-Path: <SRS0=r7Jl=MI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70875C12002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:28:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42DE261374
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42DE261374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfSZIZ40zyC9yZpF+cAGHj3B0aWIanbAU69eANHccXU=; b=KRYtZ1rIwBTODQ
	u4wLlRiP8+fhGrnyWvIDXqO3rHiUX9Fj7CFvQ67Y5OyI45gmVrgpeH+z4zOaQk8l+PB1ZpckCf8dF
	XprhdxZfNQVHq0y/Tgo0Rrt+gEwvXF/f/1BnJUsh+WjmKIhRLoldTximvAasszgfN6vRxHZK0PWXh
	uuIkE8CxwoeBmpCUhaKcPVxfFb0V3NcNqQvzbbHmTYbLPK9txh5Uz4ZqCERDwz9D2mBelwC/m6cwb
	MDrh5HkqAF2mSryw3xDKQduY9n/1fBK7JGAzJHEIP6HHJR8uaTEbFCmobuk4wyywPuaVzrnsLEhM7
	qMJNgtxr07Y9YsvB5NQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4VM0-005IX4-FY; Fri, 16 Jul 2021 21:26:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4VKZ-005I5J-Hw
 for linux-arm-kernel@lists.infradead.org; Fri, 16 Jul 2021 21:25:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF116613F1;
 Fri, 16 Jul 2021 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626470711;
 bh=Zjg21wHJqPHvmV4tFZ4gJ3tQUfYDKYXxlNWnHU9YtH4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D78NXYYWGLHrRzrUCP0RfpgYS/ThlRF5iY2tP8tD/zFxc6W+F9EQBQ1tsjlQ0YxQa
 p0JjSRsiqpfTHx/7FYNDf2mb61PkyawYi2n87JQNlzIpLKpR4tzg2sLkYiKmNKcpmN
 f4rmmKWsxM3imSwTAO9B8MHEyhG+CasSHYMpJ0QmQBKmLHO5GNJhjZCjuA69j5pxtg
 NhjJgAnFzvrBtxVQXqdIGobKVc13TmNfIPSL+Wl6zQbXYpMlJLv7vk1wCtHOtPrH2f
 ACdzUyzF0DKaYEl/aUxFxR2+UbtXKpm4PEkasNYmfr48rymTenU0enGkU+pwtC0nvm
 qqerByig5SlhQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: configs: Update Integrator defconfig
Date: Fri, 16 Jul 2021 23:24:46 +0200
Message-ID: <162647049954.3478428.6417418910198939224.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714122703.212609-1-linus.walleij@linaro.org>
References: <20210714122703.212609-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_142511_655781_0D6586C4 
X-CRM114-Status: UNSURE (   9.79  )
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
Message-ID: <20210716212446.xRC07B32GW9Vl3J0_0dn-50XVp66FXvReq5spINp4i8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 14:27:03 +0200, Linus Walleij wrote:
> This updates the Integrator defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - Drop the unused Matrox FB drivers that are only used with
>   specific PCI cards.

Applied to arm/fixes, thanks!

[1/1] ARM: configs: Update Integrator defconfig
      commit: 2096d6feec8359203de406c424242dcb977fe1d1

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
