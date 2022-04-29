Return-Path: <SRS0=tp0+=VH=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414B8C4332F
	for <soc@archiver.kernel.org>; Fri, 29 Apr 2022 22:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A802C385AC; Fri, 29 Apr 2022 22:40:05 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70937C385A7;
	Fri, 29 Apr 2022 22:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70937C385A7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id e189so9970881oia.8;
        Fri, 29 Apr 2022 15:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m/Rs86VVXCF4b61KU23mR8u0brfO067mz0n4mQYK8uM=;
        b=cBFEnZFXoihrG8fKWyS2jn2W7mg19L0zsGOMW6X9sJaOCaZhKLHq4SSloItvzZsBI0
         gPQqBLyNRlGXLdeHaAKAoFzlBaOaN3tjoVvFsudWWxQKDX8B6VgB44XVee0lqeuM1bp9
         UPhbaeGVIX6Rldf5R08/cewDwSL33smvMJ6mI71tMUMRH0zREXCBwg5hH2LdLdqcQKqh
         GO8ap8RXcnKEhYq7oxvLV6fDZkp/t039npVJ3rAhQ3PvQpN3br6UYnZoEl2LAcxHHijF
         kAVGqrQOHuDEaqrScAXjPwaxAhDHj9PJ21caElakq3+u2AK6tiVTJyW9/RXzMOWWBC1Q
         mPqg==
X-Gm-Message-State: AOAM530PxOzXpOuckpzCe3od9tE6rHFkNqc3Eu7pSDdQXLJ/P12DzM40
	8fkCdmQcCEVPqBKVuti5Nw==
X-Google-Smtp-Source: ABdhPJzyPaMeTEhRAE3mMh9OBwh/+3e5SrP7sZvmDtK2Up0lhc3Y5SarSooP70XVdQ41q/n7t5hzmA==
X-Received: by 2002:a05:6808:148e:b0:325:592f:84a1 with SMTP id e14-20020a056808148e00b00325592f84a1mr2673147oiw.118.1651272003516;
        Fri, 29 Apr 2022 15:40:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r23-20020a4aea97000000b0035eb4e5a6b1sm1289822ooh.7.2022.04.29.15.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 15:40:03 -0700 (PDT)
Received: (nullmailer pid 3033802 invoked by uid 1000);
	Fri, 29 Apr 2022 22:40:01 -0000
Date: Fri, 29 Apr 2022 17:40:01 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, stefan@agner.ch, tglx@linutronix.de, giulio.benetti@benettiengineering.com, linux-arm-kernel@lists.infradead.org, tharvey@gateworks.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, olof@lixom.net, linux@armlinux.org.uk, kernel@pengutronix.de, aisheng.dong@nxp.com, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, festevam@gmail.com, linux-imx@nxp.com, s.hauer@pengutronix.de, leoyang.li@nxp.com, dev@lynxeye.de, robh+dt@kernel.org, shawnguo@kernel.org, arnd@arndb.de, Mr.Bossman075@gmail.com, devicetree@vger.kernel.org, cniedermaier@dh-electronics.com, soc@kernel.org, linux-clk@vger.kernel.org, marcel.ziswiler@toradex.com, clin@suse.com, abel.vesa@nxp.com, sebastian.reichel@collabora.com, sboyd@kernel.org
Subject: Re: [PATCH v2 05/15] dt-bindings: serial: fsl-lpuart: add i.MXRT1170
 compatible
Message-ID: <YmxpQedWAbaRK/uF@robh.at.kernel.org>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
 <20220428214838.1040278-6-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428214838.1040278-6-Mr.Bossman075@gmail.com>

On Thu, 28 Apr 2022 17:48:28 -0400, Jesse Taube wrote:
> Add i.MXRT1170 compatible string to Documentation.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - New commit to fix dtbs_check
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
