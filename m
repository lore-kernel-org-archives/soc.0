Return-Path: <SRS0=ywYp=QP=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AC9C433EF
	for <soc@archiver.kernel.org>; Sun, 28 Nov 2021 16:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B2DEC53FC7; Sun, 28 Nov 2021 16:32:31 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84CF6C004E1;
	Sun, 28 Nov 2021 16:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84CF6C004E1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso21994056ots.6;
        Sun, 28 Nov 2021 08:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=54vGdHRfblz7k8nhPNfNOqK2JgAb9gDm9fCVWfBgaLQ=;
        b=DNTuUKwV9zVlaQ1dS8FS6TIP0v5Z3Hqi1uFWgpme+V5QG8bKoFNTCHXYpv8B6rYt8Q
         r5bveN/YPNSfOYly5Uzw7oFGm3o42rm1Ew+zJrlO90TwllkY1Y2/ZyNPt3V9zZS02UZO
         qIzIaEdNppiE5pa3taa68MCJi2O8Ve1RGHNLV/rYc+tN8LORPXs7tmzYy36tCYNzktUR
         U3EzMhPQy7QqIxkezIeg3UupzkBsoj3wubdtvDAJbzJiDBqmtD+ujya4pk1r6txa3w82
         /d5g+6dtps+WcHFNUIb+1WfLETSoUEHqyHrgjyxIRk6hSbvL+Kx/2qCX06NKEGhV4vr1
         epzA==
X-Gm-Message-State: AOAM533uug3LJj772k4LTCyIA5+8iOjPKEBTg+oaSvwSf+/70ta0YmIR
	RcA2rZXwh9EoHph8YSzv1g==
X-Google-Smtp-Source: ABdhPJzN4EZGaZPtBZOnZdApXzljUYQ1gi/zc6C5H0R8ybQTzPiewS2KVMDIxH+H4886CFVaC+15Qg==
X-Received: by 2002:a9d:7516:: with SMTP id r22mr40253906otk.81.1638117149662;
        Sun, 28 Nov 2021 08:32:29 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d6:afc8:f6e9:d57a:3e26:ee41])
        by smtp.gmail.com with ESMTPSA id v19sm2183955ott.13.2021.11.28.08.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 08:32:29 -0800 (PST)
Received: (nullmailer pid 2678569 invoked by uid 1000);
	Sun, 28 Nov 2021 16:32:24 -0000
Date: Sun, 28 Nov 2021 10:32:24 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 06/13] dt-bindings: clock: imx: Add documentation for
 i.MXRT clock
Message-ID: <YaOvGJ5EUfNtdODd@robh.at.kernel.org>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-7-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125211443.1150135-7-Mr.Bossman075@gmail.com>

On Thu, Nov 25, 2021 at 04:14:36PM -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add DT binding documentation for i.MXRT clock driver.
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
> ---
>  .../bindings/clock/imxrt-clock.yaml           | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
