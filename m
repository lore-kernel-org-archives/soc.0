Return-Path: <SRS0=2Acm=TI=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D208FC433F5
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 16:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7BACC340F0; Fri, 25 Feb 2022 16:54:11 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF37AC340E7;
	Fri, 25 Feb 2022 16:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF37AC340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MGiF0-1nSe3p3WS2-00Dnjz; Fri, 25 Feb 2022 17:54:07 +0100
Received: by mail-wr1-f47.google.com with SMTP id d28so5432885wra.4;
        Fri, 25 Feb 2022 08:54:07 -0800 (PST)
X-Gm-Message-State: AOAM533cgcOaoVm2wurw/ubH6JUmpBVCfYfFno9qQ/2q8HR1Xbl3rvV5
	mQZmbMmS21j/pr5fIJDBH+3P6MdTC3Paf9n7+r8=
X-Google-Smtp-Source: ABdhPJzBE/88fgepeIkLrgP+6ufSjJXxTY3orPcH5E65v66JIJxC3/5Pi3lZHiE47if+E3yc0ip25xY+M5vKqX6CMlE=
X-Received: by 2002:adf:a446:0:b0:1ed:c41b:cf13 with SMTP id
 e6-20020adfa446000000b001edc41bcf13mr7239380wra.407.1645808047500; Fri, 25
 Feb 2022 08:54:07 -0800 (PST)
MIME-Version: 1.0
References: <9977257.a15B8eIVjX@phil>
In-Reply-To: <9977257.a15B8eIVjX@phil>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Feb 2022 17:53:51 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2=-wg_LFtOoeN47EoxnAhG+39sgFsVvH+mvNQpKvrOww@mail.gmail.com>
Message-ID: <CAK8P3a2=-wg_LFtOoeN47EoxnAhG+39sgFsVvH+mvNQpKvrOww@mail.gmail.com>
Subject: Re: [GIT PULL] Rockchip driver changes for 5.18 #1
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:n+kvjugY1JslPRfTtOxUaA5NrhkjMNE2GKaUX2lyewmvdSyxcDv
 ExlJWb4rUtoMu8fb2cxTRu2rgoWqXCrWE5x9Fj7wYbz6WsNaL1ET7Ap63/Fv2sLg0c5jg4V
 H3MYXxnaVKTF+1/ryw7UK9qLfEzzFqTsmJjLm8VwuojgGALmFiKNOBGrPDt9TpUjO5eEoyK
 h2D/WLeqvugXKr7GjqxgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PMIob7drT+k=:TjBFnkecQ+qzrUem2Q08mS
 aqctDQlomHfV+kuyjCFz2y07aD/1fwtBYCPD99MPrc2nMyvxr/PIWfV68B6C2qIwzO3qoPj7O
 9PFSHWH+r/3HowROYLGZGaFssCgNOksWY6+bfY9NPI9DHcROyV3NM/O91uw9RGqNbCQh7c7Ug
 ykOrjMB9EgLU2V7JipyUJ5bzcpIQXLOFTG4OFTkjoJwCJbAwKr2BdxS5IOlEm2M0OwFHnPpVG
 4bNjk/rOycnWJIzgt2irnRUb7q6yQJtYKr5Oxe8EJz04QFk1/qZ08PWC10DEU35Ewuoj8+V+u
 KCuGKgTlgGthw/01sVAumda0k8TFSNzTJwk0/kQrBBIG9lqwB+FG/Cm0/8Y7kzHx/9V3gr3tI
 eC3qq4d2v9ZLr+23Hg+xf6rggYXyDmTCKpxf3AzIpK9t2E3ZmM6qTme2ZKv+sUKwCy2iudMUi
 Yo1kOBnUZWrUoG1wxx9/FTr+/6pjLTusB1O2Kp9cu+eFJ+f53wNaadE7goXIIk+sV4IIm9q1/
 cbw5l/WKRYcaIploPXPr0QfClzZNS1xtuJIur8o1X5iCWSTkUoIs7PPrk6ktZM8d8K569se7q
 bYwdzdlik+AaxtLD9D7tbkQ5N21hFlC+XSTgdJEcroGWvY5RzihifnfXg8wDLdGR5tbkG1LJU
 cq5bqsnaNwNpji5nNQgIP2ipmp2X1aAmck3+/J8mzZMBfWRmz0QoL+mOMvLgBAQ9GpzA=

On Fri, Feb 25, 2022 at 12:20 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
>
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.18-rockchip-drivers-1
>
> for you to fetch changes up to 7dbb47d64acf4aac131a2aaade726913aa62abe7:
>
>   dt-bindings: soc: rockchip: add rk3568-usb2phy-grf (2022-01-23 13:35:06 +0100)
>
> ----------------------------------------------------------------
> Compatible for the rk3568-usb2phy-grf.
>
> ----------------------------------------------------------------
> Peter Geis (1):
>       dt-bindings: soc: rockchip: add rk3568-usb2phy-grf
>
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>  1 file changed, 1 insertion(+)

I've merged this into the arm/dt branch along with the dts changes.
Generally speaking, any binding changes can go through either
the driver or dts branches, or both. In this case putting it into the
dt64 branch would have been easier.

         Arnd
