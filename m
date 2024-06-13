Return-Path: <SRS0=jTjA=NP=gmail.com=alchark@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACE7C27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 05:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C7B3C4AF1C; Thu, 13 Jun 2024 05:17:23 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62CC2C2BBFC;
	Thu, 13 Jun 2024 05:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62CC2C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7955dc86cacso39464085a.0;
        Wed, 12 Jun 2024 22:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718255841; x=1718860641; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZbJPHVns/walNPI9hYI9ziWHW23YvfpYoKJOsHQuS8=;
        b=OJEMQNbrkYi3odbligQ6sJRt5OV/+7dn5ppXmM552vB4OuSeUbWJrq30MgIxmhEx9j
         IPOi9cl5/89VBdh7eV6P3/XSCvXGR8AiUVD29ZfIGg8ANWGNtF0rWuFnKLuQd7llrDRw
         WI0Al+GonI7XPfuh1BHOrmw8ULuUuBjxffCEmN3TkQZUPih+z252i5vikweOT33LO9cc
         4w+38t3YVaE68+ne0fSIf5CPVqTZHBybm1uyTggNCiHcU87EuNuTBmiifdIrfZhNOlEK
         H1iG2B2yZZm6Z726YRUnOBNEQLid6Su78FLJLmMOiRcG6f4kKcrAvOGT2G539FoNA9cs
         ZodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718255841; x=1718860641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZbJPHVns/walNPI9hYI9ziWHW23YvfpYoKJOsHQuS8=;
        b=h6qnDDb1iMN691us7+xDQQFUoK+xZS3Q9ctszeOpQb06VmDTz96xlXUmmp7Ha+X6Db
         e1LyOB50DXFKHCL3zAwZl7UPTepuVRkcKUH6w2O45Cn31yVj8ysmCitAhVr/fGOuUWLS
         PWDMg+xgCFDMe3ovkeZSm9CGOKsJcGMyNsV9Gy1puTcr0gZj+RQSeXr+mr8D9mkphR3f
         sGpA2YdYVwSM3dP2g7Ds7g+4zyguCHelEO8ZMZ4IjwoxnvIbAXaIX/8N801qd+nim3R/
         lA9ZSDgzi7qHo6Jm9NqJ2BlSB2ik0FYdN8XB0ItIP76JkmaqwonBrxnYxy7Y3coaWMlp
         tKnA==
X-Forwarded-Encrypted: i=1; AJvYcCV0M3FKDxeXKy2nh5ywMefhlijpulu1hbqYIPQ5nG+kzD3+xtYwN/EJCoYRg238cS0ik4du154InB9eZEd3H7B2oJdqvsM1kxdpJuIQVWO1MryE0Yq3tXwcrAUi4lOsaQ==
X-Gm-Message-State: AOJu0YwdcVcDgKHXg/opc1kOJpzAysjHRPKr+x02KYNghSpDBXv7s71u
	QVOpt3xLn37QkWr2pxQ669A4NAyuAaOLrj8+m1I/OIfn3SkUH0AtOxcqCKMvg4qbWrMc9k4mEAb
	fenbvtorMFUG16mI33JJjMiVtcKk=
X-Google-Smtp-Source: AGHT+IG2kpOTJxIRJFMaxclBLOzuPjHJPnxPPu+pdtXe1mBL7ZyyIZr5Ve2KlxlCXNxF6aC9zqFIQbDPwAYTOUYRfWA=
X-Received: by 2002:a05:620a:1a2a:b0:795:512e:4ae1 with SMTP id
 af79cd13be357-797f605a114mr383589385a.35.1718255841222; Wed, 12 Jun 2024
 22:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240612111623.102868-1-krzysztof.kozlowski@linaro.org>
 <b1f14e92-4491-45f5-90ca-cc3d5ceea81f@app.fastmail.com> <CABjd4YxxmNqDXe7SSzTpr4gsf4-Rp4sgB8x2sYSGzDDx5CWo2A@mail.gmail.com>
 <82482ddc-9f0f-45b6-b1a1-6de2617b6980@linaro.org>
In-Reply-To: <82482ddc-9f0f-45b6-b1a1-6de2617b6980@linaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 13 Jun 2024 09:17:09 +0400
Message-ID: <CABjd4Yz=DmqvSCQvFFbv+WiwxJWM2uJVw=U6zVAND0xHULxRqw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: ARM: vt8500: add Krzysztof Kozlowski as maintainer
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm <arm@kernel.org>, soc@kernel.org, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 5:43=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/06/2024 14:57, Alexey Charkov wrote:
> > Hi Arnd, Krzystof,
> >
> > On Wed, Jun 12, 2024 at 3:43=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >>
> >> On Wed, Jun 12, 2024, at 13:16, Krzysztof Kozlowski wrote:
> >>> The ARM VIA/WonderMedia VT8500 platform became orphaned in
> >>> commit 8f1b7ba55c61 ("MAINTAINERS: ARM/VT8500, remove defunct e-mail"=
)
> >>> and clearly it is on the way out of the kernel.  However few folks se=
nd
> >>> patches to it and it is nice to actually take them, till the platform=
 is
> >>> in the kernel.
> >>>
> >>> I do not plan to actively support/maintain ARM VT8500 but I can take =
odd
> >>> fixes now and then.
> >>>
> >>> Extend the maintainer entry to cover also VT8500 DTS.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> Cc: Alexey Charkov
> >>
> >> Thanks for stepping up. A few years ago, Alexey also had
> >> some interest in this platform and knew some other remaining
> >> users.
> >
> > Indeed, I'm still interested in getting it up and running, and even
> > got my good old WM8950-based APC Rock board out of storage for it
> > recently. I also have a WM8880-based laptop and another WM8850-based
> > one at hand, but need to bring them up to speed. Should also have a
> > number of older WM8750, WM8650 and VT8500 (but not WM8505) devices
> > somewhere deeper in storage.
> >
> > I haven't touched the related code in a while, but as the original
> > author of VT8500 and WM8505 support code from over a decade back I'd
> > love to keep it all alive and functional, including reviewing and
> > testing stuff as well as (hopefully) adding extra functionality that's
> > been on my backlog for years. Does that count as support/maintain?
> > Happy to be listed in maintainers and be in the loop if I qualify.
>
> You can take the sole maintainership thus handle patches/pull requests,
> or become added as a co-maintainer.

Co-maintainer sounds great. Shall I submit a separate patch to add
myself next to your name?

Best regards,
Alexey
