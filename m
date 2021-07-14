Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71634C47E48
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 23:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CF72613CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 23:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CF72613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPDvNrrRQ2UxojkZ+lrXXxkFVFP0eBVSXOqHBniO5gQ=; b=NLTijMLiu8GTbs
	d5skyEL+QZVp9IS2LdP4TkWuaoovf+9Rr73ybxaEo8qup9B3lrWqcRGPu21IiFh5pzNq2i4vFQ4cY
	ItWCA/b8gC+wDs0J4WHehcopkYrHezXESWSsIxL4daqZQiPCT2rQiVOYZ8CB6SWLgy8OEl6bXhFrG
	NLzKYPQ6l8CW16qspaEXAO+wZjwxb93rbeHouaVasdw3mSQsE4tuuZWoi8enxLUkUpVweGAPjopgJ
	ZOMkaY7YRdRWSzVwlxlNTq0uR7lJfJyxaGY4lVxMCAtiVt06r8rhaQLY3OeMVvK1PU8iro916004o
	7TowCsIzBI/n6TtIg0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3oe1-00GQzN-3W; Wed, 14 Jul 2021 23:50:26 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3mDH-00FK9B-H2
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 21:14:41 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 g4-20020a17090ace84b029017554809f35so4623164pju.5
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 14 Jul 2021 14:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2L8P48B/qNZSFrdMjGPaBmF096bvTXbdUS5+LE7oK18=;
 b=cCkDHAVWt1k/ZvGs1SxWD1XLEmLBb2Dxa/wpS5sMZugJ744BBpKt0SAbWDKhR4Ew5V
 9dnWUOVnxTGAA4+QDXlkAYtSWWA7v8HtXoiJuRgj+g1JBnUc9fR5Ei0ev0eRnDBCV3wc
 qbXg/GXviBAtPLZ4JebCI3rAxNSQP3aKX6c9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2L8P48B/qNZSFrdMjGPaBmF096bvTXbdUS5+LE7oK18=;
 b=YgneQeyAb97IjA8IV30tfiCFl8Qoi8gU3SWl0BjbAZXrKo+Ah70P4+icaqDlDQmX3N
 aomwttMGASI3ypRGPZXiFnUIn18bwNG7dTc1Xxqyr7pQVnThRkBt0PWIPiOWFR+1fiZK
 tvkWTY1bQW5hfos6Y205zHUVLd9Fe2iujj7zdxdT0gCZthMG1NjdlTw2VG+OSOkz+0KU
 gDtxXZzIstsbvmyr40BbvUwKoQFb0pBa20jSvBOavI2nXPEsPh8bA57U+R7yS4FlRcpO
 LmDnkBq84cw2djjxAoTuRQanE8J66+aZPbQn05j2lNiJSqQeNXePHFt14xkRk4vdiuTp
 vHBg==
X-Gm-Message-State: AOAM5333IuB2uWKRl+ESIlNYD/NDLe8cRU+9LY7/myf2vCBc2VaRoajM
 56o/W8UnaDaaLEFDI3x/L5p+ZQ==
X-Google-Smtp-Source: ABdhPJxpQFIW0tsz0QOxzj0Eb98yUmv7j3UaoTVis3BQdr0cVPAZaCCbo0BvuOnKslo/XNBl/b11PQ==
X-Received: by 2002:a17:90a:a008:: with SMTP id
 q8mr11506293pjp.217.1626297278344; 
 Wed, 14 Jul 2021 14:14:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a22sm3803190pfv.113.2021.07.14.14.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 14:14:37 -0700 (PDT)
Date: Wed, 14 Jul 2021 14:14:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: configs: Update Integrator defconfig
Message-ID: <202107141414.C81186D437@keescook>
References: <20210714122703.212609-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714122703.212609-1-linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_141439_612480_E2C6774F 
X-CRM114-Status: GOOD (  13.62  )
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
Message-ID: <20210714211436.dU5CEYw0v1PTS__2ggguX7j-gn1IBE10hKOuy-vlAP8@z>

On Wed, Jul 14, 2021 at 02:27:03PM +0200, Linus Walleij wrote:
> This updates the Integrator defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - Drop the unused Matrox FB drivers that are only used with
>   specific PCI cards.
> 
> Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
