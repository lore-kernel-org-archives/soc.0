Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B42C433F5
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 20:49:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DC017610E7; Thu, 21 Oct 2021 20:49:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C51C7610D0;
	Thu, 21 Oct 2021 20:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634849355;
	bh=N1XtE1OWTzAkiDLfZ5riecAxAc2dJiyFhKFD5km9U44=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=W6W1JGr9CKmc/VsaJ5+MRegEIym0kmy/BMbP2C2anBEoUDHps2poFFwuo9TDmwnDp
	 BkHbmAWo5Jaemhx/+wC9aAwybHvSUulzsBhkoTdTmsC8H4GBoLcuIfVtZXXS74Z933
	 eRYlubdcC/lvWyz3qETkeeQwI108MMv/2L/Ls0FOm+t34acN4QGjR4MbTVVSk6L2Ww
	 Glh+xrFWFD9KvtKht3k5sKI9RUF4Jf485SDBzOqeM1xr7l+VfoJ3YTMsP3nax/RDYw
	 YQEIM8PQZ3c+YyDbcm1idlweChNRxXDDP6PM34Q8Q/RDh9erLNMEjYqGJrBE9eOW+C
	 GV1ZwJX9HB60g==
Received: by mail-wr1-f44.google.com with SMTP id z14so472047wrg.6;
        Thu, 21 Oct 2021 13:49:15 -0700 (PDT)
X-Gm-Message-State: AOAM5310fZSD7losfnrs0iDQVFXKY+HoC2oUyhcgiJdmNGyoHF58l66y
	Xka5XVvNnwF53cn2159SX74ABgSPOoTXZ5CoFyw=
X-Google-Smtp-Source: ABdhPJydKQnjX3tVgmWZdJEBfbkBOJb7dZ7LTOsWZl7H60FIGvqJ6n1/DCJzrPzTS605K2H4ucdW8qU9g7PKsxl5PsY=
X-Received: by 2002:adf:d0c6:: with SMTP id z6mr8580964wrh.336.1634849354229;
 Thu, 21 Oct 2021 13:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org> <CAL_Jsq+WqboHoqHN-c5KAWPzMZm3dgExWr8RT7+-5bzwSA5BUQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+WqboHoqHN-c5KAWPzMZm3dgExWr8RT7+-5bzwSA5BUQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 21 Oct 2021 22:48:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1SreOdJ=jMvRYhwyWhTdEOBMzW+AFX2bRztRStrDWVLw@mail.gmail.com>
Message-ID: <CAK8P3a1SreOdJ=jMvRYhwyWhTdEOBMzW+AFX2bRztRStrDWVLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: remove leading 0 on unit address
To: Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Liviu Dudau <liviu.dudau@arm.com>, SoC Team <soc@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rui Miguel Silva <rui.silva@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 2:53 AM Rob Herring <robh+dt@kernel.org> wrote:
> On Wed, Oct 13, 2021 at 9:38 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Please apply these instead:
> https://lore.kernel.org/all/20210913192816.1225025-7-robh@kernel.org/
> https://lore.kernel.org/all/20210913192816.1225025-8-robh@kernel.org/
>
> There's also also these fixes that I sent:
> https://lore.kernel.org/all/20210928192143.1841497-1-robh@kernel.org/
> https://lore.kernel.org/all/20210928192210.1842377-1-robh@kernel.org/
> https://lore.kernel.org/all/20210928192123.1840842-1-robh@kernel.org/
> https://lore.kernel.org/all/20210928191759.1835325-1-robh@kernel.org/

Is this list still up to date? It looks like some of these are already
in linux-next
by now, so I'm not sure which ones to apply. Could you send the ones that
you want me to take to soc@kernel.org?

        Arnd
