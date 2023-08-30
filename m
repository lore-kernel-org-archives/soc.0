Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF2EC83F12
	for <soc@archiver.kernel.org>; Wed, 30 Aug 2023 01:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83ABDC433CA; Wed, 30 Aug 2023 01:20:18 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E4CAC433C9
	for <soc@kernel.org>; Wed, 30 Aug 2023 01:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E4CAC433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4ff09632194so8078782e87.2
        for <soc@kernel.org>; Tue, 29 Aug 2023 18:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693358415; x=1693963215; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=61Qie5c2kDF2Zc0oY6tB5adEIVm20BboiMQ31ckJkUM=;
        b=UO/GRc4WEERV+oetUR43nwUxm5wC/iXdYPqh3X1SoR31jH4aAdPmsAniL2Z4F6I5Pc
         emhXyme6lw3mZReUFh9cVcquybEBxV2bJfLKgTK+oTsZ7nK8WRkxE0MPrN0GawlJDEwz
         36Nc/Z3oOWGPRoujswTkKgP7ujpRWHw6AqDgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693358415; x=1693963215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61Qie5c2kDF2Zc0oY6tB5adEIVm20BboiMQ31ckJkUM=;
        b=FIYvDlN4CRMjrL8hEd/3dBpqc2sJzZpDBfF+wnIs91VApCXsY76Q9OA+yGl/WoXzpE
         7fal5wPJBkAI/1eA6gdlUDH7QSddj6AxLamq2+cjHDl6Uo82dNzjfHlNZ+ZRH46mL0+J
         kqStJEwXFWhM650khD1GWrBSMl1O4blU0VyMMNfARCSEULpXLy+4YtyOlJ7/5pOpJTcY
         iokjzCiA7AKUb298KKBO0lAlDC9tzNZxR9Dma/0dre0rxkGO7vFAa5+1mDTcHu+JYF0Y
         BMXtQbnwYM0Wshwu8tMVbDEtmjciC8xUAWatp8r7xtaqK+YlZIm3lu/5cLci0D0RN8df
         UWGg==
X-Gm-Message-State: AOJu0YyZArpCEwWnraIbX2S/HKfUKmaF69I30xQ4f4Mdy+XmswddwR+8
	rZn40UPabT/byairp3rUlQyjVYMjJN0OWme624FduaKL
X-Google-Smtp-Source: AGHT+IFdb9ogVynpfGAmyoU1NviiL4NDAVpoAhN+KO4PYa8v7SicmrlEFexJNkgJ59PS5SqHFansmg==
X-Received: by 2002:a05:6512:3291:b0:4fc:df79:3781 with SMTP id p17-20020a056512329100b004fcdf793781mr371987lfe.66.1693358414713;
        Tue, 29 Aug 2023 18:20:14 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id p8-20020aa7d308000000b005288f0e547esm6233718edq.55.2023.08.29.18.20.13
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 18:20:13 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so6512608a12.2
        for <soc@kernel.org>; Tue, 29 Aug 2023 18:20:13 -0700 (PDT)
X-Received: by 2002:a17:907:9687:b0:99c:85af:7aa6 with SMTP id
 hd7-20020a170907968700b0099c85af7aa6mr547689ejc.28.1693358412962; Tue, 29 Aug
 2023 18:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
 <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
 <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com> <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com>
In-Reply-To: <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Aug 2023 18:19:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
Message-ID: <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Aug 2023 at 17:48, Arnd Bergmann <arnd@arndb.de> wrote:
>
> How about moving it to drivers/power/domain/ instead?

That sounds like a sensible name and would seem to fit logically with
our existing tree structure quite well.

> I don't think we can easily rename the interfaces that have been
> in use for the past 12 years

I actually think the interface names are much less of an issue, since
anybody using them is presumably familiar with the naming.

It was only with the directory structure that I reacted to it, because
that kind of exposes the naming to people who definitely are *not*
familiar with it (ie me, but presumably anybody else who sees the
diffstats etc fly past).

And yes, we have a number of other pretty obscure driver names in our
tree (I end up having to remind myself what "ntb" and "hsi" etc mean),
and I don't tend to love them either, but at least they tend to be
industry / vendor names.

            Linus
