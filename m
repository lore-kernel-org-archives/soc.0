Return-Path: <SRS0=YkL8=N6=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFDAC2BD09
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21328C32786; Fri, 28 Jun 2024 21:44:48 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23107C116B1
	for <soc@kernel.org>; Fri, 28 Jun 2024 21:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 23107C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c2dee9d9cfso756610a91.3
        for <soc@kernel.org>; Fri, 28 Jun 2024 14:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719611086; x=1720215886; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DubuFETnT0dyqatA7lSmZY+Vs7DIyyvK1no9Y8gOx38=;
        b=K+YCMxN7XH4MhJNiWXtz5KBURGXYQSbvKsvcd53mUO3H92PSRVVhtbILbPa7DpmQF5
         afHWnURxdJLX2R+Fb8we8+TkP1H2e9MO4HziDj1rpRt3/N1sv7wPTmm9hs1nokbxTAeO
         1CI+A4oyA5NyTpcpwt5jh74wcOAaZ+zuGXuLMm2l3s4tUlWzRsfC0K19mXt+/ZJy6rqh
         f8CzRBTsNrv8jwR8rpH+g4AY/yuR6Of1gj2AgWG7zVCqTRg+he1A4qEYO4eL9+XcILia
         OnxHeQPO60IsEpoNWuO1Ul2rp81Po6epXKj5IyvYuLrdzwoTWBNU6SHmdHJ6stxWwFRC
         DApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719611086; x=1720215886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DubuFETnT0dyqatA7lSmZY+Vs7DIyyvK1no9Y8gOx38=;
        b=ngIA/PhoFj3E9TAdX7UFS+561UnVr0Xq8vrOsOBMuGKJui0zIM4WjB60kbTtbi9INi
         GqG0WvD93mdjJa+W4nviAQMs0KSWJIKHnPfD3d8Kq8yqzXoIcyAhKJpi21z9/uQYsSqb
         ZhqknMPclT4LFrvgpRgk/caNVjSAI9e+D51XKG/RLA4A/l4696ooRhVgeCz0ureIS31r
         wOaLIsuJCNgT9lX+Ybwwg48SFc18ooKXkUCg1oVH6c0Bqe8cRFPqgBb1atD5b5aKWBYD
         cZK7qId3ivUlB4oJanRq+62cVym6SXKk58fJU6WvsUs8Hn9G5KNcC6conKgl0Ea5DIIZ
         athA==
X-Forwarded-Encrypted: i=1; AJvYcCXVXwGhO1/WSsczlntSbUPA3Zdm+kYvImAhHKvy0h6BCYaUOHte4+tse+uBY+Dg9yVOkUCZHssg0Op9hf2Bdg==
X-Gm-Message-State: AOJu0YzbRZNRoLIJId3JicB6pj+S/pI9Q95H1r3UkYYeEL8bbkE2v4+J
	sgW/UNosZf1/EmawGAFRJ47uZKO0ABdKf9VWnDQPnnppSl0bkWTf
X-Google-Smtp-Source: AGHT+IH+5VYC5V34ZB3U73ePclfXnKCTmbEYsVuuuFk/T706oMclVdzLXX8sga4PNh1EMwTZOR/SUQ==
X-Received: by 2002:a17:90b:a50:b0:2c8:880:fba5 with SMTP id 98e67ed59e1d1-2c86146d12bmr17092067a91.34.1719611086103;
        Fri, 28 Jun 2024 14:44:46 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9c98:1988:ce15:c0ac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e99b1sm2134010a91.54.2024.06.28.14.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 14:44:45 -0700 (PDT)
Date: Fri, 28 Jun 2024 14:44:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] ARM: pxa: use software nodes/properties for GPIOs
Message-ID: <Zn8uywbvZDDVSjT0@google.com>
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
 <ed9dd921-56a6-48cf-9f25-b8bb079c4249@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed9dd921-56a6-48cf-9f25-b8bb079c4249@app.fastmail.com>

Hi Arnd,

On Fri, Jun 28, 2024 at 10:59:53PM +0200, Arnd Bergmann wrote:
> On Fri, Jun 28, 2024, at 20:08, Dmitry Torokhov wrote:
> > This series converts legacy pxa boards (spitz, gumstix) to use software
> > nodes/properties to describe various GPIOs instead of relying on GPIO
> > lookup tables. The benefit is that structure and behavior is closer to
> > DT-described GPIOs.
> >
> > The very first patch ("ARM: spitz: fix GPIO assignment for backlight")
> > is actually a fix that IMO should be applied sooner rather than later,
> > the rest of patches are enhancements. The reason it is sent with the
> > rest of the series is that later changes contextually depend on it.
> >
> > The last patch ("ARM: spitz: Use software nodes for the ADS7846
> > touchscreen") soft-depends on corresponding changes by Linus Walleij to
> > the ads7846 driver in input tree. It compiles without it, but the device
> > will not sync with display refreshes. I have created an immutable branch
> > (branched from v6.9) at:
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ib/ads7846-hsync
> >
> > in case you wish to pull it in.
> >
> > Regretfully it was only compiled as I do not have access to the relevant
> > hardware.
> 
> Hi Dmitry,
> 
> I'm happy to pull these in directly, hopefully with some extra
> review or ack from the maintainers. If there are no negative
> comments, feel free to resend them to soc@kernel.org for me
> to pick up.
> 
> Is your goal to of the series to eventually convert all
> gpio descriptors over to software nodes, or are you working
> towards converting all of mach-pxa to DT?
> 
> In the latter case, note that the reason we kept these
> specific board files is that they have reasonable support in
> qemu and you can probably figure out how to test them if you
> try hard enough. I have not tried myself though, and there is
> a high chance that current kernels won't boot without extra
> fixes.
> 
> If your goal is to change all board files to software nodes,
> I think we should take a step back, since most of those boards
> are likely to get removed anyway. Two years ago, I removed
> almost 90% of the board files remaining at the time after
> showing that they were pretty much all unused. I kept the
> ones that either had known users, or that someone wanted to
> keep for some reason and work on doing the DT conversion.
> For most of these (including PXA), there has been no work
> on this in the past two years, so I think we should ask the
> same question again and see which ones we can just remove
> this time.

I would like to eventually switch everything to the software
nodes/property entries. The GPIO lookup tables were introduced before we
had software nodes and were really convenient way to describe GPIOs on
non-ACPI non-DT boards. However now that we have software
nodes/properties we can move away from both custom platform data and
lookup tables in the board code and remove platform data support from
the drivers, unifying the driver behavior.

I am not in any rush with this, so if some boards are on a cutting block
I am happy to wait. I started poking at Spitz and the rest of mach-pxa
because Linus W sent out a patch to ads7846 ;) and I also remembered
that you already dropped bunch of PXA boards that were no longer
relevant so I assumed spitz and gumstix still have some use.

Could you tell me which ones are likely to stay vs ones that might go? I
think arch/arm/mach-s3c/mach-crag* is staying? jornada720?

Thanks.

-- 
Dmitry
