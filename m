Return-Path: <SRS0=1Azg=XN=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C69C433EF
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 20:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D92D2C341C6; Fri,  8 Jul 2022 20:59:13 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2EFFC341C0;
	Fri,  8 Jul 2022 20:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2EFFC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id bf13so10248878pgb.11;
        Fri, 08 Jul 2022 13:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e/3oKcB1HpOXBSEaR0skiGfARHg3dQFArZCpwpkcA1o=;
        b=ERGg5YFQ6YWxFIGrUYJsMwmHWFy1ey5WdE8zNzL32fZaHt9sxRGywgvrxIUPbph//n
         lJVAVXfusGN7QiNz1dmzfxM1X9co3ET6Qf/utP087Hw2hvgCj4VzTvX7qtfQKMv7CGMy
         7GivN7D2G9ywC2/zlGQdf1ro9iDRK1BQYIC4ROgXUHVfBR+OhfcQOUSH/d8uzZh+sMIF
         3c0tOy0zHiRVeUKA7itNkPk510oNjr+86sEuDA96KXBRulGtu3NH+Dm4jz4kS48Hp62V
         eRBVaX1dDixzlrpBcvqzehzvYGkejDsB8VPP5df1aCei/GvS6lAXpt2yRoQVj5ujmb/l
         C0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e/3oKcB1HpOXBSEaR0skiGfARHg3dQFArZCpwpkcA1o=;
        b=VyMaeLvaRfTQxosFgC0fQSnoq+EGjRO05YFUuW/2fj4v8P3fgJRqmpg7jsUg+ev+Z1
         k6erUKR5L+sSuB6dxN5H4eD7mxBmc4tO2MXOLg6162ll030Keb1CNdBcf4MU3ePHnsYQ
         X09giw87D4R4L4FvsUXPIMsLoDKBCCTPaSpU5sf8P6ZgqpZeVcOfTub+DdCauJxNRpdS
         +5PrFP4JabzpZKU1W6zzHsmxeCJxOoQhBAV1JCKuUax9KH2zskcz67rt8BR8H6Pk2Qx7
         7zEo4tdX56SRjFp4I4Zo8jvxQzSnIQ1uV1bJWGfKmd7k9vYtbyZtGTJvE6RcAKhXGn00
         dSyg==
X-Gm-Message-State: AJIora+mbd9e7BCI/zU05CP7LZTDrlAZiBvTTGMdU8IEyjy+x09IXKUw
	v4XNHNrEdzDHuOBAtPDqbtk=
X-Google-Smtp-Source: AGRyM1vLMjkdzPTs/IQ94lre7gNFopfB20P52k7OoZki89NasntfkzDs7TGQa9TfGfekErL80gh5Tg==
X-Received: by 2002:a05:6a00:c84:b0:528:a24f:60f3 with SMTP id a4-20020a056a000c8400b00528a24f60f3mr5830333pfv.66.1657313952513;
        Fri, 08 Jul 2022 13:59:12 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v1-20020a17090a0e0100b001eafa265869sm2043201pje.56.2022.07.08.13.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 13:59:12 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
Cc: joel.peshkin@broadcom.com,
	dan.beygelman@broadcom.com,
	kursad.oney@broadcom.com,
	anand.gore@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: [PATCH v2 2/8] ARM: dts: Move BCM963138DVT board dts to ARCH_BCMBCA
Date: Fri,  8 Jul 2022 13:59:10 -0700
Message-Id: <20220708205910.2422527-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707070037.261532-3-william.zhang@broadcom.com>
References: <20220707070037.261532-1-william.zhang@broadcom.com> <20220707070037.261532-3-william.zhang@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu,  7 Jul 2022 00:00:32 -0700, William Zhang <william.zhang@broadcom.com> wrote:
> Use CONFIG_ARCH_BCMBCA to build all the BCMBCA SoC dts and remove
> CONFIG_ARCH_BCM_63XX from the makefile
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
