Return-Path: <SRS0=TdV8=JJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDB4C433B4
	for <soc@archiver.kernel.org>; Mon, 12 Apr 2021 13:48:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A1E5D6109F; Mon, 12 Apr 2021 13:48:33 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96CD5611AD
	for <soc@kernel.org>; Mon, 12 Apr 2021 13:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96CD5611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MybX9-1lkaxv48Fx-00z1i0 for <soc@kernel.org>; Mon, 12 Apr 2021 15:48:31
 +0200
Received: by mail-wr1-f54.google.com with SMTP id s7so12904804wru.6
        for <soc@kernel.org>; Mon, 12 Apr 2021 06:48:30 -0700 (PDT)
X-Gm-Message-State: AOAM5324EwUqaDHq+xbtu/tR5Bto0Ag/9x0ddSjX4yhy5LypTw1ieJQh
	Amo+zD4mM+MxzjF+R3cD8AzhiQ9hYOBYnJxk1Wc=
X-Google-Smtp-Source: ABdhPJzRKsuHD0/zPPicEoAxxZxBRdHEuIhju2Sjyhs6U3CtpsN5iiGtWexs/UH9JtENKAiPv0Fc8B0whXOW4BsN5Zc=
X-Received: by 2002:a5d:6a11:: with SMTP id m17mr32604882wru.361.1618235310703;
 Mon, 12 Apr 2021 06:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210216074929.29033-1-patrice.chotard@foss.st.com>
 <1cd91834-6df8-a655-a3b1-0e16f5fe470d@foss.st.com> <52c32145-7f29-8944-58dc-dc2fb406ffb0@foss.st.com>
In-Reply-To: <52c32145-7f29-8944-58dc-dc2fb406ffb0@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 12 Apr 2021 15:48:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1upDuztHd0pH_dM+OpMp8WtiMPAZN8p=9xxtCSVJGZMw@mail.gmail.com>
Message-ID: <CAK8P3a1upDuztHd0pH_dM+OpMp8WtiMPAZN8p=9xxtCSVJGZMw@mail.gmail.com>
Subject: Re: [Linux-stm32] [RESEND PATCH 0/3] MAINTAINERS: update
 STMicroelectronics email
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:AqcUWQrlXwL3Tj5XVmiKAUWizBdLQYBA3Zk8+jv6nlAabFxHrAr
 JrkaKhv7hInz9d65QEQLAEIXjtNTbZ0NFEYp2PeOVyxkIbcD6qN/01c3XT2J4JJkL/xCblX
 bPrCjRxlYp5MqZxplMee8f3Xq9hzZhz9Uv1CovOcCZH3dXnN7Da3EsxsJXFFPlw6Q4Ue1Yo
 ocZ9f2JI+gq7XMY/zR5WQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YDSAl845Zew=:tABZ8+DAg4muN4fRdoPq5D
 TsZ3r5e7K3JkhG0aKCe51jZiDzfk1fP+WYmIdC9inK7654/NpAmh5qEl+LURO5GgEvv2JfFDi
 mRtX6gQNE2lLFKu7Ycvgyb74owDFo5hk681npCjdq1bpGTLHJ9Ogv690T3blP7rjJ0SwBefaY
 hRc7cAuq/caUgp53puqAVSmD7xH0Q/CWNQUmbJS91whSOb4nNJwly+i2p0IELxoEeYecMwfg6
 b0/ZdgvW5ZPBCtcYI5O1O+1mXxzxQnJaStxhqp5BvrteEDs/HnSGQezZMJ24QsUk20mJdDJcb
 +mLqX6jy4yxXei1bZjxug9Szsui7zJ23jfgwwri4usbQoFjYTfl77/GUPGKEUJVcvQfY3Qcah
 0XF+g3kUob4vt2+Vq9ys6VCH8eNOEzhq+c3vFtK0aZVQlXbV1BJ7dJJ79UNM1fxrLI5HzlgZe
 3BQ/UHD6+trNMqMHOM5e4bzg46QW46g=

On Mon, Apr 12, 2021 at 12:19 PM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
> Hi
>
> I think this series has been forgotten, any chance to see it merged into v5.13 ?

It's in -rc7, but it appears that my email reply went missing when I merged it.

      Arnd
