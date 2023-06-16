Return-Path: <SRS0=6Qaa=CE=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916E5EB64D8
	for <soc@archiver.kernel.org>; Fri, 16 Jun 2023 13:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5AFE6C433C8; Fri, 16 Jun 2023 13:05:58 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6991AC433C0
	for <soc@kernel.org>; Fri, 16 Jun 2023 13:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6991AC433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-bd20beffda6so589374276.1
        for <soc@kernel.org>; Fri, 16 Jun 2023 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686920756; x=1689512756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCWwAxyqGz0dxVXdN4x1E9m1cKBoRvQl+WOQKo4Ngkc=;
        b=kJOkHT/9WI9ZhjEVBC5ffy4RKQ2e56uvILwN0NNAL8OZFh8vlcv4hO76ZKqOXUg1VD
         6626p7GXkfPAzGwIZ3XO/YyqAEys06yHkP6Fdif29Rrp0rSpY/l8aKiQl/To0Qt4tiHn
         KTRGxwqML7Nt6GSe3sf+lJvlkvpKjPLBHqbTfccv8nFH2cQF8soLCzeqAhFMwgXSWHhp
         h5lmRSCjEq1S3VDLAJtnvPOPC3O1k0V444yzFXjw10S4CGcAWN8O62rSmscbsUkF9rC0
         r8FUpjUMePa4N1z669hlarQLCGcmACZARuQ0xqKxZWkEZ9clovV3Sk8LXT/wcwyJIqbZ
         YKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686920756; x=1689512756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCWwAxyqGz0dxVXdN4x1E9m1cKBoRvQl+WOQKo4Ngkc=;
        b=FdnWWc7yFvf0DPDCvJQ9+q2UxelxQlAlKN10feRtu3sLiWLeeLeFchqlNdJXkdYrRt
         gfiUY0W+gxn9cl+5O0PMfTHvl559Ml37/lJnSIfZsZilwi3zs4y7ZfB1uhl8mPTOHB7C
         KtFkJuC97oNsCPYDhZIxvlPq8MGr6dFbPqtL6xFH8qVxePlmHG58sXq5DdSc+Dg3D2C3
         M/WyFwCA7nflYKDSJYR1tnQU2nf6IFikstXVe7j1G6H86Eqwrva6n1cA1IG+nXGPth1+
         ZOPRK5E/To6PMaqyA+4qgFfC45YGXO5CnUQ4MtiSKXFX25A5F7QHtM9C7J9LE5YDwACi
         vaOA==
X-Gm-Message-State: AC+VfDzBw0YRr9wT0K9jTj1h7bsuvVQLz1UmLkLZ7/czIEExjqztGq1F
	Uv/SajjmwwoCLXMDJRly9+aNSVGbjcq6C2KmtAwfb1x0pNFuDPlA
X-Google-Smtp-Source: ACHHUZ5pOMIU5uT5Cgpg9V3UqjrChj1R0w733TwLwO709KQ5qp4fyYn+zFzkp1pMtnlcbM9Oht/0CMiGdpBdydbloLw=
X-Received: by 2002:a25:2fce:0:b0:bc8:cd2c:2fc with SMTP id
 v197-20020a252fce000000b00bc8cd2c02fcmr1786081ybv.24.1686920756233; Fri, 16
 Jun 2023 06:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230615164158.25406-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230615164158.25406-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 15:05:45 +0200
Message-ID: <CACRpkdbfeZggGckLzzGLycD8PxRejOX1Pk+qWZT0AKRSsqpMQg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: spear: Remove unused of_gpio.h inclusion
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 6:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio.h is not and shouldn't be used in the drivers. Remove it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
