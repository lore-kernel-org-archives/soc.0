Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043B6C1B08C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 19:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8E8261279
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 19:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8E8261279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZoCp2Zul9GrWPIM2FHWA3XbgFByj0oJLlqQ3YSXx0+0=; b=0lZDH7mIGLKKjy
	ysve/EnKKnz5DxB2Kcq76m6N68sqDWdTWVWUYeAR7Bix5NP8l8RO+EtrCFs/BtX26OyUCShAf2OUR
	1J2VoQkxOQNJd6MpB7aJFNx3FZrGJJkezNrP81pdKOOju8fuus5UNRNRrKuZWF850rWiEGl3520gb
	7zVEn/0XalsnaUVWF3HbGnUAWWdUw624dUyzIzNqlyCGtzF1iMxa7SAI0icg6e05EMrKYRj0ksLym
	f5w0qPPDohxdYxotWkZvWUkmfaxQ0ceUpABtP57dDCJdhJBcE1S0GP00nRDEWYkwcEb18bsItEC3P
	mv7ggsrscXIBWIoFeu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3kJv-00EV6H-VG; Wed, 14 Jul 2021 19:13:24 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3kJq-00EV5t-8M
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 19:13:19 +0000
Received: by mail-pg1-x531.google.com with SMTP id y17so3473729pgf.12
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 14 Jul 2021 12:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+/banigT8xwzvpxkKLxwlDYN4IV5XsGacUdYBQgT9U0=;
 b=diM5ZyN+GFC6bQxwpa6L5su/wU9F5NOhrQsyBHTo48LsHWaXB3Us8TvXKBffk4pzCu
 oMGeg2nCZOBrWvs3fUbuopYlYGOVTYQGZqDBn5obMrurFTqg3vcAI76iIFQcHpyK019R
 BDOcv8WeWzMh1TPAwJfz9Ggq5xKNt+FXraaGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+/banigT8xwzvpxkKLxwlDYN4IV5XsGacUdYBQgT9U0=;
 b=ZbXE4adqofvQ1oZ8pg3t0EpxUjdQv96MQp0ShVi3FCIhJI6QuN2gKy3xrSQ+FlZwS8
 EgrvpxqVV2TSLjmrKEnVDWFs03rAOjsZfntDhPfErHwSAo6ceMsHgl7N0nN5DHqFomEy
 A5rJIV+OXRY56wnpttA/2n20+l0oEKjEA6Yn3DJaI3nCwTBQlohzeg8ePLBOecUJSCTr
 9XB7uj2vIfNwT6h8s78x5+DUeTW8R6vqiP6mjD6Fe4NUPUvn3zp4qu0wTDszDyRYEmE7
 AqOXWzRqEjEVWFfX4ePAZccFS1UIJ3UIE73EQV7mL6SUaEjmGJduArDWZjzolcO0YV1V
 Ljhw==
X-Gm-Message-State: AOAM533de8WMDbH7fD3lDB5BK1uKp3jE7AtsLlfRWJtqXfh7NMyo+q6I
 udsRj+CYbSzbo4Vk8NB3kmrrAg==
X-Google-Smtp-Source: ABdhPJxc/zJXr7P3oa6w3B9/04zCMfiSpX9rkNPBLeFAfwHbasNyZk/owTSD8VytUuqZcFVG2edqaA==
X-Received: by 2002:a63:e350:: with SMTP id o16mr9415540pgj.98.1626289997501; 
 Wed, 14 Jul 2021 12:13:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z12sm2820786pjd.39.2021.07.14.12.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 12:13:16 -0700 (PDT)
Date: Wed, 14 Jul 2021 12:13:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: configs: Update RealView defconfig
Message-ID: <202107141213.BC463E00@keescook>
References: <20210714090040.182381-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714090040.182381-1-linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_121318_337971_64E63944 
X-CRM114-Status: GOOD (  14.01  )
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
Message-ID: <20210714191315.0Kak5eq9-qjS7KEmnFD7NyV1yU1rsYJ93EYfmsH15SA@z>

On Wed, Jul 14, 2021 at 11:00:40AM +0200, Linus Walleij wrote:
> This updates the RealView defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - The CONFIG_FB_MODE_HELPERS are not needed when using DRM
>   framebuffer emulation as DRM does.
> - Drop two unused penguin logos.
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
