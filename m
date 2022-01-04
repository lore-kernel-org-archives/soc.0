Return-Path: <SRS0=+ssV=RU=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED1EC433EF
	for <soc@archiver.kernel.org>; Tue,  4 Jan 2022 19:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27998C36AF4; Tue,  4 Jan 2022 19:07:01 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7744DC36AEB;
	Tue,  4 Jan 2022 19:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7744DC36AEB
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id w7so40095507oiw.0;
        Tue, 04 Jan 2022 11:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8CgkkbPTMgwITurXcyYa8txS8XSAkqNrdvXpQYKmlLs=;
        b=OZe2qSz442t5Gc2PA94jw4VZQNhQA8yE0BZy5JH1yziQcFiugeCsWk12vVqcGIqd6h
         zrdmn5fZKm6/Vf2x4a6RuqWgTKM/7i5JSlGMpaHS+RP9F8dbWvXwbh64EqJXDj8LMRA8
         VZeBgG44OagN9EJGBFlvifZ6bjsfZDleiKSfjvwfduD0qL4Elt+G7KEfNkXBU9DsmafN
         S1MsjhBfmIosIgtfJFdSiLKAS//kpvGeY8EOdsTT29b7J40vwcRxiBf0wkQr0HX5PS3v
         wY/1jKe9Mi4D0x7++Bv9azdt/+nUPUyNRl+JKLa80BFt/2BiH3JbfCYSm+vYF6vmRhLj
         lFgw==
X-Gm-Message-State: AOAM531KaVzQGjsZTdFB5e1fIMh84Rh5sIzk8u6hlgPowAZnVq99ZQzW
	W1GmZEwT2ZogqnwM1uyKcg==
X-Google-Smtp-Source: ABdhPJw0hrSMFia3kzR3oD+Vdenn5ohLpgJhiNYL5ZTwCMdi+PUKKbvtKnFvGJJVRysmx2lanYsxeg==
X-Received: by 2002:a05:6808:155:: with SMTP id h21mr31124067oie.121.1641323219578;
        Tue, 04 Jan 2022 11:06:59 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r17sm8378611otc.65.2022.01.04.11.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 11:06:59 -0800 (PST)
Received: (nullmailer pid 1227279 invoked by uid 1000);
	Tue, 04 Jan 2022 19:06:57 -0000
Date: Tue, 4 Jan 2022 13:06:57 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: adrian.hunter@intel.com, linux-arm-kernel@lists.infradead.org, abel.vesa@nxp.com, shawnguo@kernel.org, jirislaby@kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp, robh+dt@kernel.org, festevam@gmail.com, linus.walleij@linaro.org, linux-clk@vger.kernel.org, kernel@pengutronix.de, linux-imx@nxp.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, soc@kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, olof@lixom.net, mturquette@baylibre.com, linux-mmc@vger.kernel.org, giulio.benetti@benettiengineering.com, sboyd@kernel.org, linux-gpio@vger.kernel.org, Mr.Bossman075@gmail.com, arnd@arndb.de, gregkh@linuxfoundation.org, linux@armlinux.org.uk, stefan@agner.ch, ulf.hansson@linaro.org, aisheng.dong@nxp.com
Subject: Re: [PATCH v7 2/7] ARM: dts: imxrt1050-pinfunc: Add pinctrl binding
 header
Message-ID: <YdSa0ScOpb/5sMF/@robh.at.kernel.org>
References: <20220103233948.198119-1-Mr.Bossman075@gmail.com>
 <20220103233948.198119-3-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103233948.198119-3-Mr.Bossman075@gmail.com>

On Mon, 03 Jan 2022 18:39:43 -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add binding header for i.MXRT1050 pinctrl device tree.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> [Jesse: move pinfunc from dt-bindings to dts folder]
> ---
> V1->V2:
> * Move pinfunc from dt-binding to dts
> * Change subject and description
> * Change licence to "GPL-2.0+ OR MIT"
> V2->V3:
> * Change License comment style
> V3->V4:
> * Nothing done
> V4->V5:
> * Nothing done
> V5->V6:
> * Nothing done
> V6->V7:
> * Nothing done
> ---
>  arch/arm/boot/dts/imxrt1050-pinfunc.h | 993 ++++++++++++++++++++++++++
>  1 file changed, 993 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imxrt1050-pinfunc.h
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

