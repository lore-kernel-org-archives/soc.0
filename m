Return-Path: <SRS0=WbWG=NE=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A741C4338F
	for <soc@archiver.kernel.org>; Fri, 13 Aug 2021 18:58:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0EE9461038; Fri, 13 Aug 2021 18:58:08 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBC2A60FC4
	for <soc@kernel.org>; Fri, 13 Aug 2021 18:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBC2A60FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso389908ott.13
        for <soc@kernel.org>; Fri, 13 Aug 2021 11:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2ahbi0HxPkdDvGYRdzmdU3KAyAbBbSPVHz7hpfMgNRg=;
        b=hc8W7Q22JWlOzRmTFz8q1hNA6nYmYHmWHpSPhSUKYbARfJHDQHRDJa44qxbscqlzA9
         LP69y1kdRrJVMRajVozGlqNqVxSkGZVKVoNcACfO7pqWaCLUtzAwkaBsitXO+NGX8Jgi
         vQ/oP4ybJyIHM3Z2eAAqriVyUvlvSIZ0FmNDqZPdyCNyarFQiaQZsX5t4szLsBDptvZR
         nF7G+b788dQtAWvOkKEQmIxUKsXHJToVp6HBd6U1u/I5PxlWNsYzwCf6sy3kv0ljFuDE
         3lyNdRvy3Dft0aRSvpk1+62jw29gG5yoSbnmvon/+WVGXAIVpcJGaw+KXdHgbMKSZ/tk
         24kg==
X-Gm-Message-State: AOAM530LnoK+PuQHymP3jTOkCo86Ao9m7n3inngoEfjLOYVnoEfXOCUx
	Qp7S1owrMmelVX5u25KhEw==
X-Google-Smtp-Source: ABdhPJzHZj/ieyh/1MFb88kr2BlhZDymgMcPqE6HFAZ0U5SqKihtA60K+j/60g02HxtLR08j4ubh8A==
X-Received: by 2002:a05:6830:411c:: with SMTP id w28mr3166930ott.298.1628881087252;
        Fri, 13 Aug 2021 11:58:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j6sm431196ooj.11.2021.08.13.11.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 11:58:06 -0700 (PDT)
Received: (nullmailer pid 3864269 invoked by uid 1000);
	Fri, 13 Aug 2021 18:58:05 -0000
Date: Fri, 13 Aug 2021 13:58:05 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com, linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, olof@lixom.net, arnd@arndb.de, soc@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: ARM: at91: document exegin q5xr5 board
Message-ID: <YRbAvRPdU3qdwkPi@robh.at.kernel.org>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
 <20210805155357.594414-4-claudiu.beznea@microchip.com>
 <YRbAOYoRoMCtxuGL@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRbAOYoRoMCtxuGL@robh.at.kernel.org>

On Fri, Aug 13, 2021 at 01:55:53PM -0500, Rob Herring wrote:
> On Thu, 05 Aug 2021 18:53:53 +0300, Claudiu Beznea wrote:
> > Document Exegin Q5xR5 board.
> > 
> > Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

I take that back...
