Return-Path: <SRS0=2JgO=6W=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462D1C64ED6
	for <soc@archiver.kernel.org>; Sun, 26 Feb 2023 17:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1091C4339B; Sun, 26 Feb 2023 17:22:54 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2ABD2C433EF
	for <soc@kernel.org>; Sun, 26 Feb 2023 17:22:54 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id a1so2752976iln.9
        for <soc@kernel.org>; Sun, 26 Feb 2023 09:22:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZbAAW2LhN0XjJxVgdRFWlox+ztnO/qtqmkajxnI7Dg=;
        b=khLNEBYSyDTu+55ce09Yw65PaNKhp632fD7ik9W9ttHPNJug4ndyUSYk2WgRN4zo9e
         PssgJ86EZIoKd/miXSgnedbgqxKYhS7VOEL3SWlo/xfqM2ExQlSvc3itRVbq0blkX6Qg
         zXNuxetF6AdMcP0Q8C7SHe4ysMUuNBJOS2zhYBSnNbPT9GIoTXN4EKZLF4LD5YGR/Be/
         IyETaAC76RoDH9XFrLVcK6OQSki7Q1brdbe2UB9IxHl8GZqmLIHiPge2Fqga81Sd+ESY
         K1kwpFCAFxOx1F341j0emvRNRqXMMStpm/rWVRS/EdPwoUsvHu/v8UXL4wiizukr8X/J
         npUg==
X-Gm-Message-State: AO0yUKUth+3mS1Bvmhrwq6vMiFWKXZSuzc8m2xmCbUoHrc2xZnr9MkEo
	sDdPIzA+i0Z14wkHraNdjgBMhm6Dpg==
X-Google-Smtp-Source: AK7set9Ei4vkCXLk+pyPw9tD9bTD0a5PZqFdVS5ekfmJqFXIZlbAF/z0U2hZkghLu9Q/2ShzJ1RSzg==
X-Received: by 2002:a05:6e02:18cf:b0:313:dd5c:e55f with SMTP id s15-20020a056e0218cf00b00313dd5ce55fmr4986365ilu.6.1677432173112;
        Sun, 26 Feb 2023 09:22:53 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id f17-20020a92cb51000000b003141b775fbasm1413045ilq.16.2023.02.26.09.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:22:52 -0800 (PST)
Received: (nullmailer pid 49214 invoked by uid 1000);
	Sun, 26 Feb 2023 17:22:48 -0000
Date: Sun, 26 Feb 2023 11:22:48 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
List-Id: <soc.lore.kernel.org>
Cc: Andrew Davis <afd@ti.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, soc@kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: omap: add phytec pcm-049 som
 and pcm-959 dev board
Message-ID: <20230226172248.GA47940-robh@kernel.org>
References: <20230222203847.2664903-1-colin.foster@in-advantage.com>
 <20230222203847.2664903-2-colin.foster@in-advantage.com>
 <dd67f7c9-0867-47d0-a201-9316908d9d62@ti.com>
 <Y/eTZONJh8QdJVP8@COLIN-DESKTOP1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/eTZONJh8QdJVP8@COLIN-DESKTOP1.localdomain>

On Thu, Feb 23, 2023 at 08:25:08AM -0800, Colin Foster wrote:
> On Thu, Feb 23, 2023 at 10:00:50AM -0600, Andrew Davis wrote:
> > On 2/22/23 2:38 PM, Colin Foster wrote:
> > > Add yaml documentation for TI OMAP devices for the Phytec PCM-049 SoM and
> > > the Phytec PCM-959 development kit.
> > > 
> > > Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> > > ---
> > > 
> > > v4
> > >      * New patch, based on a WIP from Andrew Davis <afd@ti.com>
> > > 
> > > ---
> > >   .../devicetree/bindings/arm/ti,omap.yaml      | 29 +++++++++++++++++++
> > >   1 file changed, 29 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/arm/ti,omap.yaml
> > 
> > How will this work if I add the same file? Why not take my WIP patch, make
> > the suggested changes from Rob, then have it as your first patch in this
> > series?
> 
> Is your WIP intended to convert all omap.txt to ti,omap.yaml? Or chunk
> off devices one at a time?
> 
> If the former, when your patch is done it should be a pretty simple
> rebase conflict resolution. If the latter (which feels more digestable)
> this offers that template. This was Rob's / Tony's suggestion, albeit
> before you sent your patch set.
> 
> 
> Anyway, I'm happy to do any of the following:
> 
> 1. Take Andrew's patches, add these references and re-submit.
> 2. Keep this set as-is (with the typo fix) and when Andrew's WIP is done
>    it should be an easy rebase before submission.
> 3. Wait for Andrew's WIP to be done, then submit with this update.
> 
> 
> I'd like to avoid #3 because I don't know where this might fall on your
> priorities list.

If you are willing to do #1, that's certainly my preference.

Rob
