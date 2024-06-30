Return-Path: <SRS0=2HI6=OA=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F863C27C4F
	for <soc@archiver.kernel.org>; Sun, 30 Jun 2024 08:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D051BC32781; Sun, 30 Jun 2024 08:07:26 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE9D7C2BD10
	for <soc@kernel.org>; Sun, 30 Jun 2024 08:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE9D7C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec61eeed8eso24565281fa.0
        for <soc@kernel.org>; Sun, 30 Jun 2024 01:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719734844; x=1720339644; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x14W0zMcNYfSjfgEi8hckZrQ+GGSiswtHwN8pa2QffQ=;
        b=g6/exoauR2NYAXgQaHcTQen5XqYL3d8q8D69+uV9xtRhZ6GxSM8PBH0H001BoYABul
         QQPPsapZmODKnF5Aqfwfo4DgOu4iXOEcxAs2XlOrwLPskgiGaJ3Zp6MTblx38ZJOivQH
         NY+DR5IMXm/B3kZFvsv5akT0I62N4rbBF0drHZBr/TYpl7i9jXqxj+m7L3d5VBtY9sLv
         5D+eoZapcIe12QEhnnazXEyru9D6mxPVEbWrrVMIvRa1udf6tzbkpMV4T6yGkgIY1MYG
         962kDe7PiKytLNX3Y9ZO9X6vWwBtSI2ql9KaGL/GZ9xfcf8JfMDNQ3YM0LVbxNTAXWFv
         RPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719734844; x=1720339644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x14W0zMcNYfSjfgEi8hckZrQ+GGSiswtHwN8pa2QffQ=;
        b=EgduXPBaW5wnJePxDvUjf8KTK7u7l7RcL7KiD8dGqUnwEqZyt5/KU3/5ZMxixLPlks
         dnW6zUruAxmEI1ZKUSTyvWI2b1FXUzUPkN8wme0jUZuIEazvDaZb97Akm2Lx4lcIAGiB
         ic79J52li+uRDZ2hG1z9PaKb6auSPjUCuXlWxwsy8dIjjTNiw4OueNs4cNN/OTjo4nua
         G3OtJyHJtFZGXoWdHLld0lbziPP7Ss90/bZWsg1bgm9E7Fg/gGaocqPIoPReBeaiNt/j
         Qo2QSg3Srz/u7F18SVfCyg1LUlRzr+qkgIK96xmeblnnS8Z9almt81FZnY9MLAgmKGtm
         ffLg==
X-Forwarded-Encrypted: i=1; AJvYcCWnr4f7C+e9SHoeg3X5/uqaSrMX7HfuW5IXiG6UI9yWw3vnKas/OstEGJHOOlocKl+qP8GnE2m0O9/Rrdv0lw==
X-Gm-Message-State: AOJu0Yx6u23mFa9YJSt75S9WNKhhAqJvxfJt0G+EDNYVrKv4LLZMu5bF
	tQIUZFd49gIpPpu6dVz/pj5SIgg+VlNZJc3vRPy/BlkefmQswhBBW9bjepHrhbbiRatvd1wjmbD
	CvXg+wIr0l0wv7lrofywS3v6xZCMoOL1gPsEdAg==
X-Google-Smtp-Source: AGHT+IFp3NqyIYTlNJnzRJc9aynoy/jFOr3NFhoRp1fIAA9xDMWp4BlmkhBYvRQf+SSix30ahl9U5AB2+G44KmoyGv0=
X-Received: by 2002:a2e:9c58:0:b0:2ec:3180:d4f7 with SMTP id
 38308e7fff4ca-2ee5e375a38mr16017461fa.26.1719734842537; Sun, 30 Jun 2024
 01:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Jun 2024 10:07:11 +0200
Message-ID: <CACRpkdYA9BCtNNf31uGkF4_Zp7uUZ-Zp6-PLa-qVVSi6NJ-_sA@mail.gmail.com>
Subject: Re: [PATCH 00/10] ARM: pxa: use software nodes/properties for GPIOs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 8:09=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This series converts legacy pxa boards (spitz, gumstix) to use software
> nodes/properties to describe various GPIOs instead of relying on GPIO
> lookup tables. The benefit is that structure and behavior is closer to
> DT-described GPIOs.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
for the patches I didn't write myself.

What this really needs is testing... :/

If nobody is testing, I think you should just send a pull request
to soc@kernel.org and users can find out the hard way and help
fixing regressions. It's a bit hopeless to work on this sometimes.

Yours,
Linus Walleij
