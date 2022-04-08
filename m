Return-Path: <SRS0=Ktsv=US=gmail.com=clabbe.montjoie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2C0C433F5
	for <soc@archiver.kernel.org>; Fri,  8 Apr 2022 07:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 788BBC385A8; Fri,  8 Apr 2022 07:12:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8A62C385A3;
	Fri,  8 Apr 2022 07:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C8A62C385A3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id p189so4870733wmp.3;
        Fri, 08 Apr 2022 00:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bjHkdEcXTJmQ/+9btYiv/OERHmHCUv7qBQpwKVyt8Sw=;
        b=af7hne+t6YtY20LK2fSuz1i4Q2jK05rbtMiCjuHvRYU8LQwRLiN9by7dHfeqPqbv4+
         4pCsXv0lY1qYpB5Jqlp40+Mdm6GP3Sfh9fio0pfjKWDzMWR/Bphy3bSwdPfhXnR8aQGk
         84+iiUfpN0wwaJV2/yvK4vbP2pu1ecOFID/5IeOEJgdSN/Ymifq3m809uHPWnB/KU4xU
         8P0YzmQTFsef+fZlR1S4eAoPb+WgI1KX8EeSZDT0xScS0kOYxWYEoJYMUiLrj8OQZuVu
         cSQRRaRxJoLGCMQ+4BFLvWU4DzBl3lcyut/QIYWIBOvq/GLRvTb8k1TdC0wIYv9XnDL7
         9iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bjHkdEcXTJmQ/+9btYiv/OERHmHCUv7qBQpwKVyt8Sw=;
        b=da0/ZSmSWsZpeQRmhWc1H7w4kqH0isuOAGysqmMafkW7U8nNVESQPvJhke5n03LF9V
         dR8V1LNonIstQ+ch/hDBxr5joNNeR613cZjhA0FNG6GDjfKfHBjmLKzpzUEu7deR0JAB
         dEyjCikg5NqZTdD6H1CIJPVbKibg3G4kCahaDGcQ1z3xG/0BhK++zk9Nyhmic6JvXKzV
         enA40P68EyyBqZUrf20TUeqgxQqAr1xxmMT7HMkxTNBBpwD9W4Gf7okjbgLBFRrc7K8E
         VPx+nWCC1qNm6YHdXNHz3ONkoFBOYLH/fA96veXQGBpQb7oibov9LcoaQE7nvMu5K6VJ
         d8Cw==
X-Gm-Message-State: AOAM530MjhuxG7JYC9blu186kjf8VOz5/4pPNHHSYTETjVuITP4gPAyi
	S/lV27i+pA5hY5T6oLmpYDI=
X-Google-Smtp-Source: ABdhPJzUGi5Sw/2TyFwMDzW7k556dLEl0Fb8rJ1NDUo4ZjjKCuNrqy1JwBARocQ1u1bZ1g/sUN93eQ==
X-Received: by 2002:a05:600c:6d3:b0:38e:6f67:ba8a with SMTP id b19-20020a05600c06d300b0038e6f67ba8amr15546782wmn.181.1649401933051;
        Fri, 08 Apr 2022 00:12:13 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id bh16-20020a05600c3d1000b0038ceba454f9sm8916106wmb.20.2022.04.08.00.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 00:12:12 -0700 (PDT)
Date: Fri, 8 Apr 2022 09:12:10 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@kernel.org>, Krzysztof Halasa <khalasa@piap.pl>,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH] ARM: config: Refresh IXP4xx config after multiplatform
Message-ID: <Yk/gShD+HHf1/s0D@Red>
References: <20220407204502.2470560-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220407204502.2470560-1-linus.walleij@linaro.org>

Le Thu, Apr 07, 2022 at 10:45:02PM +0200, Linus Walleij a écrit :
> After converting to multiplatform the old IXP4xx defconfig
> doesn't even activate the ethernet driver anymore, we need
> to refresh this thoroughly.
> 
> - Drop options that ARCH_MULTI_V5 selects for us.
> - Some options moved around because of multiplatform and
>   because generic Kconfig movements.
> - Explicitly deselect ARCH_MULTI_V7 so ARCH_MULTI_V5
>   becomes available and we can select ARCH_IXP4XX
> - Drop all MACH_* that do not exist anymore.
> - Compress the kernel and initramfs with XZ as the memory
>   is often limited for these machines.
> - Make sure IXP4XX_QMGR and IXP4XX_NPE is selected.
> - Make sure the MTD_PHYSMAP_IXP4XX is selected and not
>   the old MTD_IXP4XX (will be deleted).
> - Activate CRYPTO_DEV_IXP4XX
> - Add some very basic default drivers such as AT24 EEPROMs
>   used in many routers.
> - Add some kernel configs needed to bring up OpenWrt
>   which is the only userspace for these devices:
>   CGROUPS, DEVTMPFS, INOTIFY_USER, SIGNALFD, TIMERFD,
>   EPOLL, OVERLAY_FS and SQUASHFS.
> 

Please do not activate CRYPTO, it is still broken.
I need to finish my work on it.

Regards
