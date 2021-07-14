Return-Path: <SRS0=cWqL=MG=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B4CC07E9A
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 16:37:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 08BCC613C2; Wed, 14 Jul 2021 16:37:45 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB3E4613C5;
	Wed, 14 Jul 2021 16:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB3E4613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-il1-f181.google.com with SMTP id o8so2218924ilf.4;
        Wed, 14 Jul 2021 09:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wvSV9DfDpsl5FoylhFtZyQDYFQqbILb6lth89U0RgXo=;
        b=PW618PNNsPgPc+rswaCdtB3b7zfpBj0438XkTfdSy/lYfVQPno1fUohCKbVn+uiCPT
         Tq9EStn9c8faDDworw4rAZHaA33XFZ+rJNMitoeUilimv3pgxZF1JCDcUpwGvW7FGyg2
         vl679SBtZI51MuppQ18wFQoH5Iwgd5NxMvw/yiC+zqRgotoROCWvJFyqgUnOGf0ZO321
         k2QhMj0ggatV019PQP74gT8fUg880+xBGxS3FcGqGa17SJ0byfAZUow2id4qflkfBBH5
         kUM7NNFORhtURbygFMe24hqkkOT908NJjMuzGSvYW7oCMM4WGD3fOaUDUqNKKVlrl/Bx
         RfjA==
X-Gm-Message-State: AOAM531/IfJZPxZ5/3lubL/RA4s3ettxY897sR9N+Us3Rc3z1fHfYcO4
	S6TTFyTx2nT0Me9S7P5hyA==
X-Google-Smtp-Source: ABdhPJybfnKLyt3zWGR1Mz5MrmFhJLmJDYIPJ/v58lFR0tKBQH/gG7+vZ28acd295aiviIieUK1I9w==
X-Received: by 2002:a05:6e02:1091:: with SMTP id r17mr7232171ilj.160.1626280664250;
        Wed, 14 Jul 2021 09:37:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p6sm1543333ilg.4.2021.07.14.09.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 09:37:43 -0700 (PDT)
Received: (nullmailer pid 2720225 invoked by uid 1000);
	Wed, 14 Jul 2021 16:37:41 -0000
Date: Wed, 14 Jul 2021 10:37:41 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: fsl: add SKOV imx6q and imx6dl
 based boards
Message-ID: <20210714163741.GB2719790@robh.at.kernel.org>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714045349.10963-4-o.rempel@pengutronix.de>

On Wed, 14 Jul 2021 06:53:48 +0200, Oleksij Rempel wrote:
> Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

