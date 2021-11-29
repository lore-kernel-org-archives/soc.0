Return-Path: <SRS0=Ozy7=QQ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C008EC433EF
	for <soc@archiver.kernel.org>; Mon, 29 Nov 2021 01:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91C1AC53FCE; Mon, 29 Nov 2021 01:05:03 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0EEDC004E1;
	Mon, 29 Nov 2021 01:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0EEDC004E1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id s139so31395079oie.13;
        Sun, 28 Nov 2021 17:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KRbGvsMdjctgkO/jbWe7OhIGOnprYk/c8aO0z2s/XnE=;
        b=JMEUsOowpenaj/wSQu37GjsbMGdPkVUKLRo0b/MZIMvaKbLdfafI21YtaXlQCqRIrf
         SwLpLIg+SG5GUkeoP2qML+4VlyuINgCVekOLukLnc2zW1TPGZRTOuvrjj+u3piDpmRR/
         gxrNKs0QqpgULtSF6chNVphDd/hZBSgLxx0XeqeD/gr2rJC5CUHFjIb9Ua5saSjzzX+6
         VwDDqCExVTI3iY7ImQIsKn/wzFGOXWI5NpgAF9ocP+X6ZhYd+5kYlCotA7Q3ZByqu6NJ
         Vcq/X1rX6KqcYHigOTiE3aiyhcUjpDRPfILWdgqF2VxXlGgVF44JN+yZyYsIG06caN7x
         ol3A==
X-Gm-Message-State: AOAM530KpAEzPzcjD8leuZjNKm0wS4SmVv5RM4Z9M/xtKe0jn4cio6IV
	TH+tRH8bSdV4a+l5Um2IgQ==
X-Google-Smtp-Source: ABdhPJyQ/h+K8qmPJJpq0AL7Pyq+tOsogXfJ+YiMSI7EqwKIpRdyFtlYdQdW2g5q95ArmyZTVH5baA==
X-Received: by 2002:aca:2103:: with SMTP id 3mr15282711oiz.48.1638147901940;
        Sun, 28 Nov 2021 17:05:01 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
        by smtp.gmail.com with ESMTPSA id l39sm2431063otv.63.2021.11.28.17.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 17:05:01 -0800 (PST)
Received: (nullmailer pid 2940353 invoked by uid 1000);
	Mon, 29 Nov 2021 01:04:56 -0000
Date: Sun, 28 Nov 2021 19:04:56 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: jirislaby@kernel.org, linux-mmc@vger.kernel.org, shawnguo@kernel.org, abel.vesa@nxp.com, stefan@agner.ch, Mr.Bossman075@gmail.com, giulio.benetti@benettiengineering.com, gregkh@linuxfoundation.org, linux-gpio@vger.kernel.org, adrian.hunter@intel.com, robh+dt@kernel.org, mturquette@baylibre.com, kernel@pengutronix.de, aisheng.dong@nxp.com, nobuhiro1.iwamatsu@toshiba.co.jp, linux-imx@nxp.com, linux@armlinux.org.uk, linus.walleij@linaro.org, olof@lixom.net, devicetree@vger.kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@kernel.org, linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ulf.hansson@linaro.org, festevam@gmail.com, soc@kernel.org, arnd@arndb.de
Subject: Re: [PATCH v3 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl
 binding doc
Message-ID: <YaQnOPiCMWIA7zzD@robh.at.kernel.org>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-3-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125211443.1150135-3-Mr.Bossman075@gmail.com>

On Thu, 25 Nov 2021 16:14:32 -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add i.MXRT1050 pinctrl binding doc
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> * Add tab for last pinctrl value
> V2->V3:
> * Remove imxrt1050-evk container
> * Remove unnecessary handles
> * 2 space tabs to 4
> ---
>  .../bindings/pinctrl/fsl,imxrt1050.yaml       | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
