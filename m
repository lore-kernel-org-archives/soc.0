Return-Path: <SRS0=I/Xe=N6=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF7FC30658
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77259C2BBFC; Fri, 28 Jun 2024 21:51:16 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A029C116B1
	for <soc@kernel.org>; Fri, 28 Jun 2024 21:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A029C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cdea1387eso1200325e87.0
        for <soc@kernel.org>; Fri, 28 Jun 2024 14:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719611473; x=1720216273; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL4KfqnyiM92HwOvs5pzjIBd7rZb5qTSwbTvkD92S08=;
        b=dQFiOJeymdgw2PtXAptLCSh+uH1UMTJIaf8ZRPD5Vnp01SWjeiTpIL0Wbb2yBpvX82
         PrUDh1tJmcQ/jEwI1FQ/ODO00GwR5mSnGi0tPT7qR56IvV1lqK4eRUu8vJx3C6F1ypgc
         8EyztiY8ShcXi2mrBtzt8N/O19/1XNr86Wp37NchE/BI6xpeoZUuHx2j/Uj7lBXMMovg
         0grU+tHQQewU9lmzsyQWxAOU5u5XyDLXgRo2EJq09PXjgbnYZni+grih80c8Dmg+7r22
         1c4nHBTwpiz1zQWXv5hy21SxO7FKIMp3yLOKrxB7MwnJGNRf1j5LzXNSeXEpNrdgfT74
         ONQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719611473; x=1720216273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rL4KfqnyiM92HwOvs5pzjIBd7rZb5qTSwbTvkD92S08=;
        b=Q2OBIHMQIzIJBdU6hr3QSOM6qM06AHlZ/BaWCVk4up5WIG3KaCXQSWfrPUOEoaAPrL
         Y69U74vjFLOZ/Gp0iwzekuI2RrlZgX9hJY9nKzrWbFbaSYI54gsEGNzc2h27hjpBzGme
         Op99efAUREJV4nSRUpHPkE7YabecetMHfjzA5eAUxMJ+Y1oG7T3PJz1j+ZC/1zOjg/9V
         T4Ie6v4bROv7ZDwkW8fmF4pg+Y0Wo0oIchD76IAbvpNsG44xoB32BwO4e15N6nRBedtp
         xn74HQv4bfQRHN5WNsWa0RMimTOkgRiBaByG/m7PoSp1LCabgYgXqm0v5FG/6tPhLPii
         Prow==
X-Gm-Message-State: AOJu0Yw1xiExH1Gohjh2adNC95BTRG05PjhzAYqxjYyKi6Jc7otWYtpA
	Y8JEG4/CVG2t2OAuIoWnVz2KNeb5d52j5ec/WmA+BlF5IWx/DSJTmqQrF1CKwQEieN4IjL2vZgt
	VdM9k7G7CYNuJ2b/Kaho6RBbocfOvgGKcJA3mjDGeL0csRNEW
X-Google-Smtp-Source: AGHT+IFTfvMlr1BllVJT/kxOYbu0WnhBqZ6WFfHXOhcP0+fZ2F/dtSdSRS8jqP6sq8EIGn9vAnqr1+mS+7B7oDKhMAE=
X-Received: by 2002:a05:6512:3b0c:b0:52c:e393:6634 with SMTP id
 2adb3069b0e04-52ce3937b27mr14127617e87.33.1719611473342; Fri, 28 Jun 2024
 14:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-arm-dts-fixes-v1-1-40a2cb7d344b@linaro.org> <CAL_JsqJFrSyxjHQMF7gtgU0jZ_m2hNx_jrLxY29HE0VXOh4Ggg@mail.gmail.com>
In-Reply-To: <CAL_JsqJFrSyxjHQMF7gtgU0jZ_m2hNx_jrLxY29HE0VXOh4Ggg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Jun 2024 23:51:02 +0200
Message-ID: <CACRpkdYq92ZzUjb-Fne5th_hNv5xhsQ0Otf9ud+u_JLaMSiXqQ@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: arm: Drop redundant fixed-factor clocks
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 4:38=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Thu, Jun 27, 2024 at 1:57=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > From: "Rob Herring (Arm)" <robh@kernel.org>
> >
> > There's not much reason to have multiple fixed-factor-clock instances
> > which are all the same factor and clock input. Drop the nodes, but keep
> > the labels to minimize the changes and keep some distinction of the
> > different clocks.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Link: https://lore.kernel.org/20240528191536.1444649-1-robh@kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > SoC maintainers: please apply this directly for v6.11.
>
> Maybe not. This is a dependency for patch 2 in the series[1].

Aha sorry for missing that :(

Sudeep, are you fine with patch 2/2? Then I can send that
the same way so Arnd can pick it up and pile it on top.

Yours,
Linus Walleij
