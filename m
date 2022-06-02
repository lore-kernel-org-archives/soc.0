Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76D5C433EF
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 22:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3D05C34115; Thu,  2 Jun 2022 22:27:50 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BEE7BC385A5
	for <soc@kernel.org>; Thu,  2 Jun 2022 22:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BEE7BC385A5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f53.google.com with SMTP id n10so12647483ejk.5
        for <soc@kernel.org>; Thu, 02 Jun 2022 15:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4lkEm3X5HzLB+VEej4UrcRIdtwa8kr6O7GlkHLzBLBw=;
        b=gFZIssbt+h/sxsyvNCH7artU5gehoIt/kKoK/9oNcChP/4Sv5nBc/4jjQorEbwGZxy
         78rVbf6zRNHC51dOFpIHY9049CgamsSMbEQYdKzOBB42x+hPXXhdPYjpW4dLfttqT1HH
         L9RZH0Ko5Onvj0xmEoOIQJl3MYHYCouYjpS9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4lkEm3X5HzLB+VEej4UrcRIdtwa8kr6O7GlkHLzBLBw=;
        b=iW+VfTVzskPMpSqaW6843g6WOI03mhDZ+pgeIJZPQdwMf86EEm5gbxeo0upxhzkGy0
         aGJtqdxNDpSZyhmdn/KRY9O5Syryj7W6F88aj+0kUp45JTuYar/1ttlKSLDjIxt168wZ
         zBsfjsD3uRyceOQZC/PzVKpF3cHxBBNHn2+xL1C+2nIIZu0o/DHMuK58CL0hGUEIIeZw
         /ZNfaX3SgfplpHCZrWV9gtBa3Usq7vRrRlOWgO4gR+YRFazYWK5oKe7f5dR2Px8X7APJ
         SYSg5A+zwOt0v9pB7yWMw8aud+Os49ZluhHr+dYVZhQo4tAYmDKH2Yt8OghGw6kLpmT/
         Y4fQ==
X-Gm-Message-State: AOAM533tnjaMrlL5ffcpEzm5jvXUNtV3GkXzdglKoZCNdhs6mqwGaHoS
	cVWysvevgZddNUdHvoH7TT4bwmT9KVXUKX6g1h0=
X-Google-Smtp-Source: ABdhPJzBMfoRtNOoNrqmzOlOaoEcE0YgxpcQg6GC5wzWpNtpUM3PrLDnRFKxpMdkkKMVfsljDrLBYg==
X-Received: by 2002:a17:907:2da6:b0:6fe:b40a:c817 with SMTP id gt38-20020a1709072da600b006feb40ac817mr6103686ejc.365.1654208867744;
        Thu, 02 Jun 2022 15:27:47 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id bs13-20020a056402304d00b0042bd6f745fasm3078915edb.92.2022.06.02.15.27.46
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 15:27:46 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id p10so8153996wrg.12
        for <soc@kernel.org>; Thu, 02 Jun 2022 15:27:46 -0700 (PDT)
X-Received: by 2002:a5d:414d:0:b0:213:be00:a35 with SMTP id
 c13-20020a5d414d000000b00213be000a35mr24746wrq.97.1654208866390; Thu, 02 Jun
 2022 15:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
In-Reply-To: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 2 Jun 2022 15:27:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhJ1dUVVMkHOk88xsYJtqfyGZ_8hSGJoZG5K+uwUYT3A@mail.gmail.com>
Message-ID: <CAHk-=wjhJ1dUVVMkHOk88xsYJtqfyGZ_8hSGJoZG5K+uwUYT3A@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] ARM: multiplatform changes, part 2
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 2, 2022 at 2:34 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> The second part of the multiplatform changes now converts the
> Intel/Marvell PXA platform along with the rest.

I _think_ the conflicts were all trivial, but hey, since I can't
really even build-test them, please do check the result out...

                   Linus
