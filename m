Return-Path: <SRS0=uqXR=N7=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EF0C27C4F
	for <soc@archiver.kernel.org>; Sat, 29 Jun 2024 22:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE7A3C32786; Sat, 29 Jun 2024 22:17:16 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1991C32789
	for <soc@kernel.org>; Sat, 29 Jun 2024 22:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1991C32789
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so25038021fa.2
        for <soc@kernel.org>; Sat, 29 Jun 2024 15:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719699434; x=1720304234; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5lOH/7Wxi1ZVOumvqW3D3/dFi0e6hf/Gb4y4MNiTIk=;
        b=euemtYq/FG79sBc8NwsSJw4nA8vuzvw3Bbg6YSlGfrsqLYIPTyDkYjWcezSC9xpG3S
         HrG1HDVviU201lPW7VCivsdUe3x5u9NLNyEbUWt/VQVstZDVDaJnrn72Wgo12MyW8ZDf
         IZKbGhZU1y0E6PLUJdhEBUTfq3K1voPf4BL0wzkv+L+4CstCVq6WjwbzzsbTtZWC4Js4
         Nu0cAXu+JAnz7TeHznAw9PjBEOsPNHY8lifU7SPsIhEblaitG6jU3l63wKLId55vM6XF
         s5OH1TG6QurEhwPQUNmV4eJ9X4diemVTgtpaWXY6rvPJNmWf2zT9s+uE3DHzK3LZb0Kj
         iEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719699434; x=1720304234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5lOH/7Wxi1ZVOumvqW3D3/dFi0e6hf/Gb4y4MNiTIk=;
        b=c007vfc2j1oG1YZ2APvB///Pj9gb1ctzuhEtNGFhbsn5qNdxnEskuXmtmo53ze5oRg
         U58Q2r3qiInzIygkhSizgVg0RVq7obZyNvNTVJ2tglalGztDD4NDMEvCkqfuirZF4RnR
         z3DS8JeALNIZgfu6SPUS/i8QNMEnY3Z5A5ddDIJxxL840PbC0ExNowRHmvm6s7UM6RQp
         oi9GplQ75j3sCM/mv5xksflVLFITf6YVfDjxYCIkigwJ8Qj8xkq8GVusFFhC4gAzG8W+
         4NUsw6fubd2siERZfuA/rfBEDkUCSifS+mJWyCWUImwfU9Ry8wHofw9rlxlVVSyDUL0m
         wb2g==
X-Forwarded-Encrypted: i=1; AJvYcCVwtHiB0EMvugugCJzpt2hQXNaDoLrpjg3u8U+22xQ/8PKpAYUFRdkiDXFioqWaL11cw+0cNHX+rkMIwFvb2w==
X-Gm-Message-State: AOJu0Yxpr7xBZ9MF7SOpXBpqlalWGpRtlppaekq3IZWScQ6PoBFCneqx
	hnzPdYGDy4pJyqdtHm7+HCgUvai7t5q+C071cRmJx3cQqd9GP7q5XEKSX4io7NWhz9X7TYlEpvU
	SeNp+nczdMOpQYEK63gTGQJQhDXOgxpUa080CSAEI9ar1mozP
X-Google-Smtp-Source: AGHT+IHD0pfUphTP9a8ganUqvqMvBo5IpJm7HUbs7NoywIw/CIMWsnORfMnejwTvGzeW3RzsZN6jfivDiANM7gnA9zg=
X-Received: by 2002:a05:651c:549:b0:2ec:1e6e:13f9 with SMTP id
 38308e7fff4ca-2ee5e707c78mr15072281fa.52.1719699433935; Sat, 29 Jun 2024
 15:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-arm-dts-fixes-v1-1-40a2cb7d344b@linaro.org>
 <CAL_JsqJFrSyxjHQMF7gtgU0jZ_m2hNx_jrLxY29HE0VXOh4Ggg@mail.gmail.com>
 <CACRpkdYq92ZzUjb-Fne5th_hNv5xhsQ0Otf9ud+u_JLaMSiXqQ@mail.gmail.com> <20240629151139.ahr7ikxt3joikvk3@bogus>
In-Reply-To: <20240629151139.ahr7ikxt3joikvk3@bogus>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Jun 2024 00:17:02 +0200
Message-ID: <CACRpkdabSbROfmth6o+tsgBWwA0XAr3JGQ53doR9AGbnmzHOmA@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: arm: Drop redundant fixed-factor clocks
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2024 at 5:11=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com>=
 wrote:

> > Sudeep, are you fine with patch 2/2? Then I can send that
> > the same way so Arnd can pick it up and pile it on top.
> >
>
> I didn't send 1/2 as well as I didn't hear back from Rob. Either we can
> ask Arnd to pick both directly or either of us can a PR. Let me know if
> you want me send a PR. I have added my review tag on 1/2 IIRC.

Thanks Sudeep, I just picked and signed off 2/2 and sent it to
SoC so things should fix themselves, hopefully.

Yours,
Linus Walleij
