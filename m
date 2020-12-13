Return-Path: <SRS0=Q8nQ=FR=jamieiles.com=jamie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67798C4361B
	for <soc@archiver.kernel.org>; Sun, 13 Dec 2020 16:25:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2D2CB23383; Sun, 13 Dec 2020 16:25:30 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 103D323359
	for <soc@kernel.org>; Sun, 13 Dec 2020 16:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 103D323359
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jamieiles.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jamie@jamieiles.com
Received: by mail-wr1-f66.google.com with SMTP id y17so13977226wrr.10
        for <soc@kernel.org>; Sun, 13 Dec 2020 08:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rf+b9N2htku5WJ9Hu0NGJ+c4uKlPgFBYFEnRhIM8Uhs=;
        b=S2Ty7Lhn1rwak6hdqcbPARjAEnxxvMgu6mXc9eqNXbZ4hVjaGEqQB8pMUoe4zTi1a7
         9K5iVrrFK26itWqBcEUcsB426J87wE6+0bdUwlzGPyaQAK7WJ2mi8EEN38iGxMFmnrsP
         RvAbxMjbqNfxeOib8SiOEhiZQlK2QiETI6lZECSO98DeQC4x86MPTvAar80gTr8fHlo9
         Me754RKBSGlMI4siQAk6QGOOJKPhpOHTAHbm+6yPlQO+KD153S9F2Nau3c/43mdt5Cbk
         efxE27ZeDqsyw9BQh3/7tvmX/sjx5PrOfXZJKnEygqAclqItBdi4Ow5kpP0d/zx2xj9h
         cClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rf+b9N2htku5WJ9Hu0NGJ+c4uKlPgFBYFEnRhIM8Uhs=;
        b=tGaPDY8smUJ0EqTZpUlzlD8YcdBUhaTSf3wUtVh8fWQg0SFlXrGvp6/PJhYGRY9Jws
         Cr26cEoZUCkHmYmRyK31IDuELkyjRBqxig+XVTXnQv46HQzjk10AASrspePF7ug8wFp5
         JOZi58ezKyLCfOoZbsWRubOOC+rbVdIsvtUZ4/1jVjEG7zUss5Q/2eYyk4KGmUFPONIA
         3Efi6aVi2fWiw3zZPx+B4o+pT+IRY+RCmzPoshrRBnRILn4PMuWEaKCA1jPt38oLylML
         D9ag2EjnCPmFzCaaQnYR7+JhwQevSTxFcWgcCWOXC9K/gC10ynFhv3McD0y0Qa84+7K8
         BrPQ==
X-Gm-Message-State: AOAM532neJNzb4UiDMr3eACqoPi/wet4YV2UaxiQjnQROVjiX0IW3VI2
	zArR6PUhqYdugzdOvYakx7izsw==
X-Google-Smtp-Source: ABdhPJzLE3t6E6T+7CANIDVOP3RTPKz+wUMY/WJbm93kEjoOQjfqOkI5aZIByNISKdCoVp6ig7p5VA==
X-Received: by 2002:a5d:5005:: with SMTP id e5mr24119814wrt.279.1607876727343;
        Sun, 13 Dec 2020 08:25:27 -0800 (PST)
Received: from localhost ([82.44.17.50])
        by smtp.gmail.com with ESMTPSA id z2sm27245655wml.23.2020.12.13.08.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 08:25:26 -0800 (PST)
Date: Sun, 13 Dec 2020 16:25:25 +0000
From: Jamie Iles <jamie@jamieiles.com>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Jamie Iles <jamie@jamieiles.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] Remove PicoXcell
Message-ID: <20201213162525.GA223635@willow>
References: <20201210200315.2965567-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210200315.2965567-1-robh@kernel.org>

Acked-by: Jamie Iles <jamie@jamieiles.com>

for the series.  Intel EOLd this product now, good idea to remove it.

Thanks,

Jamie

On Thu, Dec 10, 2020 at 02:03:11PM -0600, Rob Herring wrote:
> PicoXcell has had nothing but treewide cleanups for at least the last 8
> years and no signs of activity. The most recent activity is a yocto vendor
> kernel based on v3.0 in 2015.
> 
> These patches can go via the respective maintainers' trees.
> 
> Rob
> 
> Rob Herring (4):
>   ARM: dts: Remove PicoXcell platforms
>   ARM: Remove PicoXcell platform support
>   crypto: Remove PicoXcell driver
>   dt-bindings: Remove PicoXcell bindings
> 
>  .../devicetree/bindings/arm/picoxcell.txt     |   24 -
>  .../bindings/crypto/picochip-spacc.txt        |   21 -
>  .../devicetree/bindings/net/macb.txt          |    2 -
>  .../bindings/timer/snps,dw-apb-timer.yaml     |    7 -
>  MAINTAINERS                                   |    9 -
>  arch/arm/Kconfig                              |    2 -
>  arch/arm/Kconfig.debug                        |   13 +-
>  arch/arm/Makefile                             |    1 -
>  arch/arm/boot/dts/Makefile                    |    3 -
>  arch/arm/boot/dts/picoxcell-pc3x2.dtsi        |  239 ---
>  arch/arm/boot/dts/picoxcell-pc3x3.dtsi        |  355 ----
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts  |   78 -
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts  |   84 -
>  arch/arm/mach-picoxcell/Kconfig               |    9 -
>  arch/arm/mach-picoxcell/Makefile              |    2 -
>  arch/arm/mach-picoxcell/common.c              |   81 -
>  drivers/crypto/Kconfig                        |   18 -
>  drivers/crypto/Makefile                       |    1 -
>  drivers/crypto/picoxcell_crypto.c             | 1806 -----------------
>  drivers/crypto/picoxcell_crypto_regs.h        |  115 --
>  20 files changed, 1 insertion(+), 2869 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/picoxcell.txt
>  delete mode 100644 Documentation/devicetree/bindings/crypto/picochip-spacc.txt
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x2.dtsi
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x3.dtsi
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
>  delete mode 100644 arch/arm/mach-picoxcell/Kconfig
>  delete mode 100644 arch/arm/mach-picoxcell/Makefile
>  delete mode 100644 arch/arm/mach-picoxcell/common.c
>  delete mode 100644 drivers/crypto/picoxcell_crypto.c
>  delete mode 100644 drivers/crypto/picoxcell_crypto_regs.h
> 
> --
> 2.25.1
