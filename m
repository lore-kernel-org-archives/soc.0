Return-Path: <SRS0=79U8=MF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464FFC07E95
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jul 2021 14:02:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11DC5608FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jul 2021 14:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11DC5608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cof0/XO8jfBcbwSBTlmvHSNI7RVz4P6YJ/aM89OhGXA=; b=bcK5Fa84EAv/ER
	DgFul+8ckpddb6FXB+4PW262tWbt//MQP5G2i+hHTf/cSWviTn8UZhfpifjqco4CwWovCU4ZDa/Ot
	odW8sauKaoMIg2/b49TLLIvZl6PnpPu50hXB/C7SPKhDKxsnGnpzo8VZNQx8EqXjDD1hbGkJLe8HM
	yn8DWoCmInzVq3R2NnfEgjmaZwES5cvaNx7I/QPSm8qaqzAW9wgUp37bB3dq/bM20KjFTMb9gUYXS
	IWNeVoy4SyzBnC+txz2oKF9a6KRbop500ggGHLhwqei4uRzNH9ucbidYKdwiszFhIIkhjClGji2pR
	TtxK+KAUTKFY/FGm6dZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3IyL-00Ad3z-1a; Tue, 13 Jul 2021 14:01:17 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3IyG-00Ad1j-GG
 for linux-arm-kernel@lists.infradead.org; Tue, 13 Jul 2021 14:01:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9292F6D;
 Tue, 13 Jul 2021 07:01:04 -0700 (PDT)
Received: from bogus (unknown [10.57.79.213])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9645C3F694;
 Tue, 13 Jul 2021 07:01:03 -0700 (PDT)
Date: Tue, 13 Jul 2021 15:00:05 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 Sudeep Holla <sudeep.holla@arm.com>, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ARM: configs: Update Vexpress defconfig
Message-ID: <20210713140005.h2hsxirhduaho6fm@bogus>
References: <20210713133708.94397-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210713133708.94397-1-linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_070112_617568_DD97EE28 
X-CRM114-Status: GOOD (  11.63  )
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
Message-ID: <20210713140005.JO_zKeprLYPUP8Qaj3hqkOXU1OyL1Y7Y0qLxyfxXpKI@z>

On Tue, Jul 13, 2021 at 03:37:08PM +0200, Linus Walleij wrote:
> This updates the Versatile Express defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - CONFIG_CMA options were moved around.
> - CONFIG_MODULES options were moved around.
> - CONFIG_CRYPTO_HW was moved around.
> 
> Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SoC folks: please apply this directly for v5.14 if Sudeep is
> OK with the patch.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
