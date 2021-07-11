Return-Path: <SRS0=hrpO=MD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842B4C07E96
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jul 2021 21:30:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 395A361005
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jul 2021 21:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 395A361005
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBBmGk6/+w9uSwxA29rWSwjqY6daZ6l3tkr2BRhQpCE=; b=R3tEy+Y6rxCgfB6UNAmUCYFOrU
	ZaY1vyInXb57VOY2Ne4m4cntaaZ8jnEjDnBD939TsKSPyM41bqVzKk4GsYi/kX2CWxAFbc3JrLcDz
	wu0x2LnjB6m2yzPb4MM3IpBDileoq8OGKqkN++yIHiMG9sm3MMJJWt3vSpBjnLaLPnuD79M9VIN83
	vYz/nf4zJJDAP+tZr2+JFGFIEO7CSo7TkoSPtWt6yPmh0zgD/oCiiWVcQFnc5E4Ljj997A24WmMlj
	yNWHDYSG6R3e+UhPIr1Jvv7WMulytRX/q0k95nQxqh8s3kVB7Qxl2jxvlvRvEEBFnn7aGo3dZK1Ts
	y5p2M6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2gza-005RTm-RH; Sun, 11 Jul 2021 21:28:03 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2gzX-005RSj-1q; Sun, 11 Jul 2021 21:28:00 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 37so16097372pgq.0;
 Sun, 11 Jul 2021 14:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
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
 b=i6/5xspLw0Gv/ySvv8UMqjrDJ70UmBhEA3WgPyJ/CVUpzNIXW+INaQQ8KJ0qucvTSB
 xVAWEps9HKjZ+6VjHbwm2k/K1eG2pY2vU2rE4MzutjFvpla1ejr+M9qmsuw/5IazPvFx
 GAc5gzzQf8+xecJDrL7wDEpsPsxK8ThgJ3NB9kYfKzKLfQCbKemrh7W6JKiIfw94ZLes
 beT5IMsFmaGoevcyZKm0NcJfR2CS0cTYsPBHVqWWgNde/p0UCaiKkp61370PFo/ZIawW
 m9iPQR//ZtPqaHjTIgTJGcm7XtmCP+CVwUnhCBGlx4QbocsuhgrixqCL9r4ttmAabyCd
 Kz2g==
X-Gm-Message-State: AOAM530iV02SmIzp2irVW3e8yPd4Mgj4zMa8X2RGfA1WE0zxtN6Bgrs9
 fcdU9RYF+ZDXEAnZsPJjwdPpofIRXsVXEA==
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_142759_173452_02DC2052 
X-CRM114-Status: GOOD (  17.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210711212746.QWc_Yxdvz4-wnIXcQjqzgLt7MsA78Iwe751sn5e3v0I@z>



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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
