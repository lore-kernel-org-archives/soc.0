Return-Path: <SRS0=mhbU=V3=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920EBC433F5
	for <soc@archiver.kernel.org>; Thu, 19 May 2022 13:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B340C385B8; Thu, 19 May 2022 13:08:13 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32549C34100
	for <soc@kernel.org>; Thu, 19 May 2022 13:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32549C34100
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2ec42eae76bso55805017b3.10
        for <soc@kernel.org>; Thu, 19 May 2022 06:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=La/7OOALhauUEG5Ji2oO8YvO8VOzXhhzoK6CQFuGens=;
        b=Mc01J4Jmev0FOw6h6XJqZkIQNwLAXIZdmviiHFc4dS0SXngMNt4uVOaGj3sQE+/AjG
         iHVJtLxz0SRFtzC6KZYGso767mBxZ0YMoWEKrI7sHpnTFU1GKZB5x4FT+6l2iD4pSFEU
         TK/IfXww27HTOb/Kd3t2LMc2606sodqY9RPc2jYCO39lTbk2OoWLDBBks1MollfDd9JR
         6CDvrRNyslLM/+JKHLfknToZJXU87WXzxjUn8DFRZxC2orM1AQSKre+uvW2SO+Y/mspm
         Q7lV5BmKPsaiawxHFXDNhHZiDGHjki0iHzM1FgKHhRjoSO660JbHtVqDs/JDdIbLySAR
         Ho0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=La/7OOALhauUEG5Ji2oO8YvO8VOzXhhzoK6CQFuGens=;
        b=VzAeoTfAOVyV6FGLMq/cMGBdV8DxD0Kjmq/Z4AvoCvSFrZy+2aSmfrnysNUpNy5yRT
         DnpoZ9SFWGHrVs89QV9Dy/fWS6UKuZOIJQwYT1o/5eOngAxhAoUL8Hz7Xo12aIoukQT4
         y5dgiUToWT/Ct/d8T6+5grFOFhsmN49ZTqEdH4KY9+Qd1M3YyKJ2AHjnrvJx53MKTYXe
         vtG7fhTAE4LTZnlgpUVg+bGFA/vtaCvKZRXQyu+hrKAt/eoNIiZmRaZ16AS0L84s8ROH
         n8YD68ae5uMmfpbPCdliBwf8UAG94eECm9vGaNcWISTOcs21I/B9SlbeLEZEiM3PnMaQ
         UoMw==
X-Gm-Message-State: AOAM532Kc27MGcxll2K5t2cIvbor3KeUh2fnOHPuBT/nMAQq7iOFLx4z
	VMCJ1uzFJ15oIKbtozU2QFRpvp5yG3gdb1Rf+Ib0+g==
X-Google-Smtp-Source: ABdhPJzjXaM6yDiZGQ6JFS2PFd8kAqU9kyb5veZ5kmD7lX3tGNCp8MwcAxKVbfGmkiMRw+pGuRJzDHAhcSYdhHAWbZg=
X-Received: by 2002:a0d:f0c3:0:b0:2f4:d291:9dde with SMTP id
 z186-20020a0df0c3000000b002f4d2919ddemr4419526ywe.437.1652965691192; Thu, 19
 May 2022 06:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com> <20220517032802.451743-11-Mr.Bossman075@gmail.com>
In-Reply-To: <20220517032802.451743-11-Mr.Bossman075@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 May 2022 15:08:00 +0200
Message-ID: <CACRpkdbjLiF=ZU1tjPQ+=eKd24aEOi+tZ4wZYamuKyC0B=DisA@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: freescale: Add i.MXRT1170 pinctrl
 driver support
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, 
	stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de, 
	olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, 
	dev@lynxeye.de, marcel.ziswiler@toradex.com, tharvey@gateworks.com, 
	leoyang.li@nxp.com, sebastian.reichel@collabora.com, 
	cniedermaier@dh-electronics.com, clin@suse.com, 
	giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, May 17, 2022 at 5:28 AM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add the pinctrl driver support for i.MXRT1170.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> V1 -> V2:
>  - Nothing done
> V2 -> V3:
>  - Nothing done

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
