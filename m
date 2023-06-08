Return-Path: <SRS0=yEKB=B4=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FFDC7EE23
	for <soc@archiver.kernel.org>; Thu,  8 Jun 2023 13:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35023C4339B; Thu,  8 Jun 2023 13:49:34 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0709C4339C
	for <soc@kernel.org>; Thu,  8 Jun 2023 13:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0709C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-565eaf83853so5294817b3.3
        for <soc@kernel.org>; Thu, 08 Jun 2023 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686232171; x=1688824171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P56s/voLHkz9fUG5m5v1nOf0525Duw0HPDuYpPu2ReM=;
        b=XQhaWUg4NNNWhrtz7+MZHk2QdA7s/roFGIVPLnK0vYjqjh0bnUgEo2bj1XZIgUQ1iA
         /e+9m0k+DrUY8JkV1xE1yv4VkTJYISmVh4fZEQUYMGXd3uDm3A0F2QNa12MUwEd2jlDg
         7WIFGFhYWGhdcV59xU9cyzkjmzNzS9RWhx1KkPeb6FaGt1XQFB+UknIhvmO98iBUvr0s
         yptENh3XywYJfFYIgq5hLBEsnATCPLUOtme1aZr7fEeSod0VgIU73cDzB9mSz1SD/XF8
         v+te5N51IxfMSiEgb2Q9gwdSNOvayRUwrObVswhRUzurqlWZWFz5HFS+8ktmGPhvg8w0
         JxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686232171; x=1688824171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P56s/voLHkz9fUG5m5v1nOf0525Duw0HPDuYpPu2ReM=;
        b=i7AxFS0SqwayawRl2D0ClTr9c6BPpW+yIzBrf0SaS1H4rhOBxuSeuP4IomzauqrJcZ
         Mt/bZ7/yC94UFa80ZOuf/VSItx9mH5ooh4p86hg97JisIzPfQRdvZeFRU8Ij02VJ+ma/
         EwrVUfRvLk3fDkxzm1WRaOGXwIx1oQ7vpsHZSnQkdJyd02gCjC4BwXkcY2OnAV9P/lDR
         AOZYfXjU7i6lhVNC2avxuUTl3+LYSa72Tq4NswNAI2q7tkDjfpDR8VugHMl00OnUaQV5
         kxPg2OkP2qljqq/gSEI5SQYZkWJ0fSZ9cVX0C/gq8KX5RbXS1C3PuFta7AUad6g02aJ5
         TXgg==
X-Gm-Message-State: AC+VfDzyfuhsMw/B+RMy2lxqg86Ris4vXBQ2OmQ/cNH1s1S2eYPEyOHa
	383GQyAI73mOfQv5D4TH6owocUKoCeovZR+1fxN5Vg==
X-Google-Smtp-Source: ACHHUZ5eXsDecBMtO7ySuimFpWWeTqFYH2re76w5Dnn1LSeeXWU9A3vaOUQvV936Dz7XNFemSfa1s4dg08eO7ndqpLw=
X-Received: by 2002:a0d:df49:0:b0:55a:ad0a:76c with SMTP id
 i70-20020a0ddf49000000b0055aad0a076cmr10808163ywe.18.1686232171381; Thu, 08
 Jun 2023 06:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230602132859.16442-1-alexandre.torgue@foss.st.com> <20230602132859.16442-2-alexandre.torgue@foss.st.com>
In-Reply-To: <20230602132859.16442-2-alexandre.torgue@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Jun 2023 15:49:18 +0200
Message-ID: <CACRpkdZEEq_hL5OxVu16SZL4tKgFjXNZpFLuUxmeo96rrPMsYQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: pinctrl: stm32: support for
 stm32mp257 and additional packages
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

> Add support for st,stm32mp257-pinctrl and st,stm32mp257-z-pinctrl.
> Add packages AI, AK and AL (values : 0x100, 0x400 and 0x800)
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
