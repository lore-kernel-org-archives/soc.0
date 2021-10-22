Return-Path: <SRS0=T102=PK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B4CC433F5
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 20:01:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9457D6112F; Fri, 22 Oct 2021 20:01:00 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82A7161108
	for <soc@kernel.org>; Fri, 22 Oct 2021 20:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82A7161108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MwQOx-1mwe8S2hLJ-00sLcg for <soc@kernel.org>; Fri, 22 Oct 2021 22:00:57
 +0200
Received: by mail-wr1-f53.google.com with SMTP id v17so2399577wrv.9
        for <soc@kernel.org>; Fri, 22 Oct 2021 13:00:57 -0700 (PDT)
X-Gm-Message-State: AOAM5327Wl9RtL9QU0VgILC6gaRnHTPoZee+XO31ssZqrV7+qIMJkKNg
	oP+5CPfkHCCthzOXm9CeidLZMM70EO7ko7glVbU=
X-Google-Smtp-Source: ABdhPJykB2zHZy9faQjgNNF7k2Y+K9BFybXRDQbUIX6GurBqz3GfQNVuoEXKuTcX56c1QuXpTra20/c3HB5ZPuyaVso=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr2324574wra.428.1634932857291;
 Fri, 22 Oct 2021 13:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211022000616.481772-1-joel@jms.id.au>
In-Reply-To: <20211022000616.481772-1-joel@jms.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Oct 2021 22:00:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a11h=hAHD03OMdkmuVN4PzdG98KhVAE5X7ETkJABE4e0g@mail.gmail.com>
Message-ID: <CAK8P3a11h=hAHD03OMdkmuVN4PzdG98KhVAE5X7ETkJABE4e0g@mail.gmail.com>
Subject: Re: [PATCH] soc: aspeed: Add UART routing support
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>, 
	Oskar Senft <osk@google.com>, Lei YU <yulei.sh@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MrFLtxvTmxoBua/Z9Rj0jqQRMiTpEWyyCEDYKhuftNmfrZbc8IS
 zvhWoWViR6+ZG7P6VqbrLOuEQwh0KhjHQ7dOthP6z9NuSSD9TtcHqM6T3qGoRQ5+2phj2by
 VdDFN/TIMbZVCuft1FkhZA+o4EUNbJ8Fmis01hg70ycgabvtfvYqUYcAupGTDDpRO3BtZLA
 cgSCQV/Cn08VJ30UJggLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HTyx+ViwKzo=:zDiekAC4EKzMdM09dehNUd
 SC62W1OiNgLOfRLxbABuC+t2Ar2yGnrKY5zWn6ba/j5sjoNjECXy36aQpaATd3r8rmvF5gTYT
 dRkPBZHTJGpxBJ3ZlQTBwZL2u5cxOtlTqpes+YSwH7KLyheR34K5yBIIp7zgztUXoXNDaUKGl
 KSAz9A/I18OrXWqD9QXeKGA6kI8EhdEPxMpjrfqKWN+vcLrVUVMSpLks8GbCKwgCTOPBKE+90
 7n+a8lO4ZN7lkCRNwjDOShj9zVlZCntPuWT+6ifkFdHQhier0UMDPFBLBBX3v2xCDK4lPWDeT
 +MXzvQWhgF9Q2MFMgjV678wRp8yx8MLT+zyMpkWezwgJ8dLfx8MVXa8dNjwoRJjIOf2WGsRCj
 HVG6MA5+9wbhcbq97Saiywdtu42BTJ8auYSymSXceNbx3GqSN5gAFv1rS+Bld+4AVhfVsMgzj
 SoC07hv5QCuOQdLxgtQ84J1tbs4/7GTQWapMyycEpfOmToemNmfSHvRSd9WSrSs+93M2VNCl1
 +OJi3gMaVZ78ZNRRmpdrtC2VWjJmPpHqJ2tJHH+LEnRffmFrFLrCQ1LVpBcS3qXMan1QxcVuk
 NyDPJl4BPDPlg/SmZED9sy5CKmzRom6I/RpXaPZwSu2nf7paZ/wjvzQb66KmNcv7Gv9BnNQ4U
 shHYisgQlW/iAObL+P+xh1/NCtPa2avJHyMTpNJT8B5IQyAgfkHndcRHcaSEbuwMzKMc=

On Fri, Oct 22, 2021 at 2:06 AM Joel Stanley <joel@jms.id.au> wrote:
> Hello Soc maintainers, this is the only soc patch I had for v5.16 so I'm
> sending it on it's own instead of doing a pull request.
>
> The driver has had several rounds of review. I'm not completely convinced
> about the sysfs API, but I also didn't have a better suggestion. The
> concept is unique to the ASPEED SoC, and given requirements that it be
> adjusted a runtime means it doesn't fit into eg. pinmux or device tree
> descriptions.
>
> The bindings and device tree changes have gone through Rob's devicetree
> tree and the Aspeed devicetree tree, leaving just the code and the sysfs
> document.
>
> The driver has been used out of tree by Google and others for a number
> of years, so thank you to Chai-Wei from aspeed for picking it up and
> getting it merged.

Merged now into arm/drivers.

It's not great to need a custom interface for this, but I don't have any
better idea and it's well written, so this is probably the best we can do here.

Thanks,

       Arnd
