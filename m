Return-Path: <SRS0=fD9V=FF=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C10C64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 21:20:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 32505207FF; Tue,  1 Dec 2020 21:20:46 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AA4E20705;
	Tue,  1 Dec 2020 21:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AA4E20705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-ed1-f65.google.com with SMTP id d18so5598482edt.7;
        Tue, 01 Dec 2020 13:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eJ0wb6xnXrJobv0CqBcs/xjzvsOoM4mG3SkfXYuB3W8=;
        b=A8EqEiFNuzKKq17f8ZwlLnlgCioOzYh8G7s256R5c+Xjau5iEL7a6DD6OvWsZGXmk5
         Rqqc+NFuqnmH7u42wDdMJptYVIrUrTb15HuN93ZMrenNg6jIdNVquxq7a9fMA4ykZTpt
         ZtqAgBST8z7vYaSRO/2bkZCD1LMt8vuv0k7hEaGHX4+YES+s/EW/RnYLkVBonb6Wtwl1
         LrjPk6JFXpZ++BvhP0WyeMS1wG11PNmC2hjNjDflHsmD2pzEm5Trff2sP7vmGARX1hW0
         BUo9jeXs1ZibN1qPp5gv5JxitRlbdH1JJ0/pJlnFawIP4kwqp0hHsw2uqD+1MxRdpBV7
         Ovag==
X-Gm-Message-State: AOAM533tX3FJi6C0o8nBGeEoexJ6RDkz6VKmbLkRIPddhYhzZNxmfqaF
	/7/Daj35juVFIlNclcf9nE8=
X-Google-Smtp-Source: ABdhPJxzslphSfUsv8Kk92K2o1vbUwxh4il0VxCnEPq9zbo6TLitC7qhTUdgERRFyKENJaqFHstDqQ==
X-Received: by 2002:a50:a6c9:: with SMTP id f9mr5074768edc.158.1606857643806;
        Tue, 01 Dec 2020 13:20:43 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id ot18sm417255ejb.54.2020.12.01.13.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 13:20:42 -0800 (PST)
Date: Tue, 1 Dec 2020 23:20:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Catalin Marinas <catalin.marinas@arm.com>, arm@kernel.org
Subject: Re: [RFC 2/2] MAINTAINERS: add a limited ARM and ARM64 SoC entry
Message-ID: <20201201212041.GB23379@kozik-lap>
References: <20201201211516.24921-1-krzk@kernel.org>
 <20201201211516.24921-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201201211516.24921-2-krzk@kernel.org>

On Tue, Dec 01, 2020 at 11:15:16PM +0200, Krzysztof Kozlowski wrote:
> It is expected for ARM and ARM64 SoC related code to go through
> sub-architecture maintainers.  Their addresses were therefore not

I reshaped my message last moment and missed that it does not make
sense anymore... It should be:
"The ARM and ARM64 SoC maintainers addresses were therefore not..."

Best regards,
Krzysztof

> documented to push patch traffic through sub-architecture maintainers.
> 
> However when patches touch generic code, e.g. multi_v7_defconfig, the
> patch might not be picked up by them and instead should go to the SoC
> maintainers - Arnd and Olof.
> 
> Add a minimal maintainer's entry for SoC covering only Makefile, so it
> will not appear on most of submissions (except new devicetree boards).
> It will though serve as a documentation and reference for cases when
> submitter does not know where to send his SoC-related patches.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6149066a545e..f302983645bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1491,6 +1491,16 @@ F:	Documentation/devicetree/bindings/iommu/arm,smmu*
>  F:	drivers/iommu/arm/
>  F:	drivers/iommu/io-pgtable-arm*
>  
> +ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
> +M:	Arnd Bergmann <arnd@arndb.de>
> +M:	Olof Johansson <olof@lixom.net>
> +M:	soc@kernel.org
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> +F:	arch/arm/boot/dts/Makefile
> +F:	arch/arm64/boot/dts/Makefile
> +
>  ARM SUB-ARCHITECTURES
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -- 
> 2.25.1
> 
