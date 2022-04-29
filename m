Return-Path: <SRS0=tp0+=VH=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4DAC433EF
	for <soc@archiver.kernel.org>; Fri, 29 Apr 2022 22:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C33A6C385A7; Fri, 29 Apr 2022 22:37:21 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D3F2C385A4;
	Fri, 29 Apr 2022 22:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D3F2C385A4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id l9-20020a056830268900b006054381dd35so6059427otu.4;
        Fri, 29 Apr 2022 15:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cECeERhvUI5B2Nya2PZFr4hXbWHDmZxUWHyaVMrMdOM=;
        b=xdPMIlyViX63qlr5Rl5Tdf4s9k2TuZuC9kvVqMG0vvsfTHI+/1uONqBFBapQCevLhB
         YZLMir3Sw3oju7M+EELkxge9idHrQ+uUEk/CFENat6Ha0WSwNknjCd5b9i7NObsMJQJJ
         fA1+1WgYlx8SmQavQASPODl5BC9SCqlhq6d4nCy60kE5jNgV9yedQSCKZgSgS/37utlN
         8HOwoR051BNKDCDwqVfHwYJ9TcNvkCJUMrSvAbMKJSg7kZZYZpgWMiGgt0CMoGfG43AE
         X0IK+nCd4vjUJmTvqxFILoLRsIdfJzDK42y2qJluuX9gsUdgj9LQ9I8165U8g5TL3Eu8
         UmYg==
X-Gm-Message-State: AOAM531lxSPBY2JBZ4Gy9R3vbPlcijeaSbFj5bY/54Aafep6Qv211cov
	cjfz3ubJFJhzzNeywjDraQ==
X-Google-Smtp-Source: ABdhPJyRAmQ8+XOfTHvj7UZzS2Ges1j2q3irvixYxfrcbLWzrJA+bVtMu1axF6/4PRoI3OhLfPzLBQ==
X-Received: by 2002:a05:6830:3155:b0:605:57e8:c8de with SMTP id c21-20020a056830315500b0060557e8c8demr577896ots.170.1651271840073;
        Fri, 29 Apr 2022 15:37:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t3-20020a05687044c300b000e686d13892sm3485854oai.44.2022.04.29.15.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 15:37:19 -0700 (PDT)
Received: (nullmailer pid 3029410 invoked by uid 1000);
	Fri, 29 Apr 2022 22:37:18 -0000
Date: Fri, 29 Apr 2022 17:37:18 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, clin@suse.com, linus.walleij@linaro.org, festevam@gmail.com, mturquette@baylibre.com, marcel.ziswiler@toradex.com, soc@kernel.org, sboyd@kernel.org, shawnguo@kernel.org, Mr.Bossman075@gmail.com, linux-imx@nxp.com, daniel.lezcano@linaro.org, tharvey@gateworks.com, linux-gpio@vger.kernel.org, dev@lynxeye.de, giulio.benetti@benettiengineering.com, stefan@agner.ch, devicetree@vger.kernel.org, tglx@linutronix.de, abel.vesa@nxp.com, s.hauer@pengutronix.de, olof@lixom.net, linux-clk@vger.kernel.org, sebastian.reichel@collabora.com, aisheng.dong@nxp.com, robh+dt@kernel.org, arnd@arndb.de, leoyang.li@nxp.com, cniedermaier@dh-electronics.com
Subject: Re: [PATCH v2 01/15] dt-bindings: arm: imx: Add i.MXRT compatible
 Documentation
Message-ID: <YmxonpKvcmoKVXmT@robh.at.kernel.org>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
 <20220428214838.1040278-2-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428214838.1040278-2-Mr.Bossman075@gmail.com>

On Thu, 28 Apr 2022 17:48:24 -0400, Jesse Taube wrote:
> Recently the imxrt1050 was added but the cpu compatible node wasn't
> added. Add both i.MXRT1170 and 1050 compatibles to fsl.yaml.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - Swap order of soc's
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
