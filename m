Return-Path: <SRS0=l2eH=S5=linaro.org=lee.jones@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9A8C433EF
	for <soc@archiver.kernel.org>; Mon, 14 Feb 2022 16:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D41DC340EB; Mon, 14 Feb 2022 16:36:17 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC9D0C340E9
	for <soc@kernel.org>; Mon, 14 Feb 2022 16:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC9D0C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id v12so27859302wrv.2
        for <soc@kernel.org>; Mon, 14 Feb 2022 08:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=n+pe1ICl9ewzw4TZgGAHasEYIW8plx51y2a9efb27Bk=;
        b=MAolyPYplTZr3Z0asslEHMSvIqKgp7oSbecwg+8PK2eS2NYe4IhZFTvnXMMFa+T9LW
         luq8pOeuYQZtMGoz+OycvRsWeR4WU0/ej/saNASo8jNPOp61B3W29XgLj0KNbpYBe9GM
         JDcYBGXnOeMaMpQ+9sw55288pkr2TvpvRfb5iJ1zYOO1ZDX4zBCRJdLtHHYtkMqzK6F+
         46PYgnBYVpoRy77XDdSeXF8K5WlDpzbflTQsTwYO6FrR0qPEdXEWlcVeL0JrmuBFEooH
         u/d6zEF9znxqQBL12T1BrxToRIuCFpCADTnOtCCu2z54iOCrQ8afbsWBqOEsfrhLv2Xs
         hmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=n+pe1ICl9ewzw4TZgGAHasEYIW8plx51y2a9efb27Bk=;
        b=qlA1oGHx1qDq7bvUPawBj4AUusQPGlpggd0Mv4YR0AT/hKx+C2rlAw1J0WGv+UYfeT
         6HTnaeTNj5VcNKeF0xn5d63+QgSpNusDT23sGfSWoO3Dt9qnZFQfYHH1jlh9X1gKxDXq
         xh0O1+eEyfJOvKKNg6+JXQ8rr3GlZ+6v0E1SiafpGo8cjrWXLnjohNY1E/SGrhZaPaqB
         dRCCxSSgIKE6tcalNQtLMxxPDoZP8u8kf6zGXmDOO8e2vULTG2itCGNa4VIoUWsMx/K+
         X3v+vADEOUAZFDtngqlpve/jIaVAP0Fjo21czRV0iM7quykSEmjW3E/otMKPMe1TBcHl
         irYg==
X-Gm-Message-State: AOAM5320NTru7ck0VSDIUMwuOoq+Fls8e32Mfa7/Hx69uXH0gU9xhSH8
	fjVeDZNrPvz+yXnZJFnOH416WQ==
X-Google-Smtp-Source: ABdhPJwT1NDvOiOtqW1aozcoW/vxtXUCGwkn3VR8i+/m2MuLda31W368jJ3lCfYDYYb8SQ/X/Kf+Lw==
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr346377wrn.317.1644856575188;
        Mon, 14 Feb 2022 08:36:15 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id x18sm29792103wrw.17.2022.02.14.08.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 08:36:14 -0800 (PST)
Date: Mon, 14 Feb 2022 16:36:12 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Michael Walle <michael@walle.cc>, SoC Team <soc@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] MAINTAINERS: add myself as a maintainer for the sl28cpld
Message-ID: <YgqE/OvNDco5wEY3@google.com>
References: <20220207184652.1218447-1-michael@walle.cc>
 <YgpkCyoSMg5RYfkO@google.com>
 <YgpkQMbhWAJG6oCh@google.com>
 <CAK8P3a0UWO=h6K4NpzCVC2vbOvThJH28GM5ddm9U1crr1Su7vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a0UWO=h6K4NpzCVC2vbOvThJH28GM5ddm9U1crr1Su7vQ@mail.gmail.com>

On Mon, 14 Feb 2022, Arnd Bergmann wrote:

> On Mon, Feb 14, 2022 at 3:16 PM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Mon, 14 Feb 2022, Lee Jones wrote:
> >
> > > On Mon, 07 Feb 2022, Michael Walle wrote:
> > >
> > > > The sl28cpld is a management controller found on the Kontron SMARC-sAL28
> > > > board for now. Support for it was added by me quite a while ago, but I
> > > > didn't add a MAINTAINERS entry. Add it now.
> > > >
> > > > Signed-off-by: Michael Walle <michael@walle.cc>
> > > > ---
> > > > Hi,
> > > >
> > > > since this affects so many subsystems, I'm not sure through which tree this
> > > > should go. I'm sending this to the arm soc maintainers because it's an
> > > > aarch64 board where this driver is used as well as Lee as the MFD
> > > > maintainer.
> > >
> > > I'm happy to take this, if it pleases everyone.
> >
> > Hold on, you're not going to get many Acks if you don't send it to the
> > other subsystem maintainers. :)
> 
> I've already applied this one through the soc tree.

You did?  I missed the acceptance email.

It would have been nice to give the other maintainers a chance to look
at it first, but I guess it's not a big deal in the great scheme.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
