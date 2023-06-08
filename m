Return-Path: <SRS0=yEKB=B4=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D5FC7EE23
	for <soc@archiver.kernel.org>; Thu,  8 Jun 2023 13:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED757C433D2; Thu,  8 Jun 2023 13:50:07 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FEB6C4339C
	for <soc@kernel.org>; Thu,  8 Jun 2023 13:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FEB6C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-bb1f7c5495dso729717276.3
        for <soc@kernel.org>; Thu, 08 Jun 2023 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686232205; x=1688824205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8QpnJSVLjkLfqhjKetMXB1z/ynBlgTXzzXr8NIKQBg=;
        b=eoeJediBHOzQ4sCzvkREN7NkrM+aOyYC9wrM0BBnD9QxoBLoy5vPtbG+E2gPKOhIwu
         EyNOe2N8inNUgS6tjtZnWsksbeCvcU8AoFBZ6DobK57j0QMubICD10enZz9lOfMoiZto
         dnEvHA8rWj9ZLoqv3YvVr4raYrYLM79xqk8YTt2cbBiEZAPfbmHKLO3XZuEbr0szb/95
         SsCYDLUHDN/89usT82gCPbSachy3FrjGTVQM2qjW2EJ9uSXC3cX2taX/RguroKB4gpOF
         aOvxH6ic6qAbhoKc4/toPBBjaozoEySEUg2T2tBycGzEMbSPSZvDTUa9JAlMnTpiNlUU
         uJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686232205; x=1688824205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8QpnJSVLjkLfqhjKetMXB1z/ynBlgTXzzXr8NIKQBg=;
        b=buDnImAz5sJrrdvr7LnAKyTI2ZDRZp+edbM3yYfnDPJlFVIWP/js24nSKILs7MBu3E
         ekmuC9AYJIcSxt3jBzUeoyWyeXKOLTXeEYEd1JXMFnr52+X2JCMAgxRAtTsCi0VfUXou
         bg0enHRqx4dId/C7vsRLd2fAe6t5TdF4XK/mPv+f7LECuaONr10RSPOnTocJyqYLWnMo
         6rtTHE4kk0pp9rFyqPa9K9vLvt2PRIPYmmqMhLWtqlVdW9Xv4Ub99WFoe2x56+NZi4+p
         criXyLc3Hh0LzgDtKrxQVQW1O92zgJl+IF4hLnKYBeRTTs8tqN+XMJCA4UD41CCyIcU3
         hmKg==
X-Gm-Message-State: AC+VfDzkWNbppFD5cmGjGoiAO55/ol7cgAHh3nLPuyQOXgyEk9t6GotG
	CWCP7Nd9Nw8SSMp2aLIszqvpK6OQzFbFLFvd5A6bAw==
X-Google-Smtp-Source: ACHHUZ7B7bXPRaT8K13It0iwZz1KqJEF7lXGqjS4rO8Dx3uKOw8HQryytQq7nhVtQCV6nX83IX6Uwme+LOGCLFP0Fx4=
X-Received: by 2002:a81:6a87:0:b0:568:fe3a:46b3 with SMTP id
 f129-20020a816a87000000b00568fe3a46b3mr10251209ywc.28.1686232205112; Thu, 08
 Jun 2023 06:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230602132859.16442-1-alexandre.torgue@foss.st.com> <20230602132859.16442-3-alexandre.torgue@foss.st.com>
In-Reply-To: <20230602132859.16442-3-alexandre.torgue@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Jun 2023 15:49:54 +0200
Message-ID: <CACRpkdahyWFFscLYTDBGGSp-67_+4Qj1dsDif-jDFWoEK0mXzw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pinctrl: stm32: add stm32mp257 pinctrl support
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

On Fri, Jun 2, 2023 at 3:29=E2=80=AFPM Alexandre Torgue
<alexandre.torgue@foss.st.com> wrote:

> Add stm32mp257 pinctrl support.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please merge the whole series through ARM SoC with my ACK.

Yours,
Linus Walleij
