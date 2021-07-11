Return-Path: <SRS0=D9n6=MD=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3435EC07E96
	for <soc@archiver.kernel.org>; Sun, 11 Jul 2021 21:27:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D2B1C61006; Sun, 11 Jul 2021 21:27:56 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4C2861005;
	Sun, 11 Jul 2021 21:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4C2861005
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 62so16101600pgf.1;
        Sun, 11 Jul 2021 14:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7K3k85GaGJKCH9BuMuP8rpI2NCFrPnW80SQuzOhy2YY=;
        b=E7ZzntjKoIoVFd2IYMi7mAM3c5BrxmMx+/lsxhBYTPiiOGTSSa/za7vEM1+AI56dya
         /8rfcC3oyxeMu8D1jvI2HyNdwwySizqG4w5JIjwhuUtPjVt5LiCDWbBNV/1l50FQLa0I
         tj/6UlDVRRQ3ac0Y6dnt4Nn2Dk+uk+ubWL6j4q+kMZY6LsiPQyvrx/9SFSc7l/SCGsdV
         F/b0zif/6jB8LCh0f3XUVpZijxwC13azKoolkb/VhoU5OBvd7RDDqGgkmuTZfxfIJii2
         8LAbjvgkPck4kmsxSryavCnlYGYWkpyftUCd5lUbZ1b48JCZBfPnns/XZy6r4W/YnKXS
         mx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7K3k85GaGJKCH9BuMuP8rpI2NCFrPnW80SQuzOhy2YY=;
        b=NSyy0AyCphWG4DFw+OS2Iw0YsjTq1hA1LOCa1qitIZJXcBLo79n1M50rFipSKLhmvm
         Qw1Ezj5CCYqCsJictfB+uw3Ca4nG6HizExvDWRsJI7tAe3VYLmULZGNlVuTz1JBsmZ0I
         Ri4APNzptbR4MHOSyIx6neZBhPKHkDv+sCk95BFoLdRzMg5r9LkLBFmuyvkMD6/t6xyP
         7tymgU8xVRaYsIN2Uff4mUfmfjKANkdaE9uA8Go7HUvoCSK9yRRlJHwhRuuC0dTQDvg+
         OROcbzZaupKs99eXYzz+5pdARks/gIROSfcGYuX0H8tjzYOBr7hpq+8LacZGiMNIMI28
         59sg==
X-Gm-Message-State: AOAM530Bo4gp3nhsYFVxEd5NGEVuW3J4V0dOaxyUhrjVQagxW3wRtXrl
	MmnokvfoEtt87VOY+BXnOoQ=
X-Google-Smtp-Source: ABdhPJygvwZX9yQpROduCWqOil93ELonKQkH/fzOvZ4NZjeUIgYDNWCOITxDJiX17Xe7UUBxsxHdvg==
X-Received: by 2002:a63:f609:: with SMTP id m9mr50184529pgh.74.1626038876142;
        Sun, 11 Jul 2021 14:27:56 -0700 (PDT)
Received: from [10.230.31.46] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 194sm13261208pfy.51.2021.07.11.14.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jul 2021 14:27:55 -0700 (PDT)
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Make NOP_USB_XCEIV driver
 built-in
To: Stefan Wahren <stefan.wahren@i2se.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, soc@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <1625915095-23077-1-git-send-email-stefan.wahren@i2se.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d3154d8d-6f4c-b59b-add1-f3e75462309a@gmail.com>
Date: Sun, 11 Jul 2021 14:27:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625915095-23077-1-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/10/2021 4:04 AM, Stefan Wahren wrote:
> The usage of usb-nop-xceiv PHY on Raspberry Pi boards with BCM283x has
> been a "regression source" a lot of times. The last case is breakage of
> USB mass storage boot has been commit e590474768f1 ("driver core: Set
> fw_devlink=on by default") for multi_v7_defconfig. As long as
> NOP_USB_XCEIV is configured as module, the dwc2 USB driver defer probing
> endlessly and prevent booting from USB mass storage device. So make
> the driver built-in as in bcm2835_defconfig and arm64/defconfig.

Should not that be fixed somehow?

> 
> Reported-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>   arch/arm/configs/multi_v7_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 52a0400..d9abaae 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -821,7 +821,7 @@ CONFIG_USB_ISP1760=y
>   CONFIG_USB_HSIC_USB3503=y
>   CONFIG_AB8500_USB=y
>   CONFIG_KEYSTONE_USB_PHY=m
> -CONFIG_NOP_USB_XCEIV=m
> +CONFIG_NOP_USB_XCEIV=y
>   CONFIG_AM335X_PHY_USB=m
>   CONFIG_TWL6030_USB=m
>   CONFIG_USB_GPIO_VBUS=y
> 

-- 
Florian
