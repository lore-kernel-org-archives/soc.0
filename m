Return-Path: <SRS0=MIYb=NC=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A3CC4338F
	for <soc@archiver.kernel.org>; Wed, 11 Aug 2021 18:40:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EE9AA6108C; Wed, 11 Aug 2021 18:40:41 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0C0E61008;
	Wed, 11 Aug 2021 18:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0C0E61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id nt11so4971122pjb.2;
        Wed, 11 Aug 2021 11:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YgL5QZA+nttpaayeuohalxKILerIeWnfwKqrpAxGEV8=;
        b=SO6NT+sox3sGfmqbT+2zZCZbL+dG5SrNjpWZAibmfl6PpUOGE6nhbr1FiteLl5JpW9
         65KYI0BhS47hBkD1znJV4uV9ovLBpOjx9TMw5wj1fzerlNhhPU97rAuHFQWZt8rccceZ
         fWOQuytvNXaD5Lb5hpWIm4fR7bsVLna18CcOFf6sWLNpxGD9IwpKo8uBievpNfD3rtCn
         EdRKKE50Qury0Qhp/O7q9nnRtAYR7R5gL1fMbsesFhmxBrQFTAWxn4toIyGvaBhqfe1w
         8t6ZeJscjOcvjkYAGy/+g4H0NSKRtUgm7a6LMnEr016YVblv+OGt3wV3DyRq8xd3Khrr
         H2ag==
X-Gm-Message-State: AOAM533UGY4WspK2dWSXPEvBKOBJeYhagJPe/Z6i9cf6CSolUzeLwAEx
	7zCFiwlpPyTgR3fmhxbDCA==
X-Google-Smtp-Source: ABdhPJwnahoo1EM8pHpP+QSc3xuGsCPXqSQ/jRidO7xuzVac8Xmgh3XG//7qIy7NBtmcjC/sj/1XOQ==
X-Received: by 2002:aa7:9906:0:b029:3c7:a6a1:c73d with SMTP id z6-20020aa799060000b02903c7a6a1c73dmr199239pff.1.1628707241447;
        Wed, 11 Aug 2021 11:40:41 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
        by smtp.gmail.com with ESMTPSA id d9sm224216pfv.161.2021.08.11.11.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 11:40:40 -0700 (PDT)
Received: (nullmailer pid 67452 invoked by uid 1000);
	Wed, 11 Aug 2021 18:40:36 -0000
Date: Wed, 11 Aug 2021 12:40:36 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Fabio Estevam <festevam@gmail.com>, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: fsl: add SKOV imx6q and imx6dl
 based boards
Message-ID: <YRQZpGn/+XfDy4Gj@robh.at.kernel.org>
References: <20210804043439.11757-1-o.rempel@pengutronix.de>
 <20210804043439.11757-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804043439.11757-3-o.rempel@pengutronix.de>

On Wed, 04 Aug 2021 06:34:38 +0200, Oleksij Rempel wrote:
> Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
