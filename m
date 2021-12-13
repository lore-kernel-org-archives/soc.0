Return-Path: <SRS0=b9UP=Q6=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69007C433F5
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 20:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35FEBC34600; Mon, 13 Dec 2021 20:29:21 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9161C34602;
	Mon, 13 Dec 2021 20:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9161C34602
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so18725503otj.7;
        Mon, 13 Dec 2021 12:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sp7soaG+93uM6HIRElJy0T0BN+OSm+e/LYzCLa9P4m4=;
        b=spwt75Hbq3rkGuKi/TXoAEQtKXD/o8Y8fvGTpgaSMdkDlAX7zCrp7oT8hwSB3q9dKh
         yPa85UAlrDitQU/tqUbnEjbCiKdRUtHJUpqgwOChwUvOa/Jet+q3UOFAvSuAGlzKXVT/
         XdVNOLF7KesPYsIX36CbhnPMKTkCB9y2+C8HEA5m4aVKgXF10D9brkOSa1fFVyliV4KS
         3bkOUSL7DBUM5rQehkC5TuOUuuaKvVcaEcI7oAGA8G+p0HF8xhthvfrpocRW0QAdyJH4
         rgorYK7dusfW/RTHYEM084TAH3eRKXBDvXDIBMlaWe3gYkJJZSFAcZ74ZjFq8UaJ3E4v
         EXuQ==
X-Gm-Message-State: AOAM532N4/mndW6IA6vIFkgr+pF3zg9989kX7hXUA0fDw/LK8q8SXmtL
	mOE+KGYEwoJA4rLkGgtE7Q==
X-Google-Smtp-Source: ABdhPJwGTNJ0ypFWisjlBwDJw2AzFfuOaKfZPNCdJD2ujguuasN28S1+P/yQ1DAcPHPDpZ17m4Whew==
X-Received: by 2002:a9d:17cc:: with SMTP id j70mr649269otj.313.1639427359961;
        Mon, 13 Dec 2021 12:29:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a5sm2358231otd.74.2021.12.13.12.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 12:29:18 -0800 (PST)
Received: (nullmailer pid 1517332 invoked by uid 1000);
	Mon, 13 Dec 2021 20:29:17 -0000
Date: Mon, 13 Dec 2021 14:29:17 -0600
From: Rob Herring <robh@kernel.org>
To: Changming Huang <jerry.huang@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: sebastian.reichel@collabora.com, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@canonical.com, linux@rempel-privat.de, olof@lixom.net, marcel.ziswiler@toradex.com, jagan@amarulasolutions.com, festevam@gmail.com, devicetree@vger.kernel.org, shawnguo@kernel.org, arnd@arndb.de, cniedermaier@dh-electronics.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, soc@kernel.org, tharvey@gateworks.com, leoyang.li@nxp.com, dev@lynxeye.de
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add ls1021a-iot board
Message-ID: <YbetHRxKVSF1Ex2a@robh.at.kernel.org>
References: <20211203031332.902485-1-jerry.huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203031332.902485-1-jerry.huang@nxp.com>

On Fri, 03 Dec 2021 11:13:31 +0800, Changming Huang wrote:
> Add the board ls1021a-iot in the binding docuemnt.
> 
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
