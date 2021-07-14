Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04182C12002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 19:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C57B2613BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 19:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C57B2613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DA5RTtK6gP+dq4CpPFw4ooq5vELChJXKSrvFcg9uEA0=; b=J3kGhJ+3HwAVyH
	nRoy5dsTbJSASRDKuyWqFuExaXBePiekTyNRnTS+AJgtqQxB4rg5Hvx9EbqvijEOZGPxhGEeOXr++
	P5xegPVQdDi4gKB7EXzhy+61F/3ggnP7vc78003n2Pyf6rkqCgeEnPTtQxeRsDn0stFVK9C6q0tim
	GdVtetuRwdi6y95qANsDrZSaxeFs/sxeB/8pb2yS04t5aCNmgSJpB+Kc/5tj0R+XjALgepsXR3ZJw
	6PbIu02nHbHfrr+fvMdN5devP5BJt4x5YLDoW9VmBoP4CwcV5+VDgLrn3yo+kJENUVogXdBCeijkI
	58EAofQsbyu4m8mG5X6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3kJl-00EV5l-TV; Wed, 14 Jul 2021 19:13:14 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3kJi-00EV5O-4Z
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 19:13:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id n11so1959214plc.2
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 14 Jul 2021 12:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tq5Rbv8bzwrDDVrwhgPg4WPczUOrV+tBerddQbsxWx0=;
 b=bPOVbGgrvLLMODNizeKM276JiM3m/EbAyoGYd5cSE3Pv6J4MCTsQVvXXnfRZxSAv4u
 Y6lFuUbaPvumFzMNZkb6jiug9Q24tKekLHXB5EZQqWlQyxZJdLGVR6QQMlqPstO8vvdX
 bXcNF1EC9+/tuMxdP6D9951/B9AdWkOw9DRmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tq5Rbv8bzwrDDVrwhgPg4WPczUOrV+tBerddQbsxWx0=;
 b=uG3V8KQWvdpDft+LdjqiBhwR6CBxKE/7ohPdvJdjhjK8CM4q9na96ePqZABSJRN1Nu
 2zrxuiv1BRhxakvLNC9I71SuZfLHlQjDyeEN7FevBOjGjWeYqi9qA0TYYhK3abA29t3P
 DfLe20TtDODJQyPTokC+iXnUa14pXbKMKXG8rNkRVqIuM6OQuF3QWqgGHlLtUGbyOW7Q
 wsj2qHLtOuaaGPaep2/MD83nyya78rXz15RSYEXoP0AIUD9Fs0oQ3oCPpy+7hL57F67Z
 4dG8B8sXzCX+rnBP9eF18dIQnR9/rgNjrSxstH9iv28KpjeMOF/ioq2qvsVmBf+sBN+y
 fHBQ==
X-Gm-Message-State: AOAM531iVqk1btsY4Aho0m+KVnFEiDnjVzImyeZu+f4x04x+Eqy0eapm
 OKKWb1fPJHmpyTJGFxn2LlaR3A==
X-Google-Smtp-Source: ABdhPJwq15ih5GXZEwbgl+i76yyWHxGb9zn8gsjUpX1l6FrJH1ZpIzH89Q2H0ccCDLkUwl5HzsX8Gg==
X-Received: by 2002:a17:903:2c3:b029:11b:cbb9:edfb with SMTP id
 s3-20020a17090302c3b029011bcbb9edfbmr8651889plk.12.1626289988382; 
 Wed, 14 Jul 2021 12:13:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x30sm3655844pfh.126.2021.07.14.12.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 12:13:07 -0700 (PDT)
Date: Wed, 14 Jul 2021 12:13:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: configs: Update Versatile defconfig
Message-ID: <202107141212.757559237F@keescook>
References: <20210714081819.139210-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714081819.139210-1-linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_121310_237223_4E0F7C3D 
X-CRM114-Status: GOOD (  16.43  )
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
Message-ID: <20210714191306.BtyywAOf2ps7T4jzlZQMcjTVflKVxnXO3apUPZSlI30@z>

On Wed, Jul 14, 2021 at 10:18:19AM +0200, Linus Walleij wrote:
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
> 
> Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Ah! Yes, thank you for catching these. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
