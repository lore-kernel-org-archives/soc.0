Return-Path: <SRS0=QIiq=YH=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F814C19F28
	for <soc@archiver.kernel.org>; Wed,  3 Aug 2022 18:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41383C433B5; Wed,  3 Aug 2022 18:32:15 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C26C8C433D7
	for <soc@kernel.org>; Wed,  3 Aug 2022 18:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C26C8C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id t5so2764963edc.11
        for <soc@kernel.org>; Wed, 03 Aug 2022 11:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZXfRi2mrIZZJ4KT+IlnXdFrbfLahWQ9yKxKFGGib4WU=;
        b=vJpjJnv819lAmb+wvmRcOd8vOeY1RIek0+vV+Gvx04J52TG/kQshlpRjluOXzezWi8
         KsSRCBaBh91P9wcB9L4OqcYXySGjKAiTUU0MwekqbLpXpIiu/ikZaEU797i4da4Mu/WB
         MfWjXUZLSff3XLo49IyYW3v5TmtFEFBfX5Iz63fY8JvnacQbmrPZtp9wiQUa1BfeRvor
         zx8zLjlpbfINh/gd8LoJGXEAkRHmyRva3QwXYaOk9bsakjtT2Cl0Zr7RcUlF1HyQXEWz
         gALAqQ2cgwzfCrF3oRakUrh4qMF1NZ+vJKXLThiF/ZM0gOKqvbSAKJT1Z466VKdSG2h2
         fklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZXfRi2mrIZZJ4KT+IlnXdFrbfLahWQ9yKxKFGGib4WU=;
        b=1pEofGZNMuSlXJXX9FLGNvoBSqgUoz6HYYT2xh8kr2malYDOy9Vlc1UxT8GpshVh9s
         yKl/8/NY7rWMkMAgg28el33N3Tr+jw9H23nFP26VNrra9h9Ye2Vqsvhgw3MUVlSvJ4DX
         yYqhxPsUHAs89+BTtoiRlXrg/qXPPs5BmGnc/VcLa93UEeY7vron6HbWB2Q7U2wd7AXv
         w12Y8HBBAJxZpZgaGBbF0pd38N0Yfxg6toH+5fgb8S33Hxmjg38PLhp0dDG59zv88yKT
         H843knk413vlVXTnUYZefDMGJPQtRbrqEZJl7LxRVf6N87Dg/dFxlfSaLjxOORAiaO4x
         UJAg==
X-Gm-Message-State: AJIora/tcCfslg/bjSibXgKhjY1kOEMXLd9AYhPSmmoTeFgoHLpa7B/C
	mT8cMHZeXUVP2PY+gp7VYxf3aYYVv6HPkcowEZKGXw==
X-Google-Smtp-Source: AGRyM1t1FAn79Uu5qj6TGgqMXM+EElLhXe+jDnN9s2bDbKN0iwuzIaboCHGHmWpqhGheaaxbcHfZn4zes/4QxnrfeAw=
X-Received: by 2002:a05:6402:371a:b0:43a:ece9:ab8e with SMTP id
 ek26-20020a056402371a00b0043aece9ab8emr26744736edb.126.1659551532069; Wed, 03
 Aug 2022 11:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <1658829764-124936-1-git-send-email-john.garry@huawei.com>
In-Reply-To: <1658829764-124936-1-git-send-email-john.garry@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Aug 2022 20:32:01 +0200
Message-ID: <CACRpkdb5Af+7xb+QaSqAq9tkSwth58P9j2qZUdcRkDh62kbbcA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Make PINCTRL_SM8450 depend on PINCTRL_MSM
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, olof@lixom.net, soc@kernel.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 26, 2022 at 12:08 PM John Garry <john.garry@huawei.com> wrote:

> All the many other configs depend on config PINCTRL_MSM, yet for config
> PINCTRL_SM8450 we select config PINCTRL_MSM. Make config PINCTRL_SM8450
> depend on PINCTRL_MSM to be consistent with the rest.
>
> Signed-off-by: John Garry <john.garry@huawei.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>

Patch applied. Seems self-evident 2 me, if Bjorn gets upset he
can beat me up for it later.

Yours,
Linus Walleij
