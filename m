Return-Path: <SRS0=n5Gs=AM=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2550C7618E
	for <soc@archiver.kernel.org>; Fri, 21 Apr 2023 07:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 760FDC433A0; Fri, 21 Apr 2023 07:38:52 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD331C433D2
	for <soc@kernel.org>; Fri, 21 Apr 2023 07:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD331C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-555e853d3c5so4313687b3.2
        for <soc@kernel.org>; Fri, 21 Apr 2023 00:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682062729; x=1684654729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbLVXy+xDpAqXOw3eLwbqNtcQaFjWeU5ILDIT0cNbUg=;
        b=mST3V/2nI8K5sew2KQtTF50x8ftoZePkg1QvEKHIydeu0oqB3+NYCr7eKWARFDydch
         tGKSAhLcPy7j8fiT/jd5jrV5lTYJPAG4qPSeadhCdmY6cC5UncClXrjhPzYl51B6WzDC
         8Mjl6sj1z0nONe1EesQqBIi1YMOGaD5OaY6fXWNqZhP5oytIv7e3WWan3IDrnQIRoHRG
         /IXK50KeJgYzyZ6A50UMYt+GKK/iJmwxTIMfzrZDxq6KpGuy5X1aL1n2FEO4NrGiWa4E
         w60ggOCtYHtm6nXBEPq0JDKy/VE+fjn4JDf7xmtaJ/Ayh2p9nh+AYcdAhmoDS67xWz0y
         5MXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682062729; x=1684654729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbLVXy+xDpAqXOw3eLwbqNtcQaFjWeU5ILDIT0cNbUg=;
        b=OfTEO0F3F7loXuv93bzFPbgVHScRrTZ31ynUVdLZ5jldHB1vObPRN18LVB0bVGvr4D
         /wS6CNLzr43pNImXRjyBeuuu29T7hEB1YXCWiQQpydAd7UMyWnbPLlDJ7+MDNAmnmLx0
         RwgcZ21MQuHqrwAKd6NP5EpKyErwo1aDNwJblMznbPNcc8Fq1Yrr49yT4Zs8wQSkzIG0
         xtePXlvub0nu+I6M0dGW9t9+6XpkBBakoavT1lTG1C4nZNRwA8+iQWhsqB0qaX1HsB5a
         E2bFkJekL/2KvZ78MJa9GUL2vzLoKkc0Wr71Mv0JqxyZsf/h87J0/FMoC0u3iAsd/rwa
         ROKg==
X-Gm-Message-State: AAQBX9d0dj1OkBkeWDDsi06h39L+1RrzjEFCXYEfPMxTLeXjvbNLP14j
	Oki2EwqVw6MyrALppAxDH4S4ygqW0sqWZB+gX0NR7g==
X-Google-Smtp-Source: AKy350aIpaPr4xkUOoyYRC1YeivqX5fuZiepgJF9m7/Tyv5uVXU7MJ7jIbfLDhJLisWLy8EL4Ur1dcuPwccTzu8ER1g=
X-Received: by 2002:a0d:d742:0:b0:555:d20f:6572 with SMTP id
 z63-20020a0dd742000000b00555d20f6572mr1162824ywd.12.1682062729773; Fri, 21
 Apr 2023 00:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230414-immutable-irqchips-2-v1-0-6b59a5186b00@linaro.org>
In-Reply-To: <20230414-immutable-irqchips-2-v1-0-6b59a5186b00@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Apr 2023 09:38:38 +0200
Message-ID: <CACRpkdbzNgkmhxhGTP3Rs-PkirDTXRWbOWjF1R4U61Wm1mAQaA@mail.gmail.com>
Subject: Re: [PATCH 0/6] pinctrl immutable irqchips
List-Id: <soc.lore.kernel.org>
To: Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 4:06=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> This is the final set of immutable GPIO irqchips conversions
> for pinctrl. All done by trivial thinking.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

No reaction to this so I just merged these.

Marc: for the next cycle we can start checking what is left.
I think making irq_chips unconditionally immutable is within
reach.

Yours,
Linus Walleij
