Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08C7C433F5
	for <soc@archiver.kernel.org>; Sun, 10 Apr 2022 07:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADC47C385AF; Sun, 10 Apr 2022 07:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE34C385A8;
	Sun, 10 Apr 2022 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649577466;
	bh=8zaebVDc2NFCINBvgIFPsNK2GMZVYv+yDgNnsit+9kk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=m9D7v3f2gfy+4OyOF9wA25l1F8JcFhW7YgZDOdHu8aKIt5yz5qB0KgneXv7aKAr5O
	 esQTad6ocZKBbSazb90kDhFdYmpXR3t9kOySo4GTIVBz7CH1TwuJB3VRypbAN9HSUQ
	 KTsxdyLTHOeOFuvpVRgzz2/BqxpX5Q4ylXwbGe6inX73I+UGygEhWtzqLx30DM1Lho
	 XuZLfdgdDFi3v+M2Sk3O76GDdUPQnXdjuGySlCdkdxRj1aLOZmMRoWVwVJXCJRlpZX
	 4PtS/2RMzEcCNcaIx23wF5CH7JULkNL7OuNF7mpeg2t7lpqyAjPc84JsUcmgLHCasC
	 SMD0B5SGZE6Mw==
Received: by mail-ot1-f47.google.com with SMTP id n19-20020a9d7113000000b005cd9cff76c3so9222600otj.1;
        Sun, 10 Apr 2022 00:57:46 -0700 (PDT)
X-Gm-Message-State: AOAM531jQx3nzfaYb3R0PDW5vECdjQGJYtMeWbbMUzicm63bqhfIYEhG
	+rb6DYRQuFRfgiP9xss2kw0hwxdphX0lZIntCkc=
X-Google-Smtp-Source: ABdhPJzchhEM3rkRq6hS7L07HRfAO8+7ldlOFACPdjQosvpPlTtldbb3aTQtS+yr6xPKbOOSxuB8ute8PU/VJs4APnM=
X-Received: by 2002:a9d:608b:0:b0:5b2:53a1:235f with SMTP id
 m11-20020a9d608b000000b005b253a1235fmr8947549otj.199.1649577465729; Sun, 10
 Apr 2022 00:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
 <20220326042313.97862-4-singh.kuldeep87k@gmail.com> <20220410075355.GQ129381@dragon>
In-Reply-To: <20220410075355.GQ129381@dragon>
From: Shawn Guo <shawnguo@kernel.org>
Date: Sun, 10 Apr 2022 15:57:35 +0800
X-Gmail-Original-Message-ID: <CAJBJ56LCWttdM65XaBjYTrQ=9UWycSkaUX-+LsmPXz-+OLqbFw@mail.gmail.com>
Message-ID: <CAJBJ56LCWttdM65XaBjYTrQ=9UWycSkaUX-+LsmPXz-+OLqbFw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: ls1043a: Update i2c dma properties
To: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, 
	Mingkai Hu <Mingkai.Hu@freescale.com>, Hou Zhiqiang <B48286@freescale.com>, 
	Wenbin Song <Wenbin.Song@freescale.com>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 10, 2022 at 3:54 PM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Sat, Mar 26, 2022 at 09:53:11AM +0530, Kuldeep Singh wrote:
> > Reorder dmas and dma-names properties for i2c controller node to make it
> > compliant with bindings.
> >
> > Fixes: 6d453cd22357 ("arm64: dts: add Freescale LS1043a SoC support")
> > CC: soc@kernel.org
> > Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
>
> Applied 3/4 and 4/4, thanks!

Ignore it.  They have landed into v5.18-rc1.
