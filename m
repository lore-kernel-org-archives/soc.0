Return-Path: <SRS0=owGP=FM=baylibre.com=jbrunet@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AE4C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 10:32:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EBF7823A9D; Tue,  8 Dec 2020 10:32:04 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 991E223AA3
	for <soc@kernel.org>; Tue,  8 Dec 2020 10:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 991E223AA3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jbrunet@baylibre.com
Received: by mail-wr1-f65.google.com with SMTP id y17so6280489wrr.10
        for <soc@kernel.org>; Tue, 08 Dec 2020 02:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=OsOFwwTibWIIgXdSS661vhPH7QqBIoPplM/Uv2VVAhE=;
        b=cllvy0Im44SWAjjkvckWVWMM0igPGtWkKOBzZBRQOzxPrcHCiFXDid/6JbQqnj4329
         7gsGOH7/d88WfyarBwtro7Hy5j0+usy2j4oU0Yat/gdHWnK+mFyj6iFEmYYLMYdD3gMk
         RH8Y3mWUOsZJBXLa6klzyCtMnwRabkZuMbTzkmMei/hWGR3m76joRVqyOSNH8W1EoDoR
         IvoNmD/yft8DbxUDVAS1uiFD2vKlTmfx/plw3lfjUJDPV6+LCI+QhegYlEXcEU/TL0Wz
         BE/ktTZZlOPH5E5FMLC1qFBhNe/b/XEjzifN99aR8NxXJPkrG35vr7eLZNf47Qhyb+Ft
         hEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=OsOFwwTibWIIgXdSS661vhPH7QqBIoPplM/Uv2VVAhE=;
        b=B/WB2BelskZ9dhNeMM7tELt0LCR9aAdftwIoxagNgHW28w3qyg/aEWowmWc+8wBduu
         +fvOTr6iyJAeYD+/tDvFaUC+iNnyNOXTqJ4uCGLijVQgF0psRxlCEcKi3VMgltzqxMXq
         TZs6TDP9HLUJcQ42U9hONoKaLrkTb+7XQhzdOw5Of6EQ4pRG7qMLZdKPICixZNR70+KV
         cyk3oxZdVRzj8dXotdsAdXGry1oKiMBE77BsmipNQjherEkEzlDb+waj9vEx7AzwxeT8
         5P9pBQqvuKv3vWhD/MpnMwyC8z4cx6lXOfZGdKpM49gVyXz+xM77+fUPn5DTWJbOVV+U
         yLuw==
X-Gm-Message-State: AOAM533Twj11mhIHi/zUBm9nS4zeIDqB4KkYpbhGBqCAWell71/4ACQ+
	kpHNXXPKurUjI28rY5OLROyQpQ==
X-Google-Smtp-Source: ABdhPJyxCO0oK+cn308uCVHa8yccW9YgLUb2zDP43HloeDehM6Vcn8G8jB7bTcWsSFU6q7rnh/Di7w==
X-Received: by 2002:a5d:6250:: with SMTP id m16mr24785605wrv.400.1607423521910;
        Tue, 08 Dec 2020 02:32:01 -0800 (PST)
Received: from localhost (sparrow.liltaz.com. [163.172.42.206])
        by smtp.gmail.com with ESMTPSA id f9sm10210288wrw.81.2020.12.08.02.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 02:32:01 -0800 (PST)
References: <20201207230156.10198-1-khilman@baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, soc@kernel.org
Cc: linux-amlogic@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] arm64: Kconfig: meson: drop pinctrl
In-reply-to: <20201207230156.10198-1-khilman@baylibre.com>
Message-ID: <1jo8j4k2qn.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 08 Dec 2020 11:32:00 +0100
MIME-Version: 1.0
Content-Type: text/plain


On Tue 08 Dec 2020 at 00:01, Kevin Hilman <khilman@baylibre.com> wrote:

> Don't automatically select pinctrl drivers, leave it up to defaults in
> drivers/pinctrl/meson, which default to built-in, but are also now
> optionally configurable as modules as of
> commit 9c65441ec823 ("pinctrl/meson: enable building as modules")
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> Arnd, Olof: I missed this in my earlier PR for arm-soc core changes.
> Please apply directly.
>
>  arch/arm64/Kconfig.platforms | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index e4e74e0b5b01..6c4d7356d918 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -152,8 +152,6 @@ config ARCH_MEDIATEK
>  
>  config ARCH_MESON
>  	bool "Amlogic Platforms"
> -	select PINCTRL
> -	select PINCTRL_MESON
>  	select MESON_IRQ_GPIO
>  	help
>  	  This enables support for the arm64 based Amlogic SoCs

