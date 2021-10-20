Return-Path: <SRS0=LSP4=PI=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653E6C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 13:33:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3FE466128E; Wed, 20 Oct 2021 13:33:36 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A28A460F22;
	Wed, 20 Oct 2021 13:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A28A460F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mt6x5-1mxSaq3dcH-00tQet; Wed, 20 Oct 2021 15:33:33 +0200
Received: by mail-wm1-f45.google.com with SMTP id 77-20020a1c0450000000b0030da2439b21so1845805wme.0;
        Wed, 20 Oct 2021 06:33:33 -0700 (PDT)
X-Gm-Message-State: AOAM5324qrjfq1l1mNf/blTVwlIt8/B/afuh3TqUV0u9a1rziTScNFr6
	nMinugz+seKmBw9rNX93j9Ugxu8AiHZwtRMEvvw=
X-Google-Smtp-Source: ABdhPJxY/Ua7ZwYe4Z5WF5LhCFLVLILKFKBq3mgQsPNvFmW5mHTQv/qL3luMioBXbYeLCvcOb7xVR7smc7gDFtx2g/E=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr51896376wra.428.1634736813387;
 Wed, 20 Oct 2021 06:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211019141228.1271617-1-pan@semihalf.com> <20211019141228.1271617-2-pan@semihalf.com>
In-Reply-To: <20211019141228.1271617-2-pan@semihalf.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Oct 2021 15:33:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0g82DoivaADueeOcKOjNVDiutZLAAWAROzgvuYt83Z3w@mail.gmail.com>
Message-ID: <CAK8P3a0g82DoivaADueeOcKOjNVDiutZLAAWAROzgvuYt83Z3w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] socfpga: dts: move arria10 aliases to socfpga_arria10.dtsi
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, upstream@semihalf.com, 
	Marcin Wojtas <mw@semihalf.com>, Jacek Majkowski <jam@semihalf.com>, Konrad Adamczyk <ka@semihalf.com>, 
	Tomasz Nowicki <tn@semihalf.com>, Alexandru Stan <amstan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bs2slhwtKTb+g+YtjRqzSeL2KEwqFH+/C9FL+S1XxGExIwaWcf9
 d0O/igceoHfhEv5F5pJ1x0GRi+4CA6S4bS6v2yS7kGybdwdJISDGXmhFWBc1By5OLQN9+3e
 6cY3/0pvR7Y9g9go4xu6kk2XI4mru4Ayo4FDJ8rW87MNOekAk/HlmBRqt3ub736qoyKg9Rb
 TV/EGPKCv8iyBkoD9sTEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YB8zGR/r8aQ=:e07abzRrSENtsRs+Xtq4Xr
 GxuIAHGC27QnlESrelZzetKevHqWGEuh+xvvp4TQ/WX+TMGtQi2ytsqbwOCCUL6h06Q+PjUQY
 Mom8kj4MN+C/w3LFk+Y44cB76SRSGiCDy1QKn7sN/t4DXvpANWYhF7UdFjrgk4xTXFzrt4qt/
 aapxGHU5BQw3RbAV2eRPTmwGwVvXDJC/HEyV+JHTSpsDppxuQCe9UCDFO4QpTFtze7Wk18oPE
 IWJtb7ItLZS5eaUrqzIzsE0KglhZ8RZNtpWvW5QiwblodEFGjvCJpnK4P1qwj6cke+y5E19hI
 6W3+Fb1j8zv0r028flKPJybl2Jlo68gGQqRC9kbzMeyUHglaiKi7E4M9drs8vvXI4CDaHYX3h
 hfu8NYjlxYIRyM1lthNmuYcaSaqEfoFtWl27LCTzt7fDALTMm1ge5zpRGGp5BuGlEm60DWsKf
 CIfTrE/wrAjHeMKVbxH5CY8IqfAdb/O748Uz4OOM0D7YZsWb8remJQtK8g415RYYtuXCOkEk4
 SfFPGauSopLOnIzgJQZUMQeqyKCNbGACpNkLKSMRKj8580khk+4FF5Kt9vjXZMXpZCQUTR+dy
 oZ/Sh53/WQY6JrKlNqz9w+/iMp6pK5RjZwlBJ1329Y8p98bdRmRCkIXKx9qiwHIaESh4oSOqw
 ee/gx+FEmrlm5bJ8bApSpte2Rp7rnlxay9z1zfxsulgkoDOvVi5h18Dqki6UTjibywNmd6RM9
 osTa02Acq7fZMUKBYPov0jl0BvcXlHtGBgifsUeC3RcgxxisG6zdQ9sYbdo3P0MJ1IHxB+nOr
 l8+r3smCya4I7+N/HYMUuEvo6Fz5zTRltLoABoteg9SSDIaviKEUs9gJKHIcfqqoYNyaw/yU/
 Qlmd9aLHcYxBNvBQZdJg==
Message-ID: <20211020133317.HWMd2BIYR9yP7u0q11dTVtx0pKi8n6RYTajVvjL1q6I@z>

On Tue, Oct 19, 2021 at 4:12 PM Pawe=C5=82 Anikiel <pan@semihalf.com> wrote=
:
>
> socfpga_arria10_socdk.dtsi declares aliases which will most likely
> be used by other arria10 boards in the exact same way. move these
> aliases to the parent file.
>
> Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>

No, please move them into the .dts files instead for consistency.

Each board may use a different subset of them, or have them
numbered differently, so keep it out of the .dtsi file.

     Arnd
