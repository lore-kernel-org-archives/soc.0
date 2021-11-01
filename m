Return-Path: <SRS0=Xset=PU=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4E5C433F5
	for <soc@archiver.kernel.org>; Mon,  1 Nov 2021 20:10:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 020B8610A2; Mon,  1 Nov 2021 20:10:52 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C166E61058;
	Mon,  1 Nov 2021 20:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C166E61058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id n11so18498526oig.6;
        Mon, 01 Nov 2021 13:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YoPr0Kx00n/4wfXS6DjD6CcxN8CXGBgVqxsaU5uGgD0=;
        b=Ebvzt2uXtztZ1r4H9NsBvVUDpUZFv+y06drNAwbuWnaeUuwqU0OhULYjOxKuvW8taX
         FCSLtDpj/2Lh8daun5QC8cLV866QKVKiyCIj8SFIx2KM6cEiYHIbZYN8xjp5r+v5siwz
         5a2ECfaIvKwyGmZGFgYzAqi2FG2etiyI6nGOdyU3Ahe6Fde4NGKSwcrQ3WWtm/7MLdY5
         2cYASHjBoUn1cpD9w/l65mnzHb2JfbGsMZx70jsH2etCc8cay5mKjp4DbBP+gNUEpapH
         CF7eU7SgC2rPVoKTFwRAILJnuADX6TB7qqkdHmQqpqWST5jfyd/kz4Yy/AuVYInPqls7
         nrkw==
X-Gm-Message-State: AOAM531y7vYImn8MgIkbJk2aCgNGaBkp2fuW4i62yEcrEgkM99mBjzxL
	bs+BJ26ik19PPE/+UZBZxw==
X-Google-Smtp-Source: ABdhPJy6tmrwBgKtRi9dAo1kDwvxy9RZo62SehMKvvN4By4omxUupe1TXERv1fMuoG9m/jB/5Xhp/A==
X-Received: by 2002:a05:6808:1151:: with SMTP id u17mr1060525oiu.38.1635797451074;
        Mon, 01 Nov 2021 13:10:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v25sm2524981otn.30.2021.11.01.13.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 13:10:50 -0700 (PDT)
Received: (nullmailer pid 958604 invoked by uid 1000);
	Mon, 01 Nov 2021 20:10:48 -0000
Date: Mon, 1 Nov 2021 15:10:48 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com, b20788@freescale.com, fugang.duan@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 03/13] dt-bindings: imx: Add pinctrl binding doc for
 i.MXRT1050
Message-ID: <YYBJyKv61p/sk1PE@robh.at.kernel.org>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154017.5X5YE5S_x5KJDGyYyx5jd-8m4gybur1xerb15SgFAiY@z>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024154017.5X5YE5S_x5KJDGyYyx5jd-8m4gybur1xerb15SgFAiY@z>

On Sun, Oct 24, 2021 at 11:40:17AM -0400, Jesse Taube wrote:
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Add binding doc for i.MXRT1050 pinctrl driver.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  include/dt-bindings/pinctrl/pins-imxrt1050.h | 993 +++++++++++++++++++
>  1 file changed, 993 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/pins-imxrt1050.h
> 
> diff --git a/include/dt-bindings/pinctrl/pins-imxrt1050.h b/include/dt-bindings/pinctrl/pins-imxrt1050.h
> new file mode 100644
> index 000000000000..a29031ab3de0
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pins-imxrt1050.h
> @@ -0,0 +1,993 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

Needs to match the .dts files which has BSD-3-Clause. The rest of i.MX 
uses MIT IIRC. You should align with that.
