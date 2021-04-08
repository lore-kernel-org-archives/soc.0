Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3179BC433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:16:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EC05161163; Thu,  8 Apr 2021 20:16:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3DC561159;
	Thu,  8 Apr 2021 20:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617912967;
	bh=Vecg9KIUrMwTeNuxTL2SM02Hu9b26BNOPOHh2Q45wrA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HFPqRs1Wo2bVkTNAdINzjWtFpnw6+YTpGZ0rYHPoMZBnS41pep2MHDMXe/8OGOl3X
	 LwK9liIB+YlQuYXSRIFbFdsMoJuTofiadBITXpUiLBBGWLUKcbpdgYPJeHPDc0b+C5
	 FV05aqcPIUHM6nM52X4Z5qrFj7UU182jMQtsxlOXnL4rAtxchWFQkM9mSI+0PamVyQ
	 nY07luvZcF3tHDOTkqIdDhYBd98XvxtwAt53LcjfLTo2rX9ls36pW1Rmf52zWEHuFz
	 76uiHGPOx0Cb+Kr0scHbaEIAlaCJNyg4rN4Hip5VGDls29My3z1bFqoI9tPRP1KcpG
	 i7L0cfEqk/5Eg==
Received: by mail-oi1-f178.google.com with SMTP id m13so3451176oiw.13;
        Thu, 08 Apr 2021 13:16:07 -0700 (PDT)
X-Gm-Message-State: AOAM532JLtpBSz6wOhiLOh92q5Z6v0tI+tp44do226Y+9pZTAPmUQnEn
	pu/GnUgZBgdOvRMpvVixvwS8jbXrSAGjmrLyJ0w=
X-Google-Smtp-Source: ABdhPJy9/NcBZP2ckZSF0eIQNMconnpaO2naL6Olb8+ApOOEdJ6ODFyzLr1Ky5rfTyg/l6/bS4lMM2m3U5wV3GUJh1w=
X-Received: by 2002:aca:5945:: with SMTP id n66mr7375236oib.11.1617912967143;
 Thu, 08 Apr 2021 13:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210407114415.13180-1-nicolas.ferre@microchip.com>
 <161789493817.1630479.5024717274217057698.b4-ty@arndb.de> <71b2bd27-0d3b-3331-4f79-85b22594e20b@microchip.com>
In-Reply-To: <71b2bd27-0d3b-3331-4f79-85b22594e20b@microchip.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 8 Apr 2021 22:15:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1dyccHquEoSv4kECw-=RKNQAFVQap-DYTX-sDfwEPTGQ@mail.gmail.com>
Message-ID: <CAK8P3a1dyccHquEoSv4kECw-=RKNQAFVQap-DYTX-sDfwEPTGQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: at91: dt for 5.13
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Linux Kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 8, 2021 at 6:35 PM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
> On 08/04/2021 at 17:24, Arnd Bergmann wrote:
> Oh, got it: it's the upper case letter withing the etm hex address. I
> used this one to mach what was done in the reg property. I'm fixing both
> of them and sending the patch to the ml right now.

Ok

> Tell me if I add it to a subsequent pull-request or if you prefer to
> take it the soonest in order to not generate additional warnings upstream.

I'd like to have it before the merge window, but don't bother making it
an additional pull request if you already plan for another pull request with
5.13 material.

Thanks,

       Arnd
