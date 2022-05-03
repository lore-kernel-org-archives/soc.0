Return-Path: <SRS0=yZUZ=VL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8622C433EF
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 12:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC550C385AE; Tue,  3 May 2022 12:53:09 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85E9EC385A9;
	Tue,  3 May 2022 12:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 85E9EC385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f174.google.com ([209.85.128.174]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mqro7-1o7iF01g4P-00mroq; Tue, 03 May 2022 14:52:59 +0200
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2f7ca2ce255so178206657b3.7;
        Tue, 03 May 2022 05:52:58 -0700 (PDT)
X-Gm-Message-State: AOAM533bxI8x/UkrxDrrQyJVwpPM3S46c/eNPpP5sJob4C3/NtXZzmSE
	NT4BsqSxHyyvFxo9ADsixs8jKMtIOMlBkRLxD7Y=
X-Google-Smtp-Source: ABdhPJyv1laW6E185MTLjPzEFveupItqW/H+SSTMlTqCVUIee6w3ZqqHo0k5z6EM5wkvOIryiG8mHw/gvMCwhJyPJWk=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr15626133ywk.209.1651582377937; Tue, 03
 May 2022 05:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151055.6851-1-takayoshi.shimamoto.360@gmail.com>
In-Reply-To: <20220421151055.6851-1-takayoshi.shimamoto.360@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 May 2022 14:52:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2pc5nUpGr_KQdhFZPm+vm5SfAzyUEy0=P3FVhfhdbNUQ@mail.gmail.com>
Message-ID: <CAK8P3a2pc5nUpGr_KQdhFZPm+vm5SfAzyUEy0=P3FVhfhdbNUQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add DT for WZR-1166DHP,DHP2
To: SHIMAMOTO Takayoshi <takayoshi.shimamoto.360@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1ugpsV0f3CnxkmVpKjnGjq27smZpx1F6vNqA8GgE5m64iKeDIk5
 lqAG4FwtgBw3yvRfWhsc1IR+wFyIFgseB41OpZp4UghDgkjSjA1EzpzpnV3ueG8EjgLMPQt
 PzgbZVzPYe1eatj7ERlrJ99q6BzsKIim9srWthYjHIdXQbSeTdWGp5gNhuXonrVeumhX8rG
 rLzYM2NIwV1jHMezsSuzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ma37jIN975I=:/jcGm5Rq0f/4WDuTewL+l+
 c+yWcd2WsGvMFsG/8uWNScUuPOJKzlWlb9/Pfb/Q7FjiPMiW54cXNfUIr0uTljn1+asxd1vND
 I0v5LvAoUibZvVBGR8Bpi1dtpoNLbOM7+Y820tvxJmRSVbhhE6ridaLA/cbbi0SwgOgjP4+6z
 dGDvekQAbxBX2TbwvhaELallJIHWxyQCJbILV+jzCY0f/QNr/dva/hcJ+74CrXSCFUQWSz6l+
 fjcANwaCPbsERDPnqLzn2uq9QjiQes5FaRJ5ENbabd17f8aSLwf4pazhBYCZ4rdtyBD6KG9FN
 QUaqSvxPFmtjI8lQXUEISFxWgXOspFbRQAE49mrmIzZL75DOy1R5mi6j4S6JdC8J5RCBOl+gv
 tqcReLN7bqODt070n4XK+QfyDZ4j2trsI9QFFvCzW2PTgrsk2wpF0I9rhm29zI9a5OqipHiv2
 2QKybYe/QYUOG5bge7V/uR0jycAra9qckRsfQvuYTtGt/UGPE0d0Thm6ixgzBYDucB4fby9v9
 B8+hiQZJ8XRulpm8IIzA/UEPsadkycb+ZAx34ZVilx9Kun4otjN2/BaJpCqVigIKJI4ykBpXz
 n0JdRsgQ4YVdd9Bnf0ecozy8ubpDbOybBs5ezSJB7hrFpvTvirHA99tVWYiLQ+UF0QLOvxsK/
 u1deYgbUtL5LheD9eRNDYQW1sW6Ka2ISvk2hTocTQENkgdiB3emJykTP+UWlMHMqqQXPW+Ckf
 tShtCFBuIOHKbY5CmTnatwQEuuw12ftjwfufoLs+Pb7OB0yGdjSkSX2cg0JdhpSPSM01htoJE
 bAX/ByCSxTwXkFYBfzgZcGEdpNlY5lHeTARbCGxj+cSTai18q8=

On Thu, Apr 21, 2022 at 5:10 PM SHIMAMOTO Takayoshi
<takayoshi.shimamoto.360@gmail.com> wrote:
>
>   Buffalo WZR-1166DHP/WZR-1166DHP2  wireless router with
>
>     - BCM4708A0
>     - 128MiB NAND flash
>     - 2T2R 11ac/a/b/g/n Wi-Fi
>     - 4x 10/100/1000M ethernet switch
>     - 1x USB 3.0 port
>
>   WZR-1166DHP and WZR-1166DHP2 have different memory capacity.
>
>   WZR-1166DHP
>     - 512 MiB DDR2 SDRAM
>
>   WZR-1166DHP2
>     - 256 MiB DDR2 SDRAM
>
>   These hardware components are very similar to the WZR-1750DHP
>    except for the number of antennas.
>
> Signed-off-by: SHIMAMOTO Takayoshi <takayoshi.shimamoto.360@gmail.com>

This looks ok to me, I expect that Florian will be able to apply this in the
Broadcom tree if he hasn't already. Note: there is no need to Cc the
soc@kernel.org address on dts file submissions, this is only necessary
if you want me to pick it up directly, e.g. for platforms without an active
maintainer, or when changes need to go across multiple platforms.

       Arnd
