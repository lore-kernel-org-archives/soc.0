Return-Path: <SRS0=IknR=XJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E33AC433EF
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 12:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2404C341CD; Mon,  4 Jul 2022 12:31:10 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73FBAC3411E;
	Mon,  4 Jul 2022 12:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73FBAC3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f182.google.com ([209.85.219.182]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQdMG-1nvbXZ1BLS-00NjWk; Mon, 04 Jul 2022 14:31:07 +0200
Received: by mail-yb1-f182.google.com with SMTP id i7so16605156ybe.11;
        Mon, 04 Jul 2022 05:31:06 -0700 (PDT)
X-Gm-Message-State: AJIora8FIa+7Aw+yrY3zPdZkzwK/6tiPsHwwMCZ52zfD+1VPQTM4Ic7Z
	SShWokGKs0SNQRvLyVhaM+33tOuviDBbVzUp7fc=
X-Google-Smtp-Source: AGRyM1uIsB5p1OtXGjLSwI0R54AfR1c1LsYfX6zy+YyIgV3P1Zr8/Ygsw9x+P8wejb5hxbdNzj2H49PkcBqYdnJXq4g=
X-Received: by 2002:a25:7c41:0:b0:66d:766a:4815 with SMTP id
 x62-20020a257c41000000b0066d766a4815mr28599498ybc.480.1656937866036; Mon, 04
 Jul 2022 05:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <85e47007-bfba-7a64-db75-893b0d20d025@foss.st.com>
 <CAK8P3a2OC=G-gw_Nny-ATj5dHtVcLrGHTK9qvs+QPUw52RWxhw@mail.gmail.com> <a1b80bbf-11a6-d5f7-ce40-04a644039eaa@foss.st.com>
In-Reply-To: <a1b80bbf-11a6-d5f7-ce40-04a644039eaa@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Jul 2022 14:30:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3PUzuKYUGmsFDD4GCK1-1n1rKpAFDo0LRKxT-HdoTyAQ@mail.gmail.com>
Message-ID: <CAK8P3a3PUzuKYUGmsFDD4GCK1-1n1rKpAFDo0LRKxT-HdoTyAQ@mail.gmail.com>
Subject: Re: [GIT PULL] STM32 DT fixes for v5.19 #2
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>, 
	SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:KvdoqdaHe572D0E9eg+EwDcNB+zjOUA5e2oU0hHoE7Ftlvndqpm
 u6oIE4A9ZBVbvPMhF6wQwT5wObeu43d5qLdvGUuJC5PAoCrYR3JR8hV6VuKO2y+4xxTusPQ
 1m5af8R4EggtbFxWytmysT4ZcS2rKU147GHtIWev558dop6H9xiRcS++/SKV1M98154uWSM
 fFi3d9xnxkL2fNqDxfHzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pGo8VG4zYCo=:9stnM1SksADwY5ucascgZx
 MLTDbSAMErAhiL68zCvyk4PlZzjRkntpEck0XBLGuhBPLcckUBmbt1UYmp3fCDjYAV/oVN34m
 fLWfINVlnWMrfMXKWcvvz+u507/Rgtv7WYdOw4FTNw1H44NOsInR0hQ3VSOaeFwEhkEW3ZL8j
 SClhrF7OAnfLhZ3HOVtZSroj9GO5jpP/HFtRjC1wsoA5m07AslFzxlA15bU6aevMKNUaob3j0
 SJ/3wWZFNRL1ztzlgJAHRzCpeyI3kSVBS6kk1/fnr0ukXs2MmKViPllQp+Us9LbLWfSocMAvW
 sIYEYvqudvpETY2v4DKQgPDkkWpDSUfv+GlSxC0LQm/GS45bYeUeTyeXTusm3aOApPcg8Q4FU
 y93QEqSPThloc+hB/t9v0EpJ6NyQ749nzvHMqjkUIu9E61rjFTErrJtpbENyOREzqVTnur8UR
 rSy6rjHXkNr70T3V9dxkL7CDefKLGMdie5+VMnrFo1tdlQJ2GfYKwOCnN8bQ/PkGj/Ibbz6i5
 K9aE8QkApTSMlX6YcARGnTOGWL7pDArQWmdQpiB8D7JuQTIfvnYD0U7OhcTzfwB8BDCCckmOj
 ajxGBvxzU7ggD7SHnd28l3sr505ej7vFaD3YCSK/AEIHZnDzL9Ft67DNeie5Xe/x26+pKQb1x
 aPr+fQgYUm/GDwz2jlubWVNfByatStphwB6Idm3QZRbBENywueZPglhG+jqKdVmuFvZd8/2mP
 9FGPYvT0axVvH30aRoS5ANR138Uy9sCKJxnYPgSZHyU79UdhtmZWtYVSZ5X48qKdJvHE8TpuV
 htbP0Sf45RewrKSk4QY8jk+GORONH6pQHtJhhOOikzXSPO5xiIEEmuZ1FUdp/xeTDYhYm5BW7
 hCXvR3U7UNqeSbuyiv5Q==

On Mon, Jul 4, 2022 at 9:52 AM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
> On 7/1/22 15:25, Arnd Bergmann wrote:
>
> Hi Arnd,
>
> No pb, I'm going to send a v2.

Applied now, thanks!

> If it is not an issue for you, I would
> prefer to rebase also the stm32-next to avoid conflicts during the merge
> on your side.

Yes, I see  the same problem there now, so rebasing that as well is the right
solution. I started my other branches late, so rebasing on top of v5.19-rc4 is
fine, just no later than that.

      Arnd
