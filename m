Return-Path: <SRS0=/PWc=KH=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1014DC433B4
	for <soc@archiver.kernel.org>; Wed, 12 May 2021 20:06:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D2267613F7; Wed, 12 May 2021 20:06:07 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FEA061412
	for <soc@kernel.org>; Wed, 12 May 2021 20:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FEA061412
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-ot1-f49.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso21660138otn.3
        for <soc@kernel.org>; Wed, 12 May 2021 13:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jJ6/WIxX35/cgvS4ItB41jw5rTb0BK4tQYBXu93W67Y=;
        b=aXCs/Ier2AcpgmQot/RR/ZmGkTpMKqm7r2s0dDOLFFMRJ9vuuTszUY3iwDJ0y4/H74
         ByBRFVas1pQclWG5BZQsaL7ogGZkjGkkPqSvU/ZTfUK+BAYSrFFCrPqyO4GqXLOpnQYA
         00Elm2Z/iUGlhcRlZsypV+r+snpcZP1I81zvSJa+jD+SL3bunC1YOpq7ivaCUCfCl95r
         sBRRG5UfMr74dqBymTmdDatdYossZ5f6zrjpVjYJAf80pikvsUQy6SaHY8fVZfuL94QA
         HJLX7sLdCb86sAcCuTjuoVDX8ygQNNriEji/8QRR4ne+PFKxBzVA5wHJfq9LaTZlcBse
         hreA==
X-Gm-Message-State: AOAM530LJOH/guAZxaplhg733hLLuBIDUNIf2djV+1G7UX/Maz1kuaPn
	bJCe6/X7mjjoKTRCt6Wb+w==
X-Google-Smtp-Source: ABdhPJzKpxijVnBg01nSUqX6XBNqlBFU569+S2ZMwpc/HM4IjbTww8FstbHf9rltb5ioWwGcfA7oIQ==
X-Received: by 2002:a9d:7189:: with SMTP id o9mr622813otj.180.1620849966762;
        Wed, 12 May 2021 13:06:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l11sm214762ooq.44.2021.05.12.13.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:05 -0700 (PDT)
Received: (nullmailer pid 2451241 invoked by uid 1000);
	Tue, 11 May 2021 19:16:53 -0000
Date: Tue, 11 May 2021 14:16:53 -0500
From: Rob Herring <robh@kernel.org>
To: Eugen.Hristev@microchip.com
List-Id: <soc.lore.kernel.org>
Cc: alexandre.belloni@bootlin.com, Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com, soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com, Codrin.Ciubotariu@microchip.com
Subject: Re: [PATCH v2 2/4] ARM: dts: at91: add sama7g5 SoC DT and sama7g5-ek
Message-ID: <20210511191653.GA2446068@robh.at.kernel.org>
References: <20210511071223.71379-1-eugen.hristev@microchip.com>
 <20210511071223.71379-2-eugen.hristev@microchip.com>
 <070939b0-ec77-a135-b351-4c4c8bc543f0@microchip.com>
 <YJo0PY2E36v2Pqz/@piout.net>
 <8c74596c-6d23-c822-fc2e-6cbb984fa4fd@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c74596c-6d23-c822-fc2e-6cbb984fa4fd@microchip.com>

On Tue, May 11, 2021 at 09:03:37AM +0000, Eugen.Hristev@microchip.com wrote:
> On 5/11/21 10:37 AM, Alexandre Belloni wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 11/05/2021 07:18:31+0000, Eugen.Hristev@microchip.com wrote:
> >> On 5/11/21 10:12 AM, Eugen Hristev wrote:
> >>> Add Device Tree for sama7g5 SoC and associated board sama7g5-ek
> >>>
> >>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >>> [claudiu.beznea@microchip.com: add clocks, ethernet, timers, power]
> >>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> >>> [codrin.ciubotariu@microchip.com: add audio]
> >>> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> >>> ---
> >>
> >> Changes in v2:
> >> - fixed license
> >> - fixed warnings for make dtbs (changed ahb/apb to just soc)
> >> - changed some node names as suggested
> >> - removed some okay status properties
> >> - addressed cpu node by label
> >> - removed stdout path
> > 
> > Why would you remove stdout-path? The solution was to remove The console
> > parameter from bootargs, especially since you don't know what name the
> > console device will have depending on CONFIG_SERIAL_ATMEL_TTYAT.
> 
> Ok, sure, I will add it back and remove console=...
> 
> I will wait to see if Rob has anymore comments before preparing a v3.

No, nothing else.
