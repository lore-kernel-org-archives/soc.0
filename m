Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB3AC433E0
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 13:05:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F1A4564DDE; Thu, 28 Jan 2021 13:05:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C544764DD8;
	Thu, 28 Jan 2021 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611839158;
	bh=IhdZuuCocjMg/zVYiy4d4+I0r1v0cw4OX6ivH5EKyXA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=octQ5zdsQyk3UGOApD+VUZfZZp8i80YvVB8E2fU7ZUIisIsbECvljjoj7Bs6vD8y1
	 ErkO+yUtq8H71Jmwtt3JLau6Bc9NTVcq0hVTXvLNXwPj5CFJR6nEcxG0bD0k9PnMbw
	 unQxRgiRWlUK5r3jeM53t5pdDWx9qPJHYGeFUIoP1f51NSs3OP1BKlfllqo03aXHv6
	 pmnt1ucHjxl4PGiZwFtma1X58o+YXmAytOU3Rp4dzfsy6IPDmDmRKqVhqVvExedxds
	 ykyPxBf5YGsXohEMK4KKb6w+O+2zvD5t94o/dmBRi5RUsFCSd4FL66aoJps3aa2Oz8
	 lJcD9vh2e9VsQ==
Received: by mail-oi1-f172.google.com with SMTP id k25so5882404oik.13;
        Thu, 28 Jan 2021 05:05:58 -0800 (PST)
X-Gm-Message-State: AOAM531/LZFyPBIxYIphOzN1WTGDkRP/67Veab8atG8HZsbdrIX29jUw
	V9kLwqlOPc14Vahd+LDonL3b0foM+6YTUNEfTuU=
X-Google-Smtp-Source: ABdhPJxmNZXgrGqvLsYR4W8etb/JEOo9sB8YTyU3jVp2qNVHQlLWtjm0zYdYgcsQgLFLAk25Nxl7+mm80rUi2qUAFfg=
X-Received: by 2002:aca:e103:: with SMTP id y3mr6283020oig.11.1611839158018;
 Thu, 28 Jan 2021 05:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20210128075806.10318-1-avolmat@me.com>
In-Reply-To: <20210128075806.10318-1-avolmat@me.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 28 Jan 2021 14:05:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1RmN+MQoZSVA+ekMORLZdmTHtoEWtcPUzJLVujLCThXQ@mail.gmail.com>
Message-ID: <CAK8P3a1RmN+MQoZSVA+ekMORLZdmTHtoEWtcPUzJLVujLCThXQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: sti: add the spinor controller node within stih407-family
To: Alain Volmat <avolmat@me.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Patrice Chotard <patrice.chotard@st.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 28, 2021 at 8:58 AM Alain Volmat <avolmat@me.com> wrote:
>
> add the spinor controller node within stih407-family.
>
> Signed-off-by: Alain Volmat <avolmat@me.com>

dts changes look ok to me, but please resend considering:

- Add a proper changelog text, rather than repeating the subject in the
  body. I'm sure you can find something useful to say about this change:
  Why do you need this controller? Why was this not originally part
  of the .dtsi file?

- Address your patches to the correct recipients. I see you have eight
  addresses on 'To:' and only yourself on 'Cc'. Try to find out who would
  be the person to pick up the patches and send it only to them, with
  others in Cc. soc@kernel.org should not be in either list here, because
  that just means we get it in patchwork for the soc tree, but these should
  be picked up by the platform maintainer and forward to us from there.

         Arnd
