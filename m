Return-Path: <SRS0=MQkR=QX=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41F1C433F5
	for <soc@archiver.kernel.org>; Mon,  6 Dec 2021 22:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75DDFC341C6; Mon,  6 Dec 2021 22:52:01 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 584C2C341C8;
	Mon,  6 Dec 2021 22:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 584C2C341C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id i13so11362774qvm.1;
        Mon, 06 Dec 2021 14:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oimzPdENQiMl9fABHsD/hSKDeXpkMF2Ol/l4UxA1adI=;
        b=ZnSxnSOOzGKmCxXJJe+326847cQ2mOdjA54lgbnFe98LNn5NicUQjkv/gZmURoJlLp
         NTYXr+qtC9a0jRTDr6v8tYFex1tb/wyF/IffF4P0TmFnTK1YUUCkwDVU01sQ43ocW4Xu
         HaVXB7kET0l73RbDo/EdNjcEqKRR41U9iT1ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oimzPdENQiMl9fABHsD/hSKDeXpkMF2Ol/l4UxA1adI=;
        b=pl5AjDKljtxqFZqq0IR8FqM97rZ1SdA8ImrXk21QAM3/d2ebLDoSJKGT0Agtn/McE9
         CkN7d5iWDlEapPjiQJb46KdD9ALicC4/PTGOlyb+kEziMzkn5RSjxC23PDxiMTv8GmQn
         VeuNK47q5NliefCJRjWGuxvoNRTtuFhFWsjD3nnFvuwl3Kpohxapz25XyB2NiEfT798V
         DQIivla56lkkYE2OWbdl6qmA8cD6OnF3VdCYme63O2FRgMW8nolAgJWHNti8SSBybYYK
         FeIFg0dSHIYHzyZFgYcLn/WCZ73cE2HQs/fm2FIiCyrBvenZ1sfUrNqvBX/ZFwXOExQm
         ryHQ==
X-Gm-Message-State: AOAM5321GJyOVLFpNrGc538Reb7F5qdY5QudLw+3XmrHB9VGXjymVhyu
	l3ozZXiWXiOKMGtgydx5wnaTrFDZKK5IcJ34rQc=
X-Google-Smtp-Source: ABdhPJwsWtljRtloMBy/nfiuFRYja1NNoa0XZcTHeRYj8LCekz6T0FBQdBLEpUwA+gpdZZ+w0JiXyKR92W4AskOR8as=
X-Received: by 2002:a05:6214:c6f:: with SMTP id t15mr41090372qvj.49.1638831119274;
 Mon, 06 Dec 2021 14:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20211201033738.121846-1-howard.chiu@quantatw.com> <Ya5/v+VhOM9o9BtQ@heinlein>
In-Reply-To: <Ya5/v+VhOM9o9BtQ@heinlein>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Dec 2021 22:51:46 +0000
Message-ID: <CACPK8XdCjqB+HZ_g9O=gjnSne3=iV44i6jKP5M8yWcsjnttaog@mail.gmail.com>
Subject: Re: [PATCH v6] ARM: dts: aspeed: Adding Facebook Bletchley BMC
To: Patrick Williams <patrick@stwcx.xyz>
List-Id: <soc.lore.kernel.org>
Cc: Howard Chiu <howard10703049@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Andrew Jeffery <andrew@aj.id.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Howard Chiu <howard.chiu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Dec 2021 at 21:25, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Dec 01, 2021 at 11:37:38AM +0800, Howard Chiu wrote:
> > Initial introduction of Facebook Bletchley equipped with
> > Aspeed 2600 BMC SoC.
> >
> > Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
> >
>
> ...
>
> > Change since v2:
> > - Remove uart5 workaround
> > - Remove gpio nodes of pca9552/pca9539
> > - Modify gpio-line-name of led/power/presence pins with openbmc pattern
>
> A number of the GPIOs do not have defined openbmc patterns for them yet.  The
> names you have chosen are ok for now, but we will be changing them as we refine
> development of this machine further.
>
> > +             gpio-line-names =
> > +             "SLED0_MS_DETECT1","SLED0_VBUS_BMC_EN","SLED0_INA230_ALERT","SLED0_P12V_STBY_ALERT",
> > +             "SLED0_SSD_ALERT","SLED0_MS_DETECT0","SLED0_RST_CCG5","SLED0_FUSB302_INT",
> > +             "SLED0_MD_STBY_RESET","SLED0_MD_IOEXP_EN_FAULT","SLED0_MD_DIR","SLED0_MD_DECAY",
> > +             "SLED0_MD_MODE1","SLED0_MD_MODE2","SLED0_MD_MODE3","power-host0";
>
> Such as these...
>
> > --
> > 2.25.1
> >
>
> Otherwise,
>
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

Thanks for reviewing.

Howard, I'm merging patches for v5.17 but I can't apply this until you
fix the warnings I mentioned.

Cheers,

Jeol
>
> --
> Patrick Williams
