Return-Path: <SRS0=175e=NO=gmail.com=alchark@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1893CC27C77
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 12:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5B39C4AF1C; Wed, 12 Jun 2024 12:57:49 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBD42C3277B;
	Wed, 12 Jun 2024 12:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EBD42C3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-43ffbc0927fso13261421cf.3;
        Wed, 12 Jun 2024 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718197068; x=1718801868; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qB+PMr0S7scrngc2VZSdORJslKMc7ShMF5tnKYvV/ic=;
        b=dYSi1Bb+nl2Td8tDv4o87MpUPxinv1zjOaTQbkgZ1LlCPiKujh4erxE3f8JGhv4EtG
         f4/CcZYw8kIzwbwSdi1QPWQqliO51c9JU/d9smNgQFpA08dW3dqIxYP/ktBPvr9wowGM
         pjSzZG27/e7zwu2L1ksSDxzHCs9gocSkwIn/4I5oC7Xxjno2/ojHx5qQdt/DvK0MqmSx
         NI+HCD0mjb3ZARS7v4bXX24AFbn/Soi0dT3No/XvMkUYw421G1L7aT+QQkd7iXv9Qx4a
         gOngmeI64Or1Y7gxP+bz/I2FzEu8uTQ5kNTTA+GBUn+Nrabvk9QlxGLO62mgWmGHFnSD
         PSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718197068; x=1718801868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB+PMr0S7scrngc2VZSdORJslKMc7ShMF5tnKYvV/ic=;
        b=YT0tiMvfg0/9KGAnxkqOvxRNR+jdDjrFCTZLIv858tlJUtT54vU5auyeLw75q+WqYO
         cgjOHvry7DNLYZaW1VTT7bL3ZwaN2rF73wJxDV9EZclvw4y+hc65gDHlxV1nx+8CHgEe
         6FTuRwlQNK+W5GzAJo0rrHCcdrPCh0UkDT4/9Zq5IltMyNnUvhq/xlKFQ3URZC0ud/En
         5lptdqWU97ZDhspQwZBtDN1t0qlRTIfmftL1k6p08zUiFc/7iQSwQViyt8YUo8DprXuD
         CCIijxqJpm9xwJ9c09cXCJG+BzgluxJyli9QjpOLsh69ou+hfjOpGlH8BCjejryGUP8x
         g60A==
X-Forwarded-Encrypted: i=1; AJvYcCWljeGANpsf4Hwaj2fibieAPsFYnbk+rZKJNrYAXdAUqwosGxZfnPEt8JyD/MDqRKPOH4JtOncgkIWORIVIIMVuwdETj4XE5J3NF5vOjiCCc7CsiT7QRnfND51VDsZA8g==
X-Gm-Message-State: AOJu0Yz9fHt/g2KkGc6ITHQv5wsvTlQqfiZHszj7mas3S6Ox9BA5hIt4
	Dmif04zDrDX5eRv4rKYqLu+Lj59G12isppkWEfZgGKUkoONH+H9hJhHWExC4akLigItTSJiNcHD
	fGgGaZW7TXC0PC8joifN3+CR4NL0=
X-Google-Smtp-Source: AGHT+IGBdjfgKQlOZpfKaHfJn/nzVYYtFBGLJ+YL9qo350RsZMZ0FClzxSPhm0lYF1lTq3MVhQrLCzuCFslcRCzNMYI=
X-Received: by 2002:ac8:5981:0:b0:43f:f361:1b17 with SMTP id
 d75a77b69052e-4415ac612ebmr28240521cf.56.1718197067797; Wed, 12 Jun 2024
 05:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240612111623.102868-1-krzysztof.kozlowski@linaro.org> <b1f14e92-4491-45f5-90ca-cc3d5ceea81f@app.fastmail.com>
In-Reply-To: <b1f14e92-4491-45f5-90ca-cc3d5ceea81f@app.fastmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 12 Jun 2024 16:57:36 +0400
Message-ID: <CABjd4YxxmNqDXe7SSzTpr4gsf4-Rp4sgB8x2sYSGzDDx5CWo2A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: ARM: vt8500: add Krzysztof Kozlowski as maintainer
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm <arm@kernel.org>, soc@kernel.org, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Krzystof,

On Wed, Jun 12, 2024 at 3:43=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Jun 12, 2024, at 13:16, Krzysztof Kozlowski wrote:
> > The ARM VIA/WonderMedia VT8500 platform became orphaned in
> > commit 8f1b7ba55c61 ("MAINTAINERS: ARM/VT8500, remove defunct e-mail")
> > and clearly it is on the way out of the kernel.  However few folks send
> > patches to it and it is nice to actually take them, till the platform i=
s
> > in the kernel.
> >
> > I do not plan to actively support/maintain ARM VT8500 but I can take od=
d
> > fixes now and then.
> >
> > Extend the maintainer entry to cover also VT8500 DTS.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Cc: Alexey Charkov
>
> Thanks for stepping up. A few years ago, Alexey also had
> some interest in this platform and knew some other remaining
> users.

Indeed, I'm still interested in getting it up and running, and even
got my good old WM8950-based APC Rock board out of storage for it
recently. I also have a WM8880-based laptop and another WM8850-based
one at hand, but need to bring them up to speed. Should also have a
number of older WM8750, WM8650 and VT8500 (but not WM8505) devices
somewhere deeper in storage.

I haven't touched the related code in a while, but as the original
author of VT8500 and WM8505 support code from over a decade back I'd
love to keep it all alive and functional, including reviewing and
testing stuff as well as (hopefully) adding extra functionality that's
been on my backlog for years. Does that count as support/maintain?
Happy to be listed in maintainers and be in the loop if I qualify.

Best regards,
Alexey
