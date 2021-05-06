Return-Path: <SRS0=m2II=KB=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF47C433ED
	for <soc@archiver.kernel.org>; Thu,  6 May 2021 21:06:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 94CAA61154; Thu,  6 May 2021 21:06:52 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F33610E7;
	Thu,  6 May 2021 21:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F33610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-ot1-f52.google.com with SMTP id u19-20020a0568302493b02902d61b0d29adso5348484ots.10;
        Thu, 06 May 2021 14:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8NvB2tyPckkIgewV0lmTw4rJstRnCjKDzoP9iBSvnfQ=;
        b=OJ7DADXUvRRt1YQd5rKTtqMm96XYR4n4A9VaNfzQNbELwhmHljT4r9gjY7KrMvotzn
         /Jw+4fzy8tk0caKG3QHoVl7bXW8iHx/lzRD6xzA3lVJqsUjBjXrv02zOb9XJOdfx9HzB
         CH1mugk5ipKInYM20Y+071ubDBFkloWgX7//kc5zr8rh6c6fZj5tIjXW+EIiCJz6dbq8
         Eem2qt6VWwlmQHSZHmbfa+RuzKUkDnX71mQgoXZriwexBdWKfbh6XV5imbJtfcnR9Mlr
         r2P3s6W/2UCxc3TrEauPVU85XSLkL7yY3Li057Kpbud7WsHzIqTdSdR6EecIbj5TkXpA
         sQLg==
X-Gm-Message-State: AOAM532TWvbLld3P/2PqbP70J9dSfuPdsJoq0LQ+/05rHDbnFENN3m2u
	w421YzFHNKXP573H+hKzXA==
X-Google-Smtp-Source: ABdhPJwFIx0e8c86RcR2tVo7iJB2J6CR53YsYNw6wGVQ7XCn1k0eh+UfytGsFuiJoJspx6n2BQ/8Pw==
X-Received: by 2002:a05:6830:1690:: with SMTP id k16mr5270532otr.54.1620335211551;
        Thu, 06 May 2021 14:06:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k7sm729416ood.36.2021.05.06.14.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 14:06:51 -0700 (PDT)
Received: (nullmailer pid 801808 invoked by uid 1000);
	Thu, 06 May 2021 21:06:49 -0000
Date: Thu, 6 May 2021 16:06:49 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kaloz@openwrt.org, robh+dt@kernel.org, arnd@arndb.de, khalasa@piap.pl, linusw@kernel.org, linux@armlinux.org.uk, olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: arm: intel-ixp4xx: add welltech,epbx100
Message-ID: <20210506210649.GA801760@robh.at.kernel.org>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
 <20210504193457.4008384-5-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504193457.4008384-5-clabbe@baylibre.com>

On Tue, 04 May 2021 19:34:56 +0000, Corentin Labbe wrote:
> Adds welltech,epbx100 as a valid intel-ixp4xx board.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
