Return-Path: <SRS0=mhbU=V3=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4DCC433F5
	for <soc@archiver.kernel.org>; Thu, 19 May 2022 13:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A59C0C36AE2; Thu, 19 May 2022 13:07:30 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F289C34115
	for <soc@kernel.org>; Thu, 19 May 2022 13:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2F289C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2f16645872fso56027207b3.4
        for <soc@kernel.org>; Thu, 19 May 2022 06:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dz80QCD+6CE2WkSamufmrlzCM2Z5I/iGKYhm4E6fP5A=;
        b=MzIskUvVCGTzeEoSrg5hcVYlo7SLpkrtZCNOsYBwMOrhNXwDPE9OAxjkAvKNpZKLYr
         fAhN5ZnIJdUsbNCd9srngZcgYoGPUHJsLwlF7Eg6BVl3IYEGjo9ib6oGxOepWKl3eNDo
         aGLbeGffL88cmr50mlTXtJOV82Qtef9gOFXp2DG3KtBSoUz2v4nwixnem4vYftiQiSbt
         NmSh4w6wrPbgAvPtUD0/e9uCGa7QCCywBZ+1oCtc4VWeMVMxrAJeIDZApWC0mbtc1kYu
         JM0JYeBsLjzZgefn7sz1IGWe5qGSyPdvHBVX/Aze8Zch7KPdDdbiy6Eq0VAP3dZre8gU
         2e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dz80QCD+6CE2WkSamufmrlzCM2Z5I/iGKYhm4E6fP5A=;
        b=0f0Kl7m4bwb5m5Zb/ywy4f7K2uVkmGC9XdlcOfa4mtjp5y+RsOD6NLhMI+mNqjpUd1
         wcaq0fbkrOQi1lMF4/YCqhhqN6+DyL/NIMYPSNf6oNjiUzIz8ENWw+Com8bT0DiW/7UL
         R031aHJrukDcM9f6HHdG1k/CP0b7sunT7HBbbB5rmNysvp628fV4w4AC0Vg/YeWVe2pz
         yYSPE9iEw9zqKthvHHaHup1WEFpVfIg7ION69QdJp+RozR2Ol6pUavxNEBd9OKaDWGZw
         1AsH7P3Apdl1JQmk4+n4y4uX/Epz8IAMlcaZy+JDP3jtAjxogVcxp4yUPt0v2qL5Yb9n
         uuwQ==
X-Gm-Message-State: AOAM531PtoqoDmtBcSf7iwV+syFFKDAHyY7syRzJsTwQgz2puzOcNNdB
	LAXqMg2MIyYFX8ezOFMeJIT5jX0eZpDwTWsNEGmATg==
X-Google-Smtp-Source: ABdhPJxsBVzRbaWlrFp9iq73YG21rHNLjS99HbEgv2SgrFLzzd63ELklO9hMs9x/uNhmt9BWBLuhC4bI4+FgNBf1Avo=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr4584461ywd.118.1652965648019; Thu, 19
 May 2022 06:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com> <20220517032802.451743-5-Mr.Bossman075@gmail.com>
In-Reply-To: <20220517032802.451743-5-Mr.Bossman075@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 May 2022 15:07:16 +0200
Message-ID: <CACRpkdbu87tO0qqLKCaKDM_B0D7cNotsk6Rea4f94VhiuXNJQg@mail.gmail.com>
Subject: Re: [PATCH v3 06/15] dt-bindings: pinctrl: add i.MXRT1170 pinctrl Documentation
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
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 17, 2022 at 5:28 AM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add i.MXRT1170 pinctrl binding Documentation
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> V1 -> V2:
>  - Nothing done
> V2 -> V3:
>  - Nothing done

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
