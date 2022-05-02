Return-Path: <SRS0=O7CA=VK=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B21C433F5
	for <soc@archiver.kernel.org>; Mon,  2 May 2022 21:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 728E3C385B1; Mon,  2 May 2022 21:13:53 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C08B5C385AC;
	Mon,  2 May 2022 21:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C08B5C385AC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f46.google.com with SMTP id f2-20020a4a8f42000000b0035e74942d42so2786563ool.13;
        Mon, 02 May 2022 14:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3q+qtdP+luQ33LzicXlYLTVCEnsuA+2H8mH4UxrS+O4=;
        b=XT3z5d7sh0GTGX+1MwQB33HfCL2c2jOEzmZcj8mRnU67KnbFO94mDkp4pFn4LnFb4E
         82THXOXenRfR0DAeTX134zkh9cCn6ImgH5sedxMfZN3SUwGo4sE4naYVMuBo5XUHpTyd
         8jF0tLgk5fLuF4qqJDZWfyEaC2P8Znr8Uji9CgBiH+Fe/nqlKrDwHVLBh8CAc4d3NkoK
         atxlMVV0/OK7YzLuBSP6N/2J1sdbEKezp0AmA/j1PPUhymLD8b2u+TlgrzlVB3BJMBtY
         xSVhWBfe83AYa27SVGFkGUwRIeXfPrG7eZT2mYs7OvnbakxjVpetZmjYdVn+uIGzQ3zY
         DAHg==
X-Gm-Message-State: AOAM531/vdj/ti5fnfaul1Q5DsQPTJRGQB+821XNWEcHSEBQiaiGeodT
	V92ZR2fExIx5oV00adT1xg==
X-Google-Smtp-Source: ABdhPJzdddq7QjHdq1Gyqkm9hnLQMotisgl4Ju8ztMqS+jbqac/2Etf+2iATS8SO6UwVwY2Ix6AJGQ==
X-Received: by 2002:a4a:d40d:0:b0:33a:33be:9c1e with SMTP id n13-20020a4ad40d000000b0033a33be9c1emr4627230oos.96.1651526031874;
        Mon, 02 May 2022 14:13:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o11-20020a54478b000000b00325cda1ff93sm2771256oic.18.2022.05.02.14.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 14:13:51 -0700 (PDT)
Received: (nullmailer pid 1763244 invoked by uid 1000);
	Mon, 02 May 2022 21:13:50 -0000
Date: Mon, 2 May 2022 16:13:50 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: etienne.carriere@st.com, arnd@arndb.de, Ahmad Fatoum <a.fatoum@pengutronix.de>, Marek Vasut <marex@denx.de>, soc@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: clock: stm32mp1: describes clocks if
 "st,stm32mp1-rcc-secure"
Message-ID: <YnBJjhv6uu2USIUs@robh.at.kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-3-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422150952.20587-3-alexandre.torgue@foss.st.com>

On Fri, 22 Apr 2022 17:09:46 +0200, Alexandre Torgue wrote:
> In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
> security support hardened), "clocks" and "clock-names" describe oscillators
> and are required.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Reviewed-by: Rob Herring <robh@kernel.org>
