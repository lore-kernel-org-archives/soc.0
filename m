Return-Path: <SRS0=+ssV=RU=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36422C433F5
	for <soc@archiver.kernel.org>; Tue,  4 Jan 2022 19:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21468C36AE9; Tue,  4 Jan 2022 19:08:01 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0C47C36AED;
	Tue,  4 Jan 2022 19:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0C47C36AED
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so48472626otj.7;
        Tue, 04 Jan 2022 11:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zol8RqhcqrOeExkKxHD6i/0eMcZgg4YGQ9xIXDGBZL0=;
        b=7uedhsehCHbLHm01tJEIjdz5wcZoqdk1JdJ64ymHAeXkKymouVCYml8efxmW/LBBVb
         A5MFO4tFPwgbxPJ2o5GcL9EjuvRQMVNxMYI/LB055hYIU9r5Wr6ZanTJwb5YuODs7Qt3
         EdQPNrJXUkKsWTcdn/omlBJMDi6qZT8AcghYVd26/slwZR0x7HjO2dTqD4RdWxz0yEsh
         SaVx05lJZUtnshpTbaM5UUNlfn0X6a3siCrRkUlSV+rxYlgK6AxzJ0cNGo4I4HZj2woI
         oXdN29JlAu9yIn5/upFXkkNYccBHLGre9iXojUf/ASOl408ljFQEgMAXRKrdcniGw4aJ
         2Jvg==
X-Gm-Message-State: AOAM5312zxvhYnQ+lOeucypBp2EthMpnP40zrJQEtiDwaRQABqg3RrNL
	RJ9il/r6TEAY4MT4FNTemA==
X-Google-Smtp-Source: ABdhPJwD6As9c1PJJ5b5sN3V+8tRevP6v+G+WluIcZqLUbDDpYLuCj4xh6m/A3masXZmj4ALYIcjWg==
X-Received: by 2002:a9d:a55:: with SMTP id 79mr37401880otg.275.1641323279784;
        Tue, 04 Jan 2022 11:07:59 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x4sm10005968oiv.35.2022.01.04.11.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 11:07:59 -0800 (PST)
Received: (nullmailer pid 1229576 invoked by uid 1000);
	Tue, 04 Jan 2022 19:07:57 -0000
Date: Tue, 4 Jan 2022 13:07:57 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux@armlinux.org.uk, jirislaby@kernel.org, linux-kernel@vger.kernel.org, festevam@gmail.com, abel.vesa@nxp.com, olof@lixom.net, kernel@pengutronix.de, stefan@agner.ch, ulf.hansson@linaro.org, linux-gpio@vger.kernel.org, linux-imx@nxp.com, Mr.Bossman075@gmail.com, linux-mmc@vger.kernel.org, shawnguo@kernel.org, mturquette@baylibre.com, nobuhiro1.iwamatsu@toshiba.co.jp, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, soc@kernel.org, gregkh@linuxfoundation.org, sboyd@kernel.org, devicetree@vger.kernel.org, s.hauer@pengutronix.de, adrian.hunter@intel.com, linus.walleij@linaro.org, linux-serial@vger.kernel.org, robh+dt@kernel.org, giulio.benetti@benettiengineering.com, linux-clk@vger.kernel.org, aisheng.dong@nxp.com
Subject: Re: [PATCH v7 4/7] dt-bindings: clock: imx: Add documentation for
 i.MXRT1050 clock
Message-ID: <YdSbDTcA6qyZdJJv@robh.at.kernel.org>
References: <20220103233948.198119-1-Mr.Bossman075@gmail.com>
 <20220103233948.198119-5-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103233948.198119-5-Mr.Bossman075@gmail.com>

On Mon, 03 Jan 2022 18:39:45 -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add DT binding documentation for i.MXRT1050 clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> V2->V3:
> * Remove anatop
> * Use lpuart not gpt
> * include imxrt1050-clock.h
> * 2 space tabs to 4
> * Remove oneOf enum
> * Change maxItems to 2
> V3->V4:
> * Nothing done
> V4->V5:
> * Remove extra newline
> * Rename ccm to clock-controller
> * Change minItems to const
> * Change minItems to description
> * Rename file to add 1050
> * Change commit description to just 1050
> V5->V6:
> * Add maxItems for clocks description
> V6->V7:
> * Nothing done
> ---
>  .../bindings/clock/imxrt1050-clock.yaml       | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

