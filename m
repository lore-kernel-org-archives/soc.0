Return-Path: <SRS0=jJml=US=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26375C433F5
	for <soc@archiver.kernel.org>; Fri,  8 Apr 2022 14:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9117C385A3; Fri,  8 Apr 2022 14:17:36 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41A99C385A1;
	Fri,  8 Apr 2022 14:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41A99C385A1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8GIa-1nywjl0UlM-014CAk; Fri, 08 Apr 2022 16:17:33 +0200
Received: by mail-wr1-f41.google.com with SMTP id u3so13098830wrg.3;
        Fri, 08 Apr 2022 07:17:33 -0700 (PDT)
X-Gm-Message-State: AOAM530sP4+UIxQNi0rWHs7a7UaDEj85vviYgoEYS7A31c2QCwYcdxmL
	tJV62V6Ic939utoiIOxmYizW15Yyll5ctJsyKro=
X-Google-Smtp-Source: ABdhPJyRvLylYLoRuY6841KYpUytqXI11HqBYxQTS325hyru8pYNuf4xphTlAZhMdkzDaG6t0dxOMOlKEQOVIRLpsBk=
X-Received: by 2002:a05:6000:178c:b0:204:648:b4c4 with SMTP id
 e12-20020a056000178c00b002040648b4c4mr14524137wrg.219.1649427452724; Fri, 08
 Apr 2022 07:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com> <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com> <20220408133246.fyw5554lgli4olvg@maple.lan>
In-Reply-To: <20220408133246.fyw5554lgli4olvg@maple.lan>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Apr 2022 16:17:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
Message-ID: <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] soc: fujitsu: Add A64FX diagnostic interrupt driver
To: Daniel Thompson <daniel.thompson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, 
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Jason Wessel <jason.wessel@windriver.com>, 
	Doug Anderson <dianders@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net, 
	Peter Zijlstra <peterz@infradead.org>, Mike Travis <mike.travis@hpe.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:X9qbcW4xNEOA45nPjhp01CEhS/iO8UpBdKdQQqjaNUWIaX7eFrj
 sXbeXJhfj2D6X/5mIb3S+21B+pD9LzUiEEE1f5dTohhpPpfeNamEqzHXGwfdLAJVWCiVJ2J
 0JTXoQE6IeK5+9Knk/dulNDpUqPwDpQH2BhfHQiPDx4v2wwoUFV2ohLzVpsDI201UjtIJI8
 lm8bKxoHGx8t0RASUNqMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UNcBtMJ8Jhs=:Wo+BodL5OFI2ANaZTfoNc/
 puXp7UlSmWjbWtA1rAKt6QgkFYXti5idoqUAmlYa4a2scNDK+k5nGRR1NEOnYoYaXFus10sbB
 ctDnpNWYJWNVSbi8jHZn14NHWebJ5L1UDgRT6k+ao3cZe3aScFZocIIc1CFAIWaE3DFRdr/Am
 9fXNPC17M7dBgqdCZFZ4ij45ggRQFdEoDYQc5T6X4mLKxneykaK7e7yxkwSY5JoZXGqPk9loc
 bi2Am01+cDPmaGtLQ3UhVCs6v6ohUZssKni932pzIie8VJ7xeNLShD+wcoC2nnAZ+WFzcmhuY
 vebBXKK0rzA6qHB2KYrn7nfbEvD41kdnngI5WtLp8OmoxQKe1DHmayi3FkNI5F7s2kb32GhwP
 Jj08cDWn+FSWT/u6xik7jducAg0stwSloj4B5Pj7SQlSzM0BHUAfk9vHaddMiM+u19r5+Ses8
 PbOts/GA99qXd04yEQDLghYeziEuHTMHPlsCtT+gcahyb+ekCrwdHh+As9JduY8yFmW8PsBNq
 MtkoRwh8SW0o6d92lAkTiFWrEnWDPYJD75QDBoeiw2k/1ksmkSm09UuRROw5va5sSQeh5hIWT
 Xm6b0PuS+naGCQkq93wAXwHecqYmjeARHqx315GxTL3V9OL1uWXkZVKvbrY3T4ksE9NsqNgsw
 LE5KhwxbgAMTHrJdLwZhYVH2VeYegCoabD28C5Khy+ybd9wKJmIgmEtTo+jDAP6rZPlAi9Lmw
 AgqXtOdO13dYAsBm22gRu0UBnJFfxyzRjO4k/Pt+j4e+MbSZKuV1BJcKT2DMK03tqaA4JDv3H
 U1FKGbfMRHMS99cIwyNhyNskUjeFEs0JAQYlkLmbFaLaEpzw74=

On Fri, Apr 8, 2022 at 3:32 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
> On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd Bergmann wrote:
>
> There is some prior art for this sort of feature. AFAICT SGI UV has a
> similar mechanism that can send an NMI-with-no-side-channel to the
> kernel. The corresponding driver offers a range of actions using a
> module parameter:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/uv/uv_nmi.c#n180
>
> I don't think a hardcoded 'c' makes any sense. With a hardcoded argument
> it is just obfuscation. However it is certainly seems attractive to be
> able to reuse handle_sysrq() to provide a more powerful set of actions.

How about a module parameter that allows picking a sysrq character then?

        Arnd
