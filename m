Return-Path: <SRS0=5ggH=TZ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70085C433F5
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 21:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E7E4C340EC; Mon, 14 Mar 2022 21:50:30 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7379CC340E9;
	Mon, 14 Mar 2022 21:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7379CC340E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id l18so12772875ioj.2;
        Mon, 14 Mar 2022 14:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CGEh5iCMps2XS5R44sd7XPYTqLJq0sP1C+L9zYhWYlI=;
        b=LVmUwJEJvzEpkibxwH1Bh92L9p35EO4FsAlPZjGWDfoQQJulQAgy7abk14ePSvnjNa
         oB9pkiQzQ7yuj67zSyST0+fjZZFd1pRunOu5s1OFmrtA6+PLtP9W5d8LufSaPSJsOQkQ
         9bJxaA1LTdrRQJMiQy59msoVwRLTdpvFyKOx9dKUSpVVUy1WNWQ/aGto9cbY2HbqKV6P
         8hL2Q853E+bG6DZ7mMuPBW8Bo2kjRlAVlEAltkkTXBEV2p2TM7WcEzpBXX5g54cGb4+9
         1gs5+yrRwP61YYjUlA5D9HwR8qV6tLjLyEH4VxA0UxHhMjCdWIoKNpvtgmDQeY+JzUEz
         7UkA==
X-Gm-Message-State: AOAM531utZoUDmmk/wd0qbiWievOZN70FZw7Otek8zPfUNUYuR1yscRL
	KKgKdgXcpGgRdrMftUtC8g==
X-Google-Smtp-Source: ABdhPJweO3VWhgxdwP7gQ1lIiOQaKbWSgKSaZY/XLgS/m78dLb5ar/Nckf4Npe8/Eq4Iw9CzsqdXRQ==
X-Received: by 2002:a02:bb8c:0:b0:317:b015:1998 with SMTP id g12-20020a02bb8c000000b00317b0151998mr21388886jan.134.1647294628516;
        Mon, 14 Mar 2022 14:50:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c12-20020a056e02058c00b002c63f71c7dbsm9137733ils.56.2022.03.14.14.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 14:50:27 -0700 (PDT)
Received: (nullmailer pid 623447 invoked by uid 1000);
	Mon, 14 Mar 2022 21:50:24 -0000
Date: Mon, 14 Mar 2022 15:50:24 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Frank Wunderlich <linux@fw-web.de>, devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, Peter Geis <pgwipeout@gmail.com>, Michael Riesch <michael.riesch@wolfvision.net>, Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: Re: [PATCH v6 3/6] ARM: dts: spear13xx: Fix sata node name
Message-ID: <Yi+4oN5xuS2pq0ru@robh.at.kernel.org>
References: <20220311210357.222830-1-linux@fw-web.de>
 <20220311210357.222830-4-linux@fw-web.de>
 <20220314034940.rxkgue2kllnqhucp@vireshk-i7>
 <trinity-0f1389c2-6d2b-4499-a2fc-3cb93f4d09cb-1647272336831@3c-app-gmx-bap56>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <trinity-0f1389c2-6d2b-4499-a2fc-3cb93f4d09cb-1647272336831@3c-app-gmx-bap56>

On Mon, Mar 14, 2022 at 04:38:56PM +0100, Frank Wunderlich wrote:
> Hi,
> 
> thanks for for checking the spear-patch.
> 
> > Gesendet: Montag, 14. März 2022 um 04:49 Uhr
> > Von: "Viresh Kumar" <viresh.kumar@linaro.org>
> >
> > On 11-03-22, 22:03, Frank Wunderlich wrote:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > > 
> > > After converting the binding to yaml the node name does
> > > not match the standard pattern, change it.
> > > 
> > > arch/arm/boot/dts/spear1340-evb.dt.yaml: ahci@b1000000:
> > > $nodename:0: 'ahci@b1000000' does not match '^sata(@.*)?$'
> > > 	From schema: Documentation/devicetree/bindings/ata/ahci-platform.yaml
> > > 
> > > Fixes: 07658d9a659b ("SPEAr13xx: Add dts and dtsi files")
> > 
> > I don't think this is correct. The above patch is correct. The first
> > patch in this series changes the names and that's where things break.
> 
> it's right that my binding will break it, but the nodes are not named the right way.
> And i used the commit that introduces the wrong node-names.
> Maybe fixes-tag is wrong in this case.

I'm pretty sure Viresh just meant the Fixes tag is not right.

Rob
