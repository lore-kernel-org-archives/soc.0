Return-Path: <SRS0=mnBx=OB=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A078AC433F5
	for <soc@archiver.kernel.org>; Sat, 11 Sep 2021 12:21:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 767F060FDA; Sat, 11 Sep 2021 12:21:10 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 465D7611AD;
	Sat, 11 Sep 2021 12:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 465D7611AD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id t186so1623471vkd.3;
        Sat, 11 Sep 2021 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JFcWtn6lUh5qSG7OOiLxD5ZahmIxrMGf1j5Q5s8lXfU=;
        b=ooYnU0AqSisGN9gV0Nwzw8AH4IeUcF8jgJbCHu0G/PUcShcVArw2J6lI2X4Ms4B2My
         VpvWZfww5r2EQVNIv1MC3z7HRTimN0vh8BfUVCXbih0m78iAIFaPRrSfjdn3tmCCVYec
         tKSNWscw2gSKm14wIE7CFOR5w1kPL8d8CwlKE3E0GS7QFG/OHsPep/YqMUpEXobd462U
         JG+3L/mknZJR5/6b8wFabqtBlBeEuZkVmV/PhtwOw/ToE5Mg8sFKjLfsmYBebAk4EPtU
         fGVxCh+OSqWgE5520DU5Cqy8EKC1ljmMT18ly+2QeIDL/EibCMN5fPQenbiU/SDSulAU
         Tugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JFcWtn6lUh5qSG7OOiLxD5ZahmIxrMGf1j5Q5s8lXfU=;
        b=OPVN0MwkJq8gFq96YF/WiunITnJn8wzy2YYcyVc/ir1y0rZU/Z2BsX/W+UC0X+vpX4
         dPgRQIRbnRdZ+Sn03MAWMfF8e93NhBtCEqv3neM/3UxaEtMDADes7KfekOUUjrX9yPXa
         tHpVT3hQoaoeEJBTQ7osOsybgxDvWpRNIerLwp/vBhhra4glWZjKNF8mLRbAYOZ331Fh
         JnCpBLpdCmgHbxTiBP/WhYM6C8FbROmipB38b72i/JbT4EOJanv7npjfSSVHIpAgboa1
         vEtB+/gDpqKAm8AbYVjm1Fek3dQYNkJNKJp1Drh2ptI16jeR8FGrXs2KQbVCRo2nJmMg
         GJdg==
X-Gm-Message-State: AOAM530EdY8AOz31iuv8d+PaaZP4u7NCSygnXRU1fVHLfldTCYEXce8l
	7Sdz2K4WBGQKwixKc8nKR5KeE97T0IIbM4z+4DDuJm1i
X-Google-Smtp-Source: ABdhPJwrH1e4m8h6HaHj1QK9JEMdnD/N4f+EvyVU7cY41tx7OAAFn/bJT6S+BdYNEzFERGS/IXAURi3UdeeLL+l6HTI=
X-Received: by 2002:a1f:9e11:: with SMTP id h17mr785852vke.16.1631362869518;
 Sat, 11 Sep 2021 05:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-4-romain.perier@gmail.com> <CAFr9PXmwRDfXmDR9UOGoQ2+_LDaSGgmg7n=Ek4RtBdiC2kfuLA@mail.gmail.com>
In-Reply-To: <CAFr9PXmwRDfXmDR9UOGoQ2+_LDaSGgmg7n=Ek4RtBdiC2kfuLA@mail.gmail.com>
From: Romain Perier <romain.perier@gmail.com>
Date: Sat, 11 Sep 2021 14:20:58 +0200
Message-ID: <CABgxDo+9WnjE5pu=ijN01htLucFYko--w2fJ+ZVazBg_cSLZ1w@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: add vendor prefix for Wireless Tag
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Le sam. 11 sept. 2021 =C3=A0 04:59, Daniel Palmer <daniel@0x0f.com> a =C3=
=A9crit :
>
> Hi Romain,
> Sorry for sending this again. Gmail decided to switch to html email so
> the first version bounced from the mailing lists.
>
> On Sat, 11 Sept 2021 at 04:03, Romain Perier <romain.perier@gmail.com> wr=
ote:
> >
> > This adds a vendor prefix for wireless tag boards and SOMs.
> >
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index a867f7102c35..b50d62dde7c5 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -517,6 +517,8 @@ patternProperties:
> >      description: International Business Machines (IBM)
> >    "^icplus,.*":
> >      description: IC Plus Corp.
> > +  "^wirelesstag,.*":
> > +    description: Wireless Tag (qiming yunduan)
> >    "^idt,.*":
> >      description: Integrated Device Technologies, Inc.
> >    "^ifi,.*":
> > --
> > 2.33.0
> >
>
> This should be in alphabetical order.
> Also, this commit should be before adding the DT for the board I think.
> The prefix should be in before something that uses it.
>
> Thanks,

Ack, I will fix it.

Cheers,
Romain
