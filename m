Return-Path: <SRS0=Ovlb=VZ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D53DC433F5
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 14:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5827CC36AE5; Tue, 17 May 2022 14:56:44 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B9BD1C385B8;
	Tue, 17 May 2022 14:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B9BD1C385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f175.google.com ([209.85.128.175]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MatZr-1nJ1Nr1i7n-00cTRn; Tue, 17 May 2022 16:56:40 +0200
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2fefb051547so62085917b3.5;
        Tue, 17 May 2022 07:56:39 -0700 (PDT)
X-Gm-Message-State: AOAM531wO2MPFX4iEhN1geYaj90ZNulxkSNfh1uj3Ez5E6gOIRv3fzzS
	Q/c2s6F7RqTaH/215B+rHrXooRdNWTrErVl0YZ8=
X-Google-Smtp-Source: ABdhPJzfQfMq9H+I8M/viBf/bZGDpOu9d60f+7Mz7Q+Kz6SQ6MND8STnx2JgGosiR2GP3lJ5ACWXszxYKv0jdRmGk1s=
X-Received: by 2002:a0d:cd06:0:b0:2f8:f39c:4cfc with SMTP id
 p6-20020a0dcd06000000b002f8f39c4cfcmr26196437ywd.495.1652799398796; Tue, 17
 May 2022 07:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220407204115.34350-1-krzysztof.kozlowski@linaro.org> <YoOZ4TawKslvu01w@xhacker>
In-Reply-To: <YoOZ4TawKslvu01w@xhacker>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 17 May 2022 15:56:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a34dz7Fkk3jbwNq45BRHMt9tGuO=r5NJDiAuMyX05xW6g@mail.gmail.com>
Message-ID: <CAK8P3a34dz7Fkk3jbwNq45BRHMt9tGuO=r5NJDiAuMyX05xW6g@mail.gmail.com>
Subject: Re: [RESEND PATCH] arm64: dts: synaptics: remove unused DTSI for AS370
To: Jisheng Zhang <jszhang@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1ytV9Ii5A1saBNLptj/K0jlQb2kElRmPU68ZXsAWhVRkix5Sup4
 ZQLO1QB5Fb1O5f5UKaXxCy6zTJfkmKNARA9owc4YcPrfsZP/bKUYHQjKY3HZdDG6JvgrEt/
 hv3cPskaS99bBnZ9xs+hvVeteveE60Pv/LLnaXWAW904p15QHfX0xJsMqMDFgCOfySFW/yC
 UgGhIGA+wiPV19A5eLv/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jjEmTRtrKxg=:/GNoVd29RCNVaLotrs0lVG
 +fmCSdC599LZlyE/JRE10iPsSqMwmEzz3M1noLZ7bVrqW32IEjKUIDrwXkWNyb4SVORLAK4PF
 5jM+26ChaAS7pMrwfJnjA2jJw5rt1xOUjfXCcUYUNAvV50T6QB1HDuoirtrSG0NnFMQJxTjDc
 aq9EwWkX9dah/r3MJwuBRUtwlHnhNZOUDyZIClvypEhZIKHpJRUWyOMK3Qe7NawPhxeJQ7adJ
 Xu8E2SJbbx53P2QhWybpIsStlkL2r6kKZWJHQOkyZ9rs23QfT8p7YJk9pRZWpnbUpCYbgYsTa
 ZtcMgFa/+6ipd3DaVuVIwJy5L7uOCsqxlo/L1xe0p9JPLnqfjEC6W/1/X8Ri59dA4ieuLwnxd
 3x3vo9IAMkbGcP1zDL3VMCf34zbekAU20IAobwmmDR3ojzc+Nr4ltdSEW6LrA5mLHjQCfUNRa
 zrOaCQDXF4UbuV/iHHaClp9YPaxfV/geubXgkj15BTexUcc2U1mzv5XVtXbPbZVOhA1x+bsJo
 xTa94bpd5uWli0fuGeJdCf1FZN4JFTRrwwCY7/NoJyRMgTdVyu6RdoBBbLfwN55aTnQ8Vze8f
 tFeHchkJUlN3NmzfVtdUFIqQc25B4pcgqnj+1RBJDbywjpAZ+v5yjdtqeDSzPP9at/ZHw2PcT
 2kvx520q+6Sjo9oFUDqfoFymT37VqRpuXm9mpGpnghGXRa0+dGT8SmFaBj/jh/s3BFIB2DTIs
 T9obXiFQtWa9M0o1l+magf7SN8QbSgdrdiOWqQ==

On Tue, May 17, 2022 at 1:49 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> On Thu, Apr 07, 2022 at 10:41:15PM +0200, Krzysztof Kozlowski wrote:
> > The as370.dtsi for Synaptics AS370 SoC does not have a user (DTS board
> > file), is uncompilable and untestable.  It was added back in 2018.  No
> > user appeared since that time, so assume it won't be added.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Acked-by: Rob Herring <robh@kernel.org>
>
> Acked-by: Jisheng Zhang <jszhang@kernel.org>
>
> Hi Arnd, Olof,
>
> This is the only one patch of berlin-soc for v5.19, Can you please
> take it?

I had already applied when Krzysztof sent it, but forgot to send
a notification about it.

         Arnd
