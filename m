Return-Path: <SRS0=rFA1=GN=gmail.com=oliver.graute@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9D0C433DB
	for <soc@archiver.kernel.org>; Sun, 10 Jan 2021 16:12:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F4075229C6; Sun, 10 Jan 2021 16:12:44 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A24F62250E;
	Sun, 10 Jan 2021 16:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A24F62250E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=oliver.graute@gmail.com
Received: by mail-ed1-f49.google.com with SMTP id b2so16335572edm.3;
        Sun, 10 Jan 2021 08:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Pkhzx66anNUURuXnoFRsV190plIqgcKOBoJUhFMocmU=;
        b=K+2hL02iuYOFg8kd0ZklVzbG/O4T9mljkKBUB1YX2jlvfzJ4uQD6Az6MyyUjAmdQJC
         Z//XO6w/rr0pDXzx/ThnqeNmaUsx7HKZ1azaVYOHoYXCNMHAwp7uPdEr91mGa+awx6ha
         yBjewBAJuEttZfef5AO1tkY9NyFE1jq54DjDWu+c7haeoH4CPutgBNR7mpO9GkLXTiJs
         K9HH+qxZuT8AvRpq14x2Q/FgYRWwKPRu6WQcOIl2Z3Sd37QguE1wTMSkHGlJyyFw7W+y
         egvNWe7FYngTuFauHvcUZWkQNsNJuHuwck4P8GI/IE9+KpO09MdExL+nMI+kHsxIR2+J
         tA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pkhzx66anNUURuXnoFRsV190plIqgcKOBoJUhFMocmU=;
        b=rMiK8miDrONM/O/1UTEFKZmOGIxRcqavba6bfVJbsDdrsl6i2tUyX0Vh2bPhu5bPyo
         QBEGjTnATjEpliE3MWcvuOCZG1sc7gab7+T2P/yJUs0mFJrkhmZYytuIOkKd8SNdGg5X
         4DzOm1/Wu4LdHdR7DVt//Gdy/imazFgry6OJV2Pgw3i4dPoIXJZdfNtZG86/mTP7uA0j
         yvfA5ABwBmWqrjNWqnTmVFWPvetqmSDj6U9Ep2pK12bUwAXoFZcBVjM7Zvnoq7oKzI9X
         hCZ5+SdqWQ4JCq+B4i+RkR3CK4h9QxBRVvB7T1hIiWUFU7j3hugNRwiH4VGgfO5gFHwg
         YcLQ==
X-Gm-Message-State: AOAM532wvgaijTJRILNJBnZdW/oAM6ekIyTyMtncQsLvaP6QgZTNdmlt
	U4z6Pfi1H+JGN81aCS/hEmk=
X-Google-Smtp-Source: ABdhPJz4NlXIH44Up6kriEihCMzY49jx4itdsN3hhYT71mxqlsAmJRROm2hnw0VwJGDR/pPev9+yNg==
X-Received: by 2002:a50:f089:: with SMTP id v9mr11933883edl.353.1610295163130;
        Sun, 10 Jan 2021 08:12:43 -0800 (PST)
Received: from localhost (ip1f10d3e8.dynamic.kabel-deutschland.de. [31.16.211.232])
        by smtp.gmail.com with ESMTPSA id t12sm6534378edy.49.2021.01.10.08.12.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Jan 2021 08:12:42 -0800 (PST)
Date: Sun, 10 Jan 2021 17:12:32 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>,
	Neil Armstrong <narmstrong@baylibre.com>, parthitce@gmail.com,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 2/3] ARM: dts: Add support for i.MX6 UltraLite DART
 Variscite Customboard
Message-ID: <20210110161232.GB7264@ripley>
References: <1610144511-19018-1-git-send-email-oliver.graute@gmail.com>
 <1610144511-19018-3-git-send-email-oliver.graute@gmail.com>
 <CAOMZO5AGro=rGTPV0CAWPh_=Q9KqCYWO199FWn57xBc=eUWdog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5AGro=rGTPV0CAWPh_=Q9KqCYWO199FWn57xBc=eUWdog@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

On 09/01/21, Fabio Estevam wrote:
> On Fri, Jan 8, 2021 at 7:23 PM Oliver Graute <oliver.graute@gmail.com> wrote:
> 
> > +       panel1: panel-lcd {
> > +               compatible = "sgd,gktw70sdad1sd";
> > +
> > +               backlight = <&backlight_lcd>;
> > +               power-supply = <&reg_touch_3v3>;
> > +               label = "gktw70sdad1sd";
> > +
> > +               display-timing {
> 
> If you pass the compatible, then you don't need to add the
> display-timing in the device tree.

thx I`ll drop it

Best Regards,

Oliver
