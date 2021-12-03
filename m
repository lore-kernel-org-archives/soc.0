Return-Path: <SRS0=dxSF=QU=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956F7C433F5
	for <soc@archiver.kernel.org>; Fri,  3 Dec 2021 04:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54280C53FC7; Fri,  3 Dec 2021 04:43:43 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A41A0C53FCE
	for <soc@kernel.org>; Fri,  3 Dec 2021 04:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A41A0C53FCE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id k4so1250589plx.8
        for <soc@kernel.org>; Thu, 02 Dec 2021 20:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7mPNLk8tLdK5DDTbw5bfTCjo4IkSyEGMOB9BFirxYGU=;
        b=IKaG1hPcKKzPHkdxz/tFVlAXS0Rd3Pi0CjIPnWAs/jCYFkJoX/NX/d9eKwVd95LCR5
         mgjMTmnUo7tttI5MfgoaeA0Q/eCsjbeKMuzZrHzkZGVN3citeLjiM8P1yiMwBex0zxn8
         nnveMoYL8JYU+YyKGzCnDsC4RcjfDxMwpMZM0OB+SsZOOSDcYNdWcOcovEvPhKlqezkT
         dG0Kmamp6TtuDUZIpZkapyNFQzFy7K660wHDQRBqRKAA7YT27tw/vwf/0t7iseb6z9J8
         EDpthKxwTiqh5ChWlEBtcNNCeGoXl8fzzfWD4HgyWv0GEWwZpzxIFZPlsDLQNqgeogUX
         2erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7mPNLk8tLdK5DDTbw5bfTCjo4IkSyEGMOB9BFirxYGU=;
        b=MwqKksQl3KY/DFYaxKPY47YUMR/h/BFEgLZnGARyfrm59k0GJ1h0axJol3tv7oaqsW
         0+hIHxZwTtB5G7KMhZYHgwEWy3RhQmy+ehDeiLTy2WcMyj72fx4+6INghL5ulSF0FwAX
         0FxStCHS8srqiA6LiRgYEjHt9t91n4hfzxEhUlC7uSxqVWJbihF60PKsCQq6bV+OOmoQ
         3qkTSPHvLpw8vjs6qs3fjqwRci5KUNKwv2JAV8xoyLeB08bCikWxrgvAoWl96nNG7W6g
         FlTO5PtCIMQg+N52JFnUm9yoGlpSXhcb8TbbsuSReNWxb3rDnLFL/3rKaeO7UrX2Q6Qg
         Z3iQ==
X-Gm-Message-State: AOAM533bSDQbQysrUyRCLwXIWdYpGvhbOBQo7f0yo1uN2CbCN/aJKnRN
	uieXTXp6NJv9/ySdPrUz54piYg==
X-Google-Smtp-Source: ABdhPJz327okhh8voT4wIIAxhUoaKYcbIWi4Cfjeksrhd/QxBYsPqkMeYfKWpfxR7/l6L7m4/VzNFw==
X-Received: by 2002:a17:902:7b82:b0:143:a6d6:34ab with SMTP id w2-20020a1709027b8200b00143a6d634abmr20058440pll.30.1638506622012;
        Thu, 02 Dec 2021 20:43:42 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id d10sm1353449pfl.139.2021.12.02.20.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 20:43:41 -0800 (PST)
Date: Fri, 3 Dec 2021 10:13:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Herve Codina <herve.codina@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/6] spear: Fix SPEAr3XX plgpio support
Message-ID: <20211203044339.exx77afqgkbdhqgs@vireshk-i7>
References: <20211202095255.165797-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202095255.165797-1-herve.codina@bootlin.com>
User-Agent: NeoMutt/20180716-391-311a52

On 02-12-21, 10:52, Herve Codina wrote:
> Hi,
> 
> This patch series fixes the plgpio support on SPEAr3xx SOCs.
> 
> The first four patches of this series fixes a ressources
> sharing issue between the plgpio driver and the pinmux
> driver.
> Indeed, these two drivers can use the same IO address range
> on some SPEAr3xx SOCs.
> To solve the issue, a regmap (syscon managed) is used in both
> drivers and the plgpio driver can reference the pinmux regmap
> to use it.
> 
> The second part of this series is related to IRQs.
> The plgpio on SPEAr320s SOC uses an IRQ line in the reserve
> range (from SPEAr320 point of view).
> This issue is fixed enabling all the 'reserved' IRQs and
> adding a dtsi file for the SPEAr320s with the correct interrupt
> for the plgpio node.
> 
> Best regards,
> Herve
> 
> Herve Codina (6):
>   pinctrl: spear: spear: Convert to regmap
>   pinctrl: spear: plgpio: Convert to regmap
>   pinctrl: spear: plgpio: Introduce regmap phandle
>   ARM: dts: spear3xx: Use plgpio regmap in SPEAr310 and SPEAr320
>   irq: spear-shirq: Add support for IRQ 0..6
>   ARM: dts: spear3xx: Add spear320s dtsi

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
