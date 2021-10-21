Return-Path: <SRS0=i2pQ=PJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02216C433F5
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 15:34:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D2F84611C7; Thu, 21 Oct 2021 15:34:29 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 321AB610C8;
	Thu, 21 Oct 2021 15:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 321AB610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mi27T-1n7z5m1qiX-00e5dj; Thu, 21 Oct 2021 17:34:27 +0200
Received: by mail-wm1-f53.google.com with SMTP id b189-20020a1c1bc6000000b0030da052dd4fso64056wmb.3;
        Thu, 21 Oct 2021 08:34:27 -0700 (PDT)
X-Gm-Message-State: AOAM533Fr76vXoWaw+IUORZMPUCmhxNNnLcaBdx34heMik5C6rMvcMWP
	yMEDKvOrcCFFy00f+C5DsPeYoswUZ6hV9DpdTqU=
X-Google-Smtp-Source: ABdhPJxXncWjnG0sJW6NQ2Y9XBmC9AcHboOLxbofUUlK3ALWGyEu4Nd9mK94PrbsNQQGlWRLZDhWj2rD2O1jkn6ZwhY=
X-Received: by 2002:a05:600c:4f42:: with SMTP id m2mr21988450wmq.82.1634830466894;
 Thu, 21 Oct 2021 08:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211021151736.2096926-1-pan@semihalf.com> <20211021151736.2096926-2-pan@semihalf.com>
In-Reply-To: <20211021151736.2096926-2-pan@semihalf.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Oct 2021 17:34:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1i_23yBht0f86GoHUeef+XXPg_ahkMy6ndARHqcrhKWA@mail.gmail.com>
Message-ID: <CAK8P3a1i_23yBht0f86GoHUeef+XXPg_ahkMy6ndARHqcrhKWA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] dts: socfpga: Add Mercury+ AA1 devicetree
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, upstream@semihalf.com, 
	Marcin Wojtas <mw@semihalf.com>, Konrad Adamczyk <ka@semihalf.com>, Jacek Majkowski <jam@semihalf.com>, 
	Tomasz Nowicki <tn@semihalf.com>, Alexandru Stan <amstan@google.com>, 
	Joanna Brozek <jbrozek@antmicro.com>, Mariusz Glebocki <mglebocki@antmicro.com>, 
	Tomasz Gorochowik <tgorochowik@antmicro.com>, Maciej Mikunda <mmikunda@antmicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V5EWgDGYd2sPZamjSRexEj4PeffN+NVH8OjP2PC4usD15o/DPJC
 BaqT2sx5Tg6E5GvqzYsCdGQEr5BpNCwFzffqSWrpHVg7+mOyLtTW2deV2XfBGGtdnFET9DW
 H2IOSss050iqu6yOV77B7CEa+OhGSdS1AZuQXQfRNfnINLEYL0N96H02gFOo7nd65Qq+65S
 e1LcnorfygFcpVAoF5qbA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a71Zwk0ZLwY=:47Kvjgd0rGbkJWb0y8G9Wc
 jxq3Wqs4Z2W/6EkisLgeybBpn0Ms1OzibngcihnOiLOFaUtYLNd85wYYxUE8cvCLFgmQ/AJUb
 R/wyBBqgJ1IjJIOdtVFrf1wK30e4xedZKg6/SlUV2XoD5k+g1eulQOFSz7/YEw33rs8K9varc
 sMJmZwaN+4qWsxlGor5/ppb3gDc72f5bsZT9FIdFf5KJJ6BOpWZ6qDeT3HXVxlqsc4RaMngFI
 vrHctwj2UmnNGJtOh+wlCgf++TYg1WYaxleuX1kQPEngtqJC+ZblvU4Le+7xNxERqhRchF1Ta
 vT1V+3RYOpZ5LL6t7SJ6O/V8JntSkCEDbT39C+sy9BcZy7rh4TyI4T0AX3UtBAFKzNvMv8YHY
 T5RreqE12IcX4E5jCrzHiHg3rDzf+m+5R5WtcvI9ohqTO9v+fazW9q/e8vr5kBgNnwF/bgLjx
 5A4E0AjOe2pXBnSuxrxC0RZPphgQNxgQLSCHT6Dzca5Lgd+iUbZHlI5iznfsNv8Oo8sWw8KZk
 /pO8Swj0OvnDZB1pPhrcbuhKcEn+Prddel5iRkDpgyijE/N+jj0yEajR3Sa9M/uOZuNuJz7hr
 cMil4FBmACDZU5CJSsLh4BA0qTpr4vrZSN3NWp6IDJ4W8c2CBaPrA6guk1pBQcNRW294hHEBM
 c3eusbcqcpWnQvqLEX8H2/RxhOXlIL59mt22+btamul2Fc1xTp8Lvdj8/kcjpGVZOhCTRdeo1
 ryklFSYkVfISZ2D+nslFVkKnSPEd/ga5IfzstRzn3kyk2HpXHGRNY+nRG6m1PGyHm3Vq5ljhr
 U0+KqQ/6ILHrWeoVddb+zaCnp1M51Dekj2/vtkR2pKrsJ2QldQ=

On Thu, Oct 21, 2021 at 5:17 PM Pawe=C5=82 Anikiel <pan@semihalf.com> wrote=
:
>
> Add support for the Mercury+ AA1 module for Arria 10 SoC FPGA.
>
> Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
> Signed-off-by: Joanna Brozek <jbrozek@antmicro.com>
> Signed-off-by: Mariusz Glebocki <mglebocki@antmicro.com>
> Signed-off-by: Tomasz Gorochowik <tgorochowik@antmicro.com>
> Signed-off-by: Maciej Mikunda <mmikunda@antmicro.com>

Thank you for the respin, looks good to me now.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Dinh, are you planning to pick this up into your socfpga tree, or
should I apply it directly to the soc tree this time?

        Arnd
