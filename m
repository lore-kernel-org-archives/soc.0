Return-Path: <SRS0=Hl04=JK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1682FC433ED
	for <soc@archiver.kernel.org>; Tue, 13 Apr 2021 09:17:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E15DA613B2; Tue, 13 Apr 2021 09:17:49 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0AE3610CE;
	Tue, 13 Apr 2021 09:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0AE3610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MnagF-1lvNBG1E61-00jYSO; Tue, 13 Apr 2021 11:17:47 +0200
Received: by mail-wm1-f52.google.com with SMTP id y124-20020a1c32820000b029010c93864955so10205496wmy.5;
        Tue, 13 Apr 2021 02:17:47 -0700 (PDT)
X-Gm-Message-State: AOAM5335Jr1LhHBR7gOS2PPtY3w9cERohxpGQfuxFvuY8r2yI4StFFt8
	XuI7MwQD4tULB+khoUHy1wxx4u+RA0Ia+/z9U2I=
X-Google-Smtp-Source: ABdhPJyNUve97JrIr0kBguXGbkRBZOX5rXMwISaSJVKj21G113V96C52lgPivPrrcKwvuuf/k9OPjKrBiJ9y9vG+wN8=
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr3046097wmi.75.1618305466986;
 Tue, 13 Apr 2021 02:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210412134700.1977619-1-linus.walleij@linaro.org>
In-Reply-To: <20210412134700.1977619-1-linus.walleij@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 13 Apr 2021 11:17:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1yKNF9NkRZNKtySjFKZ2WzLKrk0B+XkcmH3A=awi6C7g@mail.gmail.com>
Message-ID: <CAK8P3a1yKNF9NkRZNKtySjFKZ2WzLKrk0B+XkcmH3A=awi6C7g@mail.gmail.com>
Subject: Re: [PATCH] ARM: defconfig: gemini: Update defconfig
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:uXkUAv7kGSVhyGYiEAuMBkly51mYZ/+LHmlyAkwbjL1UcKpXMCE
 sZlGtDI5WicB2sQIqIZ7GN0qk7euQ9Z+C8W60Swgx4KeXa7aiDCOvop6UpUSzqMusZbMbiw
 6qImRz3AfcWWYIEGchugnBq5W6c8P6j28m7ddnrfePfbgIN+nJjR7zpkmzxlyDXRoJk9YRc
 YoomspLNgnSNS9LWzlutg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VH0y4xsP7sI=:8FbeyqHBmAqhKhqN8imHRa
 VS0xkHsDw1DabyTB/TrabrR3O6WbsFcK3ZKLlin38eLMijT4GG5EzdwZHE5hb0GAYwu8XED23
 R0tPwaTjW0saPGQhMww4fWunaYo6g15NZqz5yjJG4cI8+KvyPk6GPqzSEmuRfUz+70n7Qg1DU
 1xkETEOZoQB/uWVOTKQv8/ZVfJmw/7zM/cQMV2VrnKb7dg0Re12pN3GEqcisRf0XGJeFCsFBX
 b5shydkY5jtdjX+y/cHBgHbIXQ72vHk20LYzScLNLtnVH43fkJrPfUIhL2b4XQhKRO6uZpY0W
 kHSG67TkYTpo4cM/SRSSnOwx2fLLfz4q2CxbGI0b+q1EZ0E9sPh5CVxGfqG5N2aG/63zh7nW8
 2rtRn01iIatXZXtyPSjY5MWPrDLevvaBIutCcYSFfzM/OJxAQF6CWBpRXVRpw9YNgbeRd/x8o
 Q1A+jr0Zuyn4a/tZqX1BZQ8jBb6hdt6YcDJBnRCpZm5fookxSSx9DNiDGrGr+nhAyx/ars7RF
 InFWWtb9EHfNa6uO2r9VUQ=

On Mon, Apr 12, 2021 at 3:47 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Update the Gemini defconfig: some moved options, added som
> WLAN drivers existing on the supported platforms and enabled
> the drivetemp sensor which is used on the NAS devices.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I don't like patches that mix functional changes with what comes down
to whitespace. Can you resend this one as a series?

At the minimum, make one patch that adds BFQ, DRIVETEMP
and WLAN changes and another one that moves options
around that change after 'savedefconfig'.

For the CONFIG_ENABLE_MUST_CHECK removal, can you
send a patch that removes this line from all defconfig files at once?

      Arnd
