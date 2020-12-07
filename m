Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727B0C4361B
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 16:32:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1643F2388D; Mon,  7 Dec 2020 16:32:06 +0000 (UTC)
X-Gm-Message-State: AOAM5312LrotLijigboMfQH3GlNshJkxQYN1iRL1O0cK4H15zDXVOgm4
	32fi9WXBQgXqiJfgez0gRzPZqFGS84SCPAQPAvI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607358726;
	bh=Vot2jVn4kv6LhBGwafMmgNCOpgn5PO0D943PaqN+D8E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=As41Mm8K1BkpgEa2ym/6zxX0lqaGuLriHrCziPaBGjd6W556Vj7H0idoyYnlml4ka
	 TFTrR+S9lUTyg5E7mhohm077V5rKzm5WKywmGZXVBsAkGwjSAOaB0PnyS0icVr5WU6
	 1AtTOHUy+z1GFz/q84knrZ26TnKqN+PPty6JvBuEPPxKpCwBv9d21tdeNv08aNUUK6
	 sOfXfVQ5Fp9De39Aa0vzS+K8Lar6DoJ/Wsh2BLEo5mZWRFvwJUDSuEWLNrpn95TFpy
	 b5GZ0ODqk0Z7wVfAVrAyZC7aJyxnFxzF1auy4mqnW5B6fh5hwayvsqlVP9NiNpmdnz
	 v8AAtnzEYOE7w==
X-Google-Smtp-Source: ABdhPJwMX2VF9sMMQJM2oT3x0JMYAcPgdUYN7tv0dgRVk/6A4/+eok8dLgXRQYrQ7O9JWU0dlMgDRUeUTe67I1WGueo=
X-Received: by 2002:aca:bd0b:: with SMTP id n11mr6946529oif.11.1607358725231;
 Mon, 07 Dec 2020 08:32:05 -0800 (PST)
MIME-Version: 1.0
References: <873c17a5-28d5-9261-f691-1b917611c932@foss.st.com>
 <CAK8P3a1o6Dt0wakXB=sUC-t9DkFqSe=ZwSMYtYKsoZNaNfXUew@mail.gmail.com>
 <bb576e8d-cf11-4f3d-6b9c-6944e6795c2a@foss.st.com> <CAK8P3a11yRgy9x-cHNDsuYfLPcg0YFs92T+BxzfNisOqjNCjNw@mail.gmail.com>
 <3bc1fce7-0c51-38a9-407b-5aa105d1162b@foss.st.com>
In-Reply-To: <3bc1fce7-0c51-38a9-407b-5aa105d1162b@foss.st.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 7 Dec 2020 17:31:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Pw+c=yg13E1-_dN8RH78U-X1Uyc4W2PnT6941ZCZ70A@mail.gmail.com>
Message-ID: <CAK8P3a3Pw+c=yg13E1-_dN8RH78U-X1Uyc4W2PnT6941ZCZ70A@mail.gmail.com>
Subject: Re: [GIT PULL] STM32 DT changes for v5.11 #1
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>, 
	SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marek Vasut <marex@denx.de>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 7, 2020 at 5:20 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
> On 12/2/20 2:32 PM, Arnd Bergmann wrote:
> > On Wed, Dec 2, 2020 at 12:00 PM Alexandre TORGUE
>
> So let's continue like that for now. I'll keep you aware if I get new
> inputs on my side and if we observe some PR without MCU patches we could
> reconsider the question.

Yes, sounds good to me.

      Arnd
