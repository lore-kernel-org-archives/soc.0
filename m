Return-Path: <SRS0=6XfY=Y5=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183C8C28D13
	for <soc@archiver.kernel.org>; Thu, 25 Aug 2022 12:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6845C433D7; Thu, 25 Aug 2022 12:35:51 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48480C433D6;
	Thu, 25 Aug 2022 12:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48480C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ej1-f48.google.com ([209.85.218.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MTAJr-1orkqZ0hiR-00UbOc; Thu, 25 Aug 2022 14:35:48 +0200
Received: by mail-ej1-f48.google.com with SMTP id gb36so39208986ejc.10;
        Thu, 25 Aug 2022 05:35:48 -0700 (PDT)
X-Gm-Message-State: ACgBeo2WMqy24SPYgDsjLHLNAZQ7p/LUC33Npvc693jXEVm+PgfAZYi7
	aYZqlaU9ngHyQvjz3BfAmhjWVAJM482TOZxSjpo=
X-Google-Smtp-Source: AA6agR7fgaLb9s7H5/Li4IutxFIzar492nAzVxOsAVeMPK8zWfEAvRnEz1Shj5SNAoM6ETiorM4CGcoYPkDi98xLJSQ=
X-Received: by 2002:a17:906:8458:b0:73d:d0e9:4b27 with SMTP id
 e24-20020a170906845800b0073dd0e94b27mr1897590ejy.766.1661430947749; Thu, 25
 Aug 2022 05:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
 <20220817071539.176110-3-quan@os.amperecomputing.com> <CACPK8XdDpG3ONM1=-E6qvHL1FgMNWSMPoL_sVGJK6BmmnT3w_w@mail.gmail.com>
 <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com> <673e200f-f458-7866-f956-3d5bd7160a49@os.amperecomputing.com>
In-Reply-To: <673e200f-f458-7866-f956-3d5bd7160a49@os.amperecomputing.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 25 Aug 2022 14:35:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3MU7shuBpcpRNC5L6xxQmSy8FXCX1jvYXhv-NT3PMYOw@mail.gmail.com>
Message-ID: <CAK8P3a3MU7shuBpcpRNC5L6xxQmSy8FXCX1jvYXhv-NT3PMYOw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
To: Quan Nguyen <quan@os.amperecomputing.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	Open Source Submission <patches@amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, 
	thang@os.amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zS/G0UOpGn3FzcVasQWxCaXf1RO1R4FJnLhS8cJWKjg9Rvss24S
 JIySXS3VkKhKyaYtN6a24CA1YaTn3wWFYAa13aa9DNqwZJwf/ZTgYz4zuIcfOWx5y3ITGHn
 NDmSbPB2W9rRZ9Xy/Jwukp1Jd6dHItzCcW9IsD60PWrfNI0k+H5nnAR5L6ZWBXXhdM7rBKq
 cMD/psjcAX/R7yVnKebNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7oIwi5AqHEs=:3krLjS3Ux41G4vToiES0bE
 GEEWbUx1DTidILDJWPMI1V94m0dYZ+K9LoG4pgC9B852+eVqljINc5LeDDQ+wEHxmUXiD+Kau
 +d9Rb9Nm0Q26XXZ6cH6rtUbiEGAUHVJGNOITw7N3CdIz8AcyamyhptWrMzM81ls7jJq8sGbSr
 bVZJMVmaZPqbV1HxOpZvC63uI6QhmaEe3U0nLkwgEAXfDvmi4aoEGdupgNQsJZogXoEQrGVw3
 WpIOccxzeIRu9oQ+p3hlnRdpBnHN6fx+72PLcLvgbxEzpSjCZFHXBPfEXftP2msptHjkjANge
 O8TtmmrB05cMM9HyiPubEIwxPTsGhXEfR+UpWVtAUmf47Rajf5G9z8AW9vQlkZAEU4nowanam
 HGfkcergz6ukUhFE0gQjZsVqm/xMi1JrtHJM4KOLN45/E4eoe+3Up+Y/MmvRFHfKk1z5hWJyV
 BZF2g6TEtKQuKzSjlFvS2msyE8cuvyZXJ3Ow9MAcNXBA93OFZi/ezWKnhCAIyxktojF/Gw7Eg
 rQmHXh50TdKMwmHJSU46xH+ESVvPI3FakbbpFYs3r1+QEgvxAcdwCSh6hjUpSM4jBV4+t2cGB
 YWzw19MItSSObLmj+sJenQ7MkixYO95nud8lO1Uc2IJkN1PGl7/4qENpCSY+iCO8k4OuscTgm
 bCN3gP7+/sVDqyPIBr2b0thkvV2xt4GQAAfigpRwksj4UucQXvZUMcecbmthDyLTUqpkTVZxs
 UspP5CG3htw/CpuHmfGz+ZBbm5cmjJa8lVThzB0GEsLhj05AWi/lYJigCmHATfbyVAT2crSun
 8snLproWexyABdeskNIrvlUN3C12AwNSsXwdSfsPAJg7RA0cqYhV9cfIkrK5Yvl5FVVui9Qkv
 m2FPvlWyrXAIhdG4ZyIA==

On Tue, Aug 23, 2022 at 10:27 AM Quan Nguyen
<quan@os.amperecomputing.com> wrote:
> On 18/08/2022 19:06, Arnd Bergmann wrote:
>
> Thanks Arnd for the comment.
>
> I think adding -append could solve the issue.
>
> But as the bootargs still exist in all other
> arch/arm/boot/dts/aspeed-bmc-*.dts should we still keep bootargs for
> this dts?

I think it should still be removed. Only 238 of 2547 set the console using
bootargs, so that would make it more consistent with the other files.

Changing the files that have the same issue is a separate matter.

      Arnd
