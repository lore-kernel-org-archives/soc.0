Return-Path: <SRS0=ildN=DG=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4A2EB64DC
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 06:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE7CEC433C7; Thu, 20 Jul 2023 06:23:57 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BBA9C433CA
	for <soc@kernel.org>; Thu, 20 Jul 2023 06:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1BBA9C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6b9ed0831bcso348073a34.0
        for <soc@kernel.org>; Wed, 19 Jul 2023 23:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689834235; x=1690439035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dggPtmEGP3dy2drILjs+2wJcfDExdIGBOAMBxwJ/ru0=;
        b=YGJo5uBkh5DK+RbkpdeUjv9QK7FaD7XvAYXUeR8crp+cMG8rVUsJQYuSAi2TmQeBCZ
         JHEcnBp/8I+cpDoScwq5uHKwShPkspV/RKRLU4VDDBSpQQYkydrOpKqGrXIWaU/ziPqU
         Mj/IuZF/4PLn3g0sijzuJZcY2fTHzKgIF61jkGQXl4iY2xXtj4u+4NhwpB68s8pkUUuv
         kU5W2PfOrQrt8qfmRf4Dbn5VbWi5TvoRh4792XAbFSKRd42qKla5i6LNH7zJBk3KORBV
         38g1MhbYHYTHYxumQphc9ug0CQH7PBPW5QtYMSy5bixxXAtSJ/dPB6esGijXz1txBW8M
         RF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689834235; x=1690439035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dggPtmEGP3dy2drILjs+2wJcfDExdIGBOAMBxwJ/ru0=;
        b=ibvDqx0hWgoyu457Q1O2cUR08EoAxA6q8kYhxIqFP5Uo0HUNjpoxxQwRa81LXuc8of
         p+SCqSKUL5fMaQgskx2RKzsSK47qruO571T5fU2H2NfODfyLHp1DoXV3n85xdqQXrs0f
         v+Bs2UqgT6/4PnvdqF4n58xopSztCLLzV5dzr/URUAJJ/u2WNHbOd/Q29F3QNP9sZoqu
         pQM79QuV9hQlj6228HwLyhHxB+opovG1yAOU2rr419aiHQyXRor1Ehg3iwLdh7v+swYL
         +LV1FQYcahH2cVTfiqhG4G0NlQdJqhhQdEvt7jFvioE/rn5Xl8V6W+E5ZDohQp41ZSUR
         Fgxw==
X-Gm-Message-State: ABy/qLbZOIbLtSBFygr5RMRMB5kB1FGTjLIWsljxrEbKB6PzDIMDi+iL
	A36AXpbrtIf/Pe8I53EAldMcdg==
X-Google-Smtp-Source: APBJJlExIjV3DaaCX+IY2BnB8DwXP9PsmHQe+SGYNQ77zENXqJRz7/CK2GToA7iFfw3voNH5JAqsbg==
X-Received: by 2002:a05:6870:f144:b0:1b3:738e:a341 with SMTP id l4-20020a056870f14400b001b3738ea341mr837573oac.46.1689834235120;
        Wed, 19 Jul 2023 23:23:55 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id i127-20020a639d85000000b0055c656ef91asm252677pgd.77.2023.07.19.23.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 23:23:54 -0700 (PDT)
Date: Thu, 20 Jul 2023 11:53:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: spear: Explicitly include correct DT includes
Message-ID: <20230720062351.mc4lqzckgqoosftl@vireshk-i7>
References: <20230717225414.3210914-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717225414.3210914-1-robh@kernel.org>

On 17-07-23, 16:54, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/mach-spear/spear1340.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-spear/spear1340.c b/arch/arm/mach-spear/spear1340.c
> index a391f154eff9..70986ef6c877 100644
> --- a/arch/arm/mach-spear/spear1340.c
> +++ b/arch/arm/mach-spear/spear1340.c
> @@ -10,7 +10,7 @@
>  
>  #define pr_fmt(fmt) "SPEAr1340: " fmt
>  
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <asm/mach/arch.h>
>  #include "generic.h"

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
