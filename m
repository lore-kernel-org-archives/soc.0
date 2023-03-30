Return-Path: <SRS0=cf91=7W=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCE9C761AF
	for <soc@archiver.kernel.org>; Thu, 30 Mar 2023 09:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 942D0C433EF; Thu, 30 Mar 2023 09:02:36 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08B9CC433D2;
	Thu, 30 Mar 2023 09:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08B9CC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-536af432ee5so343191907b3.0;
        Thu, 30 Mar 2023 02:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680166953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqG2Z6d0Pb8iORwk+e3Ro79KtXr2omWNescegmF+Vgw=;
        b=dvc0x3EkfetE2DLuHtV8RKoioZRB8vAyT5OKNfRKvo/63pUxmC03sEF3PouT4jJrHU
         9eo7AOq4N9eDme8dKGhugOlxEd9T5YFscoHGpLBjGv7chEt9t7wcVl6Sklp1lCv8gTH0
         Nc1LV9AgfUS2K27hejAfkyUzcI+vxHzbzU04mJJgxL2T5xSBNJvn6/W+UwZi6wfrzi7i
         a8+7uBqW7dgB8Y3eLLHARw13W1fGqnNE+eb4FeqbUofVF9SMp6pASLq7OF5Sl0RBKsBc
         GEvp/KIp0vwbwauUxKoKZmepcuepOBC/I5qUapoiXcK8on3sSAuv/lQAF+U8GxYYezf0
         KIlA==
X-Gm-Message-State: AAQBX9cazkh9GGcGoRkyCRyp/SVHdtjtvcyyRswTHKd0+gAb7hN5p0Qa
	U/pkXfWw83TkVjNM8bebDOduEVZkE++mmQ==
X-Google-Smtp-Source: AKy350atCbhq+15iJk7SToTreK+FQZLeqsfrRlQzowvdqiNc6zUZBLtMrE82x70teM8sw0+L8fPPcg==
X-Received: by 2002:a0d:dfd5:0:b0:541:9885:4c9d with SMTP id i204-20020a0ddfd5000000b0054198854c9dmr21788858ywe.3.1680166952931;
        Thu, 30 Mar 2023 02:02:32 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id q77-20020a819950000000b005462ad5f788sm681737ywg.116.2023.03.30.02.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 02:02:32 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5445009c26bso342281117b3.8;
        Thu, 30 Mar 2023 02:02:32 -0700 (PDT)
X-Received: by 2002:a81:7e10:0:b0:52f:184a:da09 with SMTP id
 o16-20020a817e10000000b0052f184ada09mr2923082ywn.2.1680166952237; Thu, 30 Mar
 2023 02:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230122121129.28699-1-krzysztof.kozlowski@linaro.org>
 <CAMuHMdXdZbJDTOzQG4=pRpR1OCU0=RTDZDH0MnPW8Ea2LJKs6A@mail.gmail.com> <082ab65b-09d3-e899-ef46-7fe04446109f@kernel.org>
In-Reply-To: <082ab65b-09d3-e899-ef46-7fe04446109f@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Mar 2023 11:02:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUf=X2eGpa9P0OF34b8yA8vrx_nFqW+P+Odu5S7P1xeng@mail.gmail.com>
Message-ID: <CAMuHMdUf=X2eGpa9P0OF34b8yA8vrx_nFqW+P+Odu5S7P1xeng@mail.gmail.com>
Subject: Re: [GIT PULL] memory: drivers for v6.3
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Olof Johansson <olof@lixom.net>, 
	Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	linux-kernel@vger.kernel.org, JaimeLiao <jaimeliao.tw@gmail.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Jan 23, 2023 at 11:47=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> BTW, you might want to add separate Renesas RPC IF maintainer entry or
> include it also in Renesas SoC. Otherwise you don't get CC on it.

FYI, that should be taken care of for all DT-based drivers for Renesas
on-SoC peripherals by
https://lore.kernel.org/linux-renesas-soc/c1be1e97c5457eade25b0eb5118196677=
cecfc08.1679039809.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
