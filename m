Return-Path: <SRS0=yWgq=OM=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ED2C433EF
	for <soc@archiver.kernel.org>; Wed, 22 Sep 2021 20:51:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1FCF660555; Wed, 22 Sep 2021 20:51:43 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E368F6112F;
	Wed, 22 Sep 2021 20:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E368F6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso5522828otu.0;
        Wed, 22 Sep 2021 13:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K0e+QIxMALBQhCsB26FgEJQQDulL1SytM9MRZsK5UAg=;
        b=2jOduaCB9deUVEOqVs3lOi5TS4iDGfXh9tVtCqY3wbQFCUXTAk8nk3uHDEcfP5HMlK
         CO2ayjiD5zgA9QNzYHmSp2rOqLa5s+RomdzXoL/HJUMuHf1y+P1zwRdc8WpHCNBXp45P
         0xjDZf0dfGH1IkMaoo7Vt8PIPyAaZscNp5k9X3cbWdHs+6nM5G6XDmo6nBkePWphisPV
         /bbyEMnNXrTkEr9RB/3khWtEte6IPj3EzF96e0+0WYW4Oq1KJO4N7sQh2Kl1dFr1xn/K
         Gg/8LbQ9XddOdT74WrDQhY+4d8ydaX16clbxPRBD+bVgVCaZNm0xp/axFV3gOuvguST8
         WCug==
X-Gm-Message-State: AOAM532bh4OL8tlwce70VmXQ8Ykx2wFhZrMZzBgquS4KYbQj9riElCDy
	/rwpeQ2EfEeFpCkDn5DkCA==
X-Google-Smtp-Source: ABdhPJy6OpIj46BmIEk9sdynWbEHNejhn0TTMdLRFY3I5UsBmDoeryrQJAxSoYcMR2hPTg5RzxfBMg==
X-Received: by 2002:a9d:3e5e:: with SMTP id h30mr1018357otg.255.1632343902316;
        Wed, 22 Sep 2021 13:51:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p2sm796463ooe.34.2021.09.22.13.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:51:41 -0700 (PDT)
Received: (nullmailer pid 1271985 invoked by uid 1000);
	Wed, 22 Sep 2021 20:51:41 -0000
Date: Wed, 22 Sep 2021 15:51:41 -0500
From: Rob Herring <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
Cc: kernel@pengutronix.de, olof@lixom.net, krzk@kernel.org, linux-imx@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, s.hauer@pengutronix.de, leoyang.li@nxp.com, linux-kernel@vger.kernel.org, soc@kernel.org, arnd@arndb.de
Subject: Re: [PATCH 1/4] dt-bindings: arm: fsl: Add E70K02 based ebook readers
Message-ID: <YUuXXRPyIDQseQhk@robh.at.kernel.org>
References: <20210918141627.2142457-1-andreas@kemnade.info>
 <20210918141627.2142457-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210918141627.2142457-2-andreas@kemnade.info>

On Sat, 18 Sep 2021 16:16:24 +0200, Andreas Kemnade wrote:
> Add the Kobo Libra H2O and Tolino Vision 5.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
