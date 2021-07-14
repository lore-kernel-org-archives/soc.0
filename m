Return-Path: <SRS0=cWqL=MG=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F40DC07E9A
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 16:37:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3A0A5613C0; Wed, 14 Jul 2021 16:37:15 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE22613B6;
	Wed, 14 Jul 2021 16:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE22613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-io1-f50.google.com with SMTP id p186so2876328iod.13;
        Wed, 14 Jul 2021 09:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=E4AvJhetNwASZem5dl8Fp/vANmJkc1r/xjwo+QbtJNI=;
        b=NuWJiN4wNaL6d0iFs171rxiOK9EYp8s2JMVHy0kJnGZJn8K3mBIPNY8CxgznV2wLd9
         WUPrOQbsfwPF6td2nOZDn+W0Wc6Nu7QwjFYg92oxjDJ9L68AXQdWnKXqqq01dCC5qtrp
         +ImErC2OynuXH8mldxH1+IivV2vyRNQMWf19YxjBrTx8gz1hLEvM8cahNWMsUYHvGKSi
         ZY+hH2xh0i6Cus/ZZPU2jk0Y5PnBEGHN32nSeGmN/wcla6XxeVm4UokcmSY1UjjruARk
         RhPr7fuaOUbAplxiukrSBKiD533L1wdW/74cjG5GDSkEyKvRuOqRzvHEb3A1zrXtCjJF
         b/4w==
X-Gm-Message-State: AOAM53250lpHFKuHzDIy24iPzLhctLTOMbqmBU2Iu8/o8WUdSLotEz6E
	U1pjvNGjgHLHKqz01hXajQ==
X-Google-Smtp-Source: ABdhPJyyqzjI4orQEKBGudclxA6i5CqYo1oBoYaIfnzXMXkj0ILABCTs+SeLuzpf8Is17w4C3VeFtg==
X-Received: by 2002:a02:ad08:: with SMTP id s8mr9861761jan.40.1626280634475;
        Wed, 14 Jul 2021 09:37:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r1sm1078472ilt.37.2021.07.14.09.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 09:37:13 -0700 (PDT)
Received: (nullmailer pid 2719225 invoked by uid 1000);
	Wed, 14 Jul 2021 16:37:10 -0000
Date: Wed, 14 Jul 2021 10:37:10 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>, soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: simple: add some Logic
 Technologies and Multi-Inno panels
Message-ID: <20210714163710.GA2718995@robh.at.kernel.org>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210714045349.10963-2-o.rempel@pengutronix.de>

On Wed, 14 Jul 2021 06:53:46 +0200, Oleksij Rempel wrote:
> Add Logictechno and Multi-Inno panels:
> - Logic Technologies LTTD800x480 L2RT 7" 800x480 TFT Resistive Touch Module
> - Logic Technologies LTTD800480070-L6WH-RT 7” 800x480 TFT Resistive Touch Module
> - Multi-Inno Technology Co.,Ltd MI1010AIT-1CP 10.1" 1280x800 LVDS IPS Cap Touch Mod.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

