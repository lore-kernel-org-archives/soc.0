Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C971C2BD09
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 14:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42B59C4AF0F; Fri, 28 Jun 2024 14:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D921C4AF0E
	for <soc@kernel.org>; Fri, 28 Jun 2024 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719585539;
	bh=wBayFcYkI6Eng8VyuQbXxkQeSimp2zeq7/znLGUhqtw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=apxyyv/hgE15QYhCqL5Myob0IHMkP8Yxn62IVLqBWUv+hil8hj1ZhIdSUMZQazEy5
	 ggRl5+SAHsh/eOe3dIcmyFHQkumjTxjc2wo8ST0k4ozMtzEXmvj+q90sb0SNunnlbe
	 MxI0BGYUuSll6JPDS8+5zumB2Vk07UiCiHwYBSi+lww7muo2zped7YYRvnJB7k0fHz
	 40ShNDHsc5RvCyBI+ylCthp6vLfu+Zmu0r0MnRBMzTck64dHthS4M9i36Lz2wjGRYH
	 nGUuOYsOaztDdW4mjOqCgm5AnWne/ddrufuCyERP2UJDQAsKjL2myF85BQ8OqiT60T
	 LmHyLTWYOZafQ==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e0360f890a1so405069276.0
        for <soc@kernel.org>; Fri, 28 Jun 2024 07:38:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YzoW/u2doUPy2w1mXPWu+1lXuoS3oLuMaJ6vnkeSAs8Y5GX/+/F
	Bt/hvn8HCpyIGMtDPZmiSxYp1/QQ7vBVAjDj944ZOul9ZAA/J8GoU7giJ/DatdgLW0dl5bdwgOK
	a50tX1BHJ+I8Z6D62A+oIU+Tb0g==
X-Google-Smtp-Source: AGHT+IFgWFki7WADTuWSu16XiWdsl0e4qkL5ulq1mRsA9pkDifeTNleirsSAw7YuhaR6WzrBXFVWZptPZrPtvGcrM8Q=
X-Received: by 2002:a25:9084:0:b0:e02:becd:d5eb with SMTP id
 3f1490d57ef6-e035bf4f79dmr1230966276.13.1719585538446; Fri, 28 Jun 2024
 07:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-arm-dts-fixes-v1-1-40a2cb7d344b@linaro.org>
In-Reply-To: <20240627-arm-dts-fixes-v1-1-40a2cb7d344b@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 28 Jun 2024 08:38:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJFrSyxjHQMF7gtgU0jZ_m2hNx_jrLxY29HE0VXOh4Ggg@mail.gmail.com>
Message-ID: <CAL_JsqJFrSyxjHQMF7gtgU0jZ_m2hNx_jrLxY29HE0VXOh4Ggg@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: arm: Drop redundant fixed-factor clocks
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 1:57=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> From: "Rob Herring (Arm)" <robh@kernel.org>
>
> There's not much reason to have multiple fixed-factor-clock instances
> which are all the same factor and clock input. Drop the nodes, but keep
> the labels to minimize the changes and keep some distinction of the
> different clocks.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/20240528191536.1444649-1-robh@kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SoC maintainers: please apply this directly for v6.11.

Maybe not. This is a dependency for patch 2 in the series[1].

Rob

[1] https://lore.kernel.org/all/20240528191536.1444649-2-robh@kernel.org/
