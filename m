Return-Path: <SRS0=ahOE=KO=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8940BC433B4
	for <soc@archiver.kernel.org>; Wed, 19 May 2021 19:50:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6987B6105A; Wed, 19 May 2021 19:50:44 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EA2D600D1;
	Wed, 19 May 2021 19:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EA2D600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oi1-f170.google.com with SMTP id z3so14204743oib.5;
        Wed, 19 May 2021 12:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kx03fvdnhSjjspr5z254cIlvTfBxI5CrgzMJyPL5sC8=;
        b=lfbFmfd2HCwt+SOdwOAllj4cbxNFMv4V8XaJLGp1n4eLEo6I6TqW5k/E8USbW9slo/
         7oNPDq0Ao5q8o3cpW0kWX79QPiTBqtDhG7K2d1prCkJ53feHZHcEd1xOa1VcpJC3LCve
         YfIg0xMK7vkg7ZlCrOody2qLPhn4YV4pCdvUyOnTtj3KAYWsSBocqQJjHI+/lpxn/REF
         35wE2bwNJScP4+GvuUZ3z+uOGw3bohYcICarQitMFmu1P2WcQDOy4vzpHQ7aZzUHpRSB
         GF9Cjs2VzL4YGCNKpj7W1Fl3rlErYI0prsRSEnYKPooaPstDfWQ/2sfFFykhXs8aIs+U
         RIOg==
X-Gm-Message-State: AOAM532E/rRTxROgExQGKEmq3wcL7rdBHOuwUgwSkEMn5MzIvVp/SgWb
	dU2vm92WR2dBwn1OBl/1Cw==
X-Google-Smtp-Source: ABdhPJy6M4FHoTzsYmeTAl5vxwq7ZJTk3MzyMOfhxI/Egom/A/S5/+VLjz+C/vNSpN9gJ3u2ntpNLw==
X-Received: by 2002:aca:4b91:: with SMTP id y139mr787385oia.78.1621453843557;
        Wed, 19 May 2021 12:50:43 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o20sm148796otl.2.2021.05.19.12.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 12:50:42 -0700 (PDT)
Received: (nullmailer pid 3535122 invoked by uid 1000);
	Wed, 19 May 2021 19:50:41 -0000
Date: Wed, 19 May 2021 14:50:41 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: linus.walleij@linaro.org, olof@lixom.net, linux-kernel@vger.kernel.org, soc@kernel.org, ulli.kroll@googlemail.com, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: add vendor prefix for ssi
Message-ID: <20210519195041.GA3535062@robh.at.kernel.org>
References: <20210517193205.691147-1-clabbe@baylibre.com>
 <20210517193205.691147-4-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517193205.691147-4-clabbe@baylibre.com>

On Mon, 17 May 2021 19:32:03 +0000, Corentin Labbe wrote:
> Add vendor prefix for SSI Computer Corp (https://www.ssi.com.tw/)
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
