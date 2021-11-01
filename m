Return-Path: <SRS0=Xset=PU=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2B6C433EF
	for <soc@archiver.kernel.org>; Mon,  1 Nov 2021 20:11:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 66BA1610A2; Mon,  1 Nov 2021 20:11:28 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25CC061058;
	Mon,  1 Nov 2021 20:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25CC061058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id u2so7443245oiu.12;
        Mon, 01 Nov 2021 13:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vGBRocmjUuOsxEUXg/PEBsnNgp/Um6j49Jzz6QIa8yc=;
        b=pcHGlLsMXEkKO1uzzQcolTIPnUXjS4mcZ0THtjFo945FFElune+qw/vzqRqFZsWsjW
         WQtWh66ugV9yMnXCb715cfao3N9S0kdsuVbKW9VxlDyYdZzmEGyG19vsMPWrJc/GXBrd
         Xv9dasUTnO/muy7xw7MsLo4yZJxkpeuL+KmXQ1WEKuSjLcWLkA0aPFILOQxiEOhgOXEt
         A/Yti5YDv0qxYCPld/7enzKYDuCdOJhFYcC1LZA2tjKk2kdaBG0GXqdTjLVCxdPblIx7
         NC/e3TuS8iGiRJqtGj2G3jOmqdnXWekEXZqaxCDWp/dDWPiz9M+wQ38NKjro6OnaGHI+
         TjZw==
X-Gm-Message-State: AOAM530PpQbgxsn6/c22zFBLEm4+XvPDqos5vUNC6iI0QqOWVnR7hJcR
	6JoJdQ32szU8GUmokXczVQ==
X-Google-Smtp-Source: ABdhPJzEJPMEeZlG9eTygjSBuADrt2G2XC6VMZ09gbQ3Fhq8BmnEjm1r4hXQPtt0k157GXvtpoj1Ww==
X-Received: by 2002:a05:6808:1447:: with SMTP id x7mr1076882oiv.23.1635797487437;
        Mon, 01 Nov 2021 13:11:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a8sm340241otr.3.2021.11.01.13.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 13:11:26 -0700 (PDT)
Received: (nullmailer pid 959745 invoked by uid 1000);
	Mon, 01 Nov 2021 20:11:25 -0000
Date: Mon, 1 Nov 2021 15:11:25 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: aisheng.dong@nxp.com, linux-serial@vger.kernel.org, Mr.Bossman075@gmail.com, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, olof@lixom.net, adrian.hunter@intel.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, jirislaby@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, sboyd@kernel.org, kernel@pengutronix.de, s.hauer@pengutronix.de, linux-clk@vger.kernel.org, arnd@arndb.de, mturquette@baylibre.com, abel.vesa@nxp.com, giulio.benetti@benettiengineering.com, leonard.crestez@nxp.com, ulf.hansson@linaro.org, stefan@agner.ch, soc@kernel.org, gregkh@linuxfoundation.org, festevam@gmail.com, shawnguo@kernel.org, linux-imx@nxp.com, robh+dt@kernel.org, linux-mmc@vger.kernel.org, fugang.duan@nxp.com, b20788@freescale.com, nobuhiro1.iwamatsu@toshiba.co.jp
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
Message-ID: <YYBJ7ebwRxidQOrA@robh.at.kernel.org>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024154027.1479261-9-Mr.Bossman075@gmail.com>

On Sun, 24 Oct 2021 11:40:22 -0400, Jesse Taube wrote:
> Add i.MXRT documentation for compatible string.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
