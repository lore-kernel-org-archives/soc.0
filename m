Return-Path: <SRS0=l2eH=S5=linaro.org=lee.jones@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346D1C433F5
	for <soc@archiver.kernel.org>; Mon, 14 Feb 2022 14:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E97FBC340EE; Mon, 14 Feb 2022 14:15:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48E8FC340E9
	for <soc@kernel.org>; Mon, 14 Feb 2022 14:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48E8FC340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id c192so9735445wma.4
        for <soc@kernel.org>; Mon, 14 Feb 2022 06:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GhrHfphJQbfLHZGHShzFVwpGb33fGRasst5lc4cJXI8=;
        b=PsfK8rqlQGcBPZ30LK11uF8gIkxB+HziLMQ9JOtWJ60VHQf+svJmcf1rpbXaYT60AN
         a7ImAv4AqKCdiEh2sUPydWiXFZ8uKuP9LR+zYq7dfXg3aJf/FbWwqux+ji72qLBCun5M
         /7rAKKaGtpCiHswu4nZq2gaGKgT+ZXGUk1rfkyS4r5oPPx8wu909ChwgnPnr5RxS/7wR
         zTJNfLJa50ohgKYhiKaGMdf0feeCtv1+WfHkwWFyQSaw8a0gBwyB+vVNsh63tRIpQq8A
         5Xh+ENH4GFwfiw0WRnhw8ZZ9NCMeIyPT4/QP9wjCrlhIf0IacNgA8agyxfofF0gTMQSy
         sCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GhrHfphJQbfLHZGHShzFVwpGb33fGRasst5lc4cJXI8=;
        b=4YkNuqteKVioZYeIyHebaiBlli0YHdSlHrvc0sHUnZoWifEVbj0dUIqFIZHcNk3aNS
         0dVK1YaBqdgxHrSK1BgM20Q4+ha3qzxRDBLeIlicDoLBsoAbftWBQjeqdmAu8eHEOwAx
         b70eYYZwLJQOcyUcSTcLpndxqytI2evVzLAC9ZHBD3CFXor2nt+Iyn4/Bfw5iSMTBfM+
         8Kb0J7L7r0EogU5tp7bep83IBIWfRG/s2Adxois2iITKd4/6E0PIBttRvLX20gtsF0D8
         7/n86V1Ap7w542DPhsvND2sTk4dKBc4QTNVRQew1T15SR8gp75fGA5jCm+gZKDZJooVm
         wB5A==
X-Gm-Message-State: AOAM531hhlGf0me9U9T7reiUrdp2dU4z68hMgqhNr5c15N4KN9SMsSqu
	oZT5u8Yg8GgCI1i8Ib4xG5QulmS46IpzPA==
X-Google-Smtp-Source: ABdhPJzQBfXvD8Ft/MTVQ27yEibtBNwH0Q5/uOHXNNsdEeZym1fH3VPkUg8qpnSr+4e3JNsGVmHI6A==
X-Received: by 2002:a05:600c:2291:: with SMTP id 17mr11065679wmf.163.1644848141661;
        Mon, 14 Feb 2022 06:15:41 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id n35sm8402141wms.8.2022.02.14.06.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 06:15:41 -0800 (PST)
Date: Mon, 14 Feb 2022 14:15:39 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Michael Walle <michael@walle.cc>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] MAINTAINERS: add myself as a maintainer for the sl28cpld
Message-ID: <YgpkCyoSMg5RYfkO@google.com>
References: <20220207184652.1218447-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220207184652.1218447-1-michael@walle.cc>

On Mon, 07 Feb 2022, Michael Walle wrote:

> The sl28cpld is a management controller found on the Kontron SMARC-sAL28
> board for now. Support for it was added by me quite a while ago, but I
> didn't add a MAINTAINERS entry. Add it now.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Hi,
> 
> since this affects so many subsystems, I'm not sure through which tree this
> should go. I'm sending this to the arm soc maintainers because it's an
> aarch64 board where this driver is used as well as Lee as the MFD
> maintainer.

I'm happy to take this, if it pleases everyone.

>  MAINTAINERS | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ddcee331dc09..c14209168ce6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17762,6 +17762,21 @@ S:	Maintained
>  W:	http://www.winischhofer.at/linuxsisusbvga.shtml
>  F:	drivers/usb/misc/sisusbvga/
>  
> +SL28 CPLD MFD DRIVER
> +M:	Michael Walle <michael@walle.cc>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
> +F:	Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
> +F:	Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
> +F:	Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
> +F:	Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
> +F:	Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> +F:	drivers/gpio/gpio-sl28cpld.c
> +F:	drivers/hwmon/sl28cpld-hwmon.c
> +F:	drivers/irqchip/irq-sl28cpld.c
> +F:	drivers/pwm/pwm-sl28cpld.c
> +F:	drivers/watchdog/sl28cpld_wdt.c
> +
>  SLAB ALLOCATOR
>  M:	Christoph Lameter <cl@linux.com>
>  M:	Pekka Enberg <penberg@kernel.org>

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
