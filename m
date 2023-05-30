Return-Path: <SRS0=Cgdr=BT=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74596C77B73
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 12:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E055C433D2; Tue, 30 May 2023 12:40:10 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66C01C433EF
	for <soc@kernel.org>; Tue, 30 May 2023 12:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66C01C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-568900c331aso24438487b3.3
        for <soc@kernel.org>; Tue, 30 May 2023 05:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685450407; x=1688042407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOtUrb1jXt1YTc92Nx2K8yaF1tV0C2PLHIJDBXMJ1e8=;
        b=Xzaug7RhDfquxOwHHHTAUcmTCtkuzS5zRcWlYeEfobpHfoMjVlAS/CwdmhocJy+96e
         GWYVY+IToJWNf9RtM9CIM/4PkuKAlXjNuQvcsVuWPFSx3X7+/JzWNPUl91BQ2ra5ZCl9
         WONJg0uWUzsOzjrDyIK0shIC3ZgS5EfKxfg2hGcKlFIk5QoOXa0c6mbUMYZXh+tuhlZT
         /PitNi3wMZcN5EZ+MZKSUEOGbHJh1N3Gc9VcsdvFdffGhb2KSAG9ISFWbZVIgAazwWrD
         CTGPKjvp6w9IHZGE8jnBotfig/8ctvxCSmFJUU35tgunJYFbWHAKP83CjH6vJNj44Vm2
         b5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685450407; x=1688042407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOtUrb1jXt1YTc92Nx2K8yaF1tV0C2PLHIJDBXMJ1e8=;
        b=SjWaPZtSuVOQlwQ4LlmhJlSiKyYw5oyKAVuDtku9OT4eLhzt7pgPavo6aNmSM0qIQ1
         OIY2+LI5vzfsMNdAKjB/O5omIAg3DMPujImTZQb9yobhoCQFXDvFtPl7FMUChmd/fz28
         Ht8JrKKZEuxm9xHYyOT9ZBm1gnASEDEu/fGDKEAvdKEhGM/zTTt4udOB+XLF3B7PNY5/
         5/lzPP/tBMcPCNRvWqfE7wEsujkNhwQk1PkvrLSp5/+lis3RCDQ98Z6xNERBGx+b134W
         FaHsrdSRapX2fL3xu23CuDg2KKZVDDAzh6BjIXCeZ7uE05t/pBwqP+qdJDjyLfHHKfd4
         dE2A==
X-Gm-Message-State: AC+VfDw55vo6ZqnjrDR9CVdtIlxYvDRJktzaFgBHzJNUWA7JCE5vGNYw
	B7ddbTFtY1R2spZi8TFK1TUqlDKGb9kl8527yIz5BQ==
X-Google-Smtp-Source: ACHHUZ5IRGVEGgUUERDvrDWcgtVuSj/SsOzSJ38VVusLz/5pCio/b35QywJsy1pwoBoZoBBFa8YeImTExOj4H4CgVzs=
X-Received: by 2002:a81:83d6:0:b0:566:a76a:fcc2 with SMTP id
 t205-20020a8183d6000000b00566a76afcc2mr2345411ywf.4.1685450407354; Tue, 30
 May 2023 05:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 May 2023 14:39:56 +0200
Message-ID: <CACRpkdboHeg-=thHvZrQXcx_HnecwmuBJskJTPjxFOB9z9R0gw@mail.gmail.com>
Subject: Re: [PATCH 00/11] Add STM32MP25 support
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 6:20=E2=80=AFPM Alexandre Torgue
<alexandre.torgue@foss.st.com> wrote:

> Alexandre Torgue (10):
>   dt-bindings: pinctrl: stm32: support for stm32mp257 and additional
>     packages
>   pinctrl: stm32: add stm32mp257 pinctrl support

Can patch 1 & 2 be applied to the pinctrl tree separately?

Yours,
Linus Walleij
