Return-Path: <SRS0=5S2w=XG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43124C433EF
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 13:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05889C341CA; Fri,  1 Jul 2022 13:25:55 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B189C3411E;
	Fri,  1 Jul 2022 13:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B189C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f178.google.com ([209.85.219.178]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mfpf7-1nRb6c1ZXN-00gJuo; Fri, 01 Jul 2022 15:25:51 +0200
Received: by mail-yb1-f178.google.com with SMTP id 205so1609540ybe.3;
        Fri, 01 Jul 2022 06:25:51 -0700 (PDT)
X-Gm-Message-State: AJIora+8jGnc2tzYzV3ToodWyAJClBu3Q7Hds8RIknSEODarxGfrVahq
	ffbikEv4LPtLM2fqlmoYLbXmmXl3rWewc/BT5qY=
X-Google-Smtp-Source: AGRyM1v50P5NPGozA3wyPyk4TcCAReOb9wjqGQSZyh2WJyG0U+W5GErPSuI2I+An1Dwcn17/8FW8lW4eU5gRRNDEo3g=
X-Received: by 2002:a25:8202:0:b0:66b:15cc:cacd with SMTP id
 q2-20020a258202000000b0066b15cccacdmr15837633ybk.452.1656681950096; Fri, 01
 Jul 2022 06:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <85e47007-bfba-7a64-db75-893b0d20d025@foss.st.com>
In-Reply-To: <85e47007-bfba-7a64-db75-893b0d20d025@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 1 Jul 2022 15:25:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2OC=G-gw_Nny-ATj5dHtVcLrGHTK9qvs+QPUw52RWxhw@mail.gmail.com>
Message-ID: <CAK8P3a2OC=G-gw_Nny-ATj5dHtVcLrGHTK9qvs+QPUw52RWxhw@mail.gmail.com>
Subject: Re: [GIT PULL] STM32 DT fixes for v5.19 #2
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>, 
	SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:hsSVrbi8XKP52sHaoacbiR8DXan6A/FEcwKaCkXfkBgTgc2qSsY
 fjBATS0zbyF08jeBHqdUOOJZzFFmp+ucRQD3+OkQt+mIoxiYxvIb4bdFkdQVF2NIc3pXJrc
 ZdLlJ3A6JwXRHKwgdVCyqZMeeBs9DMCHq2BfaA01h/I3b+NTrWWse+Hj7iF/5WfM080HvkK
 IrSojhn1EiJ5AzFMT1vNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:e1GhUGQaKFE=:IoqyGw5+xDT1DRdkbLU6/3
 gacfcBQSW9F3wkXHccgeLEOOabKII0u0GlfDiJ486JobiNZb/wzWiohQrkriRPGz6qtXpSOkf
 pKfkxlWXWuFDx6DvQztKdcalJIrjyhMqayhdHmD5eof7wyghCKckgRHvJa6mWG1VuDoMndB3j
 SXy+Gu5TLYj1BmP0TdjGHi4FARgkwT3GlM0MxoletUNMTxkFPxzwbT1MotQgZklXQvLZEHSsZ
 lEgrVmNXaBd/k07pLNS2/4sseQLhnEDT/WmfMKOeO+5Y7d4EMTCihCy3nWp/mG7dhwoZXEBNn
 rwSbTOcYzQntSDWsyHbTAOpvD/bzztHsd9yEpTvIuVGwAI3tR9Q8LiFTaErZLdoxFv2GQgh1P
 8sGwz8AMw7JG/2ieWSub77BFS0geTSnEF4211LQ0o/oWT93BkypTeN6ucm+K1YsveSFQWafyH
 dTSeptOqUXaq11nBD4SMLd/8WgkA3Mtt2rkBcJkjeuZY7hG0816rPGxyZCNziuuej2KwkAYWO
 j+1yFhoKMYSpVSUrIzfwhcnaD3PQ8hq/7LQoWkv4Nf/YMaLvRjGIAKVZYp7NrX+bUe2pv5vKQ
 8a4RssVCT1GX3sjL0NXst777375T4aAb0cdxrQ77jPfHiKKtS8E28B72vqNcAzaHgk1kfRVF8
 Af14K4dxx+OC1jBD21dGMh5POmWg3YtqG4pUhxewMM72HH08N7vf+JO5Ry7Aw7xuvGb0b5tLY
 6+AlqTBlK9lxtG0qwyQoM3bjXqQWCigtSlpHGA==

On Fri, Jul 1, 2022 at 2:05 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi ARM SoC maintainers,
>
> Please consider this second round of STM32 DT fixes for v5.19 cycle. It
> mainly concerns fixes for SCMI version of ST boards introduced in v5.19-rc1.
>
> The following changes since commit ea3414e1249ea35bc02debe28d4cbfeb6261657c:
>
>    ARM: dts: stm32: move SCMI related nodes in a dedicated file for
> stm32mp15 (2022-06-07 17:22:21 +0200)
>
> are available in the Git repository at:

Hi Alex,

I get a merge conflict because I had picked up the "ARM: dts: stm32: move SCMI
related nodes in a dedicated file for stm32mp15" commit from the mailing
list, so it now has a different commit ID from the one you are based on.

As far as I can tell, the patches are identical, but since the files
are modified
further in your tree, this confuses the git merge algorithm and leads to a
somewhat ugly git history with two identical commits if I fix it up.

Can you rebase this pull request on top of v5.19-rc4 and resend?
(note: don't rebase the non-fixes pull requests unless you have to).

      Arnd
