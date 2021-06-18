Return-Path: <SRS0=HVze=LM=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E3CC48BE8
	for <soc@archiver.kernel.org>; Fri, 18 Jun 2021 21:06:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 65B88613B4; Fri, 18 Jun 2021 21:06:39 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3196661261;
	Fri, 18 Jun 2021 21:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3196661261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oi1-f182.google.com with SMTP id q10so11964297oij.5;
        Fri, 18 Jun 2021 14:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w7lyGyrFAML0Yig1eUfs9PBn3aotrCMVHhnAEEshvHs=;
        b=iICv+9HMITQLLGMEGX6Ub1rjxZIsSmL0M8kVhasKe9Xqui58HLN4b0EyCqAIKypSXW
         4hlvpppPbdcsUUsGHctW35gfWQyz2znmOzgzUz1GX/WG3L+EAnqkLTgfHT5QVl67lVQ7
         GZ3ideoPrtmx8pvkaIUMVHP+T7CiI1dcMDcqnEH5huM9GQgvR9ixGBgvUrJ7OiLwAwIv
         YjGIwgpt9ubI4z2bTa9r0kKuLJ5t0BOzXySrTwj7yXVkt60PoMXEocOT0aEW6pEiFZVV
         yjaLJjDCr4Xh3QgRh/zdhRkqKbHcy4Yvn/K9PiHtP2moxncPY0q0qHGBMJapqZyd7/ia
         186g==
X-Gm-Message-State: AOAM531AbN6+CKUfbmCD2Xxd0Ce1DMzOf/7DE/XhfslFF4NyzB/NOlXX
	ShJVM6qWGr5YnfaHgzpKWw==
X-Google-Smtp-Source: ABdhPJy9BVM8JnW1fklyNIsJf+HjmUAJv6l+X1dfrWJd5kHxG8MZpWxMuP+Z3rmPjas11wLLEtoWDg==
X-Received: by 2002:aca:fc91:: with SMTP id a139mr15981093oii.12.1624050398597;
        Fri, 18 Jun 2021 14:06:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 129sm2063231ooq.34.2021.06.18.14.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:06:37 -0700 (PDT)
Received: (nullmailer pid 2874290 invoked by uid 1000);
	Fri, 18 Jun 2021 21:06:32 -0000
Date: Fri, 18 Jun 2021 15:06:32 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>, Fabio Estevam <festevam@gmail.com>, Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: vendor-prefixes: Add an entry for
 SKOV A/S
Message-ID: <20210618210632.GA2874235@robh.at.kernel.org>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
 <20210609121050.18715-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609121050.18715-3-o.rempel@pengutronix.de>

On Wed, 09 Jun 2021 14:10:48 +0200, Oleksij Rempel wrote:
> Add "skov" entry for the SKOV A/S: https://www.skov.com/en/
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
